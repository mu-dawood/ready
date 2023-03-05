library responsive_data_table;

import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../animated_items/animated_item.dart';
import '../controllers/controllers.dart';
import '../dashboard/dashboard.dart';
import '../enums.dart';
import '../l10n/ready_localizations.dart';
import '../ready.dart';
import '../ready_list/ready_list.dart';
import '../shimmers/shimmers.dart';
import '../utils.dart';

part '_options.dart';
part 'custom_data_table.dart';
part 'data_table.dart';
part 'data_table_action.dart';
part 'data_table_source.dart';
part 'date_time_filter.dart';
part 'filters_button.dart';
part 'interfaces.dart';
part 'loading_button.dart';
part 'multi_option_filters.dart';
part 'search_filter.dart';
part 'single_option_filters.dart';
part 'time_filter.dart';
part 'toggle_filter.dart';

/// responsive data table
///
/// if [ResponsiveDataTableType.list] it will display [ReadyList]
///
/// if [ResponsiveDataTableType.table] it will display [PaginatedDataTable]
///
/// if type is null then next:
///
/// if width return  [LayoutType.large] or [LayoutType.xLarge] or [LayoutType.xxLarge]
class ResponsiveDataTable<T, TController extends ReadyListController<T>>
    extends InheritedWidget {
  /// show custom filter view
  final Widget Function(Widget filters)? buildFilters;

  /// Widget to show when there is selection
  /// if this is null , then there is no selection handlers will be added
  final SelectedButtonCallBack? selectionButton;

  /// options to be added at the top of the [ReadyList] or [DataTable]
  /// this is differ from the action of [DashboardItem] if you use it
  final List<Widget> actions;

  /// actions that will be assigned to each row
  final List<Action<T, TController>> rowActions;

  /// controller that extends [ReadyListController]
  final TController controller;

  /// when is not empty filter button will be added to the top of [DataTable]
  final List<DataTableFilter> filters;

  /// This will keep the state of tab
  final bool keepAlive;

  /// DataTable options
  final DataTableOptions<T>? dataTable;

  /// List options

  final ListOptions<T>? list;
  ResponsiveDataTable({
    Key? key,
    this.keepAlive = true,
    this.actions = const [],
    required this.dataTable,
    required this.list,
    ResponsiveDataTableType? type,
    this.rowActions = const [],
    required this.controller,
    this.buildFilters,
    this.selectionButton,
    this.filters = const [],
  }) : super(
          key: key,
          child: _builder<T, TController>(controller, type),
        );

  static LayoutBuilder _builder<T, TController extends ReadyListController<T>>(
      controller, ResponsiveDataTableType? type) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return _ResponsiveDataTable<T, TController>(
          controller: controller,
          type: type,
          constraints: constraints,
          options: context.dependOnInheritedWidgetOfExactType<
              ResponsiveDataTable<T, TController>>()!,
        );
      },
    );
  }

  @override
  bool updateShouldNotify(ResponsiveDataTable<T, TController> oldWidget) {
    return rowActions != oldWidget.rowActions ||
        dataTable != oldWidget.dataTable ||
        list != oldWidget.list ||
        actions != oldWidget.actions ||
        controller != oldWidget.controller ||
        filters != oldWidget.filters ||
        keepAlive != oldWidget.keepAlive ||
        selectionButton != oldWidget.selectionButton;
  }
}

class _ResponsiveDataTable<T, TController extends ReadyListController<T>>
    extends StatefulWidget {
  final TController controller;
  final ResponsiveDataTableType? type;
  final BoxConstraints constraints;
  final ResponsiveDataTable<T, TController> options;
  const _ResponsiveDataTable({
    required this.type,
    required this.constraints,
    required this.controller,
    required this.options,
  });

  @override
  __ResponsiveDataTableState<T, TController> createState() =>
      __ResponsiveDataTableState<T, TController>();
}

class __ResponsiveDataTableState<T, TController extends ReadyListController<T>>
    extends State<_ResponsiveDataTable<T, TController>>
    with AutomaticKeepAliveClientMixin {
  late _DataTableSource<T, TController> source;

  @override
  void dispose() {
    source.dispose();
    super.dispose();
  }

  @override
  void initState() {
    var options = widget.options;
    var preferredRows = ((widget.constraints.maxHeight - 170) ~/ 48);
    var availableRowsPerPage =
        options.dataTable!.availableRowsCount(preferredRows).toSet().toList();
    var rowsPerPage = options.dataTable!.initialRowsPerPage(preferredRows);
    if (!availableRowsPerPage.contains(rowsPerPage)) {
      rowsPerPage = availableRowsPerPage[0];
    }
    source = _DataTableSource<T, TController>(
      controller: widget.controller,
      allowSelection: options.selectionButton != null,
      buildRow: buildRow,
      paging: _DataTablePaging(
        availableRowsPerPage: availableRowsPerPage,
        rowsPerPage: rowsPerPage,
        columns: options.dataTable!.headers.length +
            (options.rowActions.isEmpty ? 0 : 1),
      ),
    );
    super.initState();
  }

  ///! build row and add actions
  List<Widget> buildRow(TController controller, int index, T item) {
    var items = widget.options.dataTable!.buildItem(index, item);
    var cells = <Widget>[];
    for (var item in items) {
      cells.add(ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 300, minWidth: 20),
        child: item,
      ));
    }
    if (widget.options.rowActions.isNotEmpty) {
      var actions = widget.options.rowActions;
      List<Widget> rActions = [];
      if (actions.length <= 3) {
        rActions.addAll(actions
            .map((e) => e.build(context, controller, item, index, false)));
      } else {
        rActions.add(SubmenuButton(
          menuChildren: actions
              .map((e) => e.build(context, controller, item, index, true))
              .toList(),
          child: const Icon(Icons.more_vert_rounded),
        ));
      }
      cells.add(MenuBar(
        style: MenuStyle(
          alignment: AlignmentDirectional.centerEnd,
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          elevation: MaterialStateProperty.all(0),
        ),
        children: rActions,
      ));
    }
    return cells;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var width = widget.constraints.maxWidth;
    var layout = Utils.detectLayout(width);
    var type = widget.type;
    if (type == null) {
      switch (layout) {
        case LayoutType.xSmall:
        case LayoutType.small:
        case LayoutType.medium:
          return list(context, layout);
        case LayoutType.large:
        case LayoutType.xLarge:
        case LayoutType.xxLarge:
          return dataTable(context);
      }
    } else {
      switch (type) {
        case ResponsiveDataTableType.table:
          return dataTable(context);
        case ResponsiveDataTableType.list:
          return list(context, layout);
      }
    }
  }

  Widget dataTable(BuildContext context) {
    var options = widget.options;
    return StreamBuilder(
      stream: widget.controller.stream,
      builder:
          (BuildContext context, AsyncSnapshot<ReadyListState<T>> snapshot) {
        return _DataTable<T, TController>(
          options: options,
          source: source,
        );
      },
    );
  }

  Widget list(BuildContext context, LayoutType layout) {
    var options = widget.options;
    var listOptions = widget.options.list!;
    return _ChangeNotifierListener(
      notifier: source,
      builder: (BuildContext context) {
        PageInfo.mayBeOf(context)?.clearActions();
        return Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ReadyList<T, TController>.grid(
                  scrollController: listOptions.scrollController,
                  footerSlivers: listOptions.footerSlivers,
                  innerFooterSlivers: listOptions.innerFooterSlivers,
                  placeholdersConfig: listOptions.placeholdersConfig,
                  showNoMoreText: listOptions.showNoMoreText,
                  allowRefresh: listOptions.allowRefresh,
                  allowLoadNext: listOptions.allowLoadNext,
                  noMoreText: listOptions.noMoreText,
                  loadMoreText: listOptions.loadMoreText,
                  padding: listOptions.padding,
                  reverse: listOptions.reverse,
                  allowFakeItems: listOptions.allowFakeItems,
                  shimmerScopeGradient: listOptions.shimmerScopeGradient,
                  shrinkWrap: listOptions.shrinkWrap,
                  axis: listOptions.axis,
                  physics: listOptions.physics,
                  topLevelFooterSlivers: listOptions.topLevelFooterSlivers,
                  topLevelHeaderSlivers: listOptions.topLevelHeaderSlivers,
                  pageSize: listOptions.pageSize,
                  handleNestedScrollViewOverlap:
                      listOptions.handleNestedScrollViewOverlap,
                  key: Key('$layout'),
                  keepAlive: false,
                  controller: widget.controller,
                  buildItem: (T? item, int index) {
                    return _buildListItem(context, index, item, layout);
                  },
                  headerSlivers: (controller) {
                    return [
                      _ListAppBar(source: source, options: options),
                      if (listOptions.headerSlivers != null)
                        ...listOptions.headerSlivers!.call(controller),
                    ];
                  },
                  gridDelegate: listOptions.gridDelegate ?? Grids.responsive,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildListItem(
      BuildContext context, int index, T? item, LayoutType layout) {
    var options = widget.options;
    var listOptions = widget.options.list!;
    if (item == null) {
      return Animated(
        fade: const FadeAnimation(),
        child: Shimmer(
          enabled: true,
          child: Card(
            child: ExpansionTile(
              title: const Text('......'),
              initiallyExpanded: true,
              leading: options.selectionButton == null
                  ? null
                  : Checkbox(
                      value: source.isSelected(index), onChanged: (v) {}),
              children: [
                const _Info(title: Text('....'), body: Text('........')),
                Divider(color: Theme.of(context).dividerColor),
                const ButtonBar(
                  children: [
                    CircleAvatar(),
                    SizedBox(width: 10),
                    CircleAvatar(),
                    SizedBox(width: 10),
                    CircleAvatar()
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }

    /// build actions
    List<Widget> actions = options.rowActions
        .map((action) =>
            action.build(context, widget.controller, item, index, false))
        .toList();

    /// check builder method
    if (listOptions._builder != null) {
      return listOptions._builder!(item, index, layout, actions);
    }

    /// build default
    var tableOptions = widget.options.dataTable!;
    var widgets = options.dataTable!.buildItem(index, item);

    return Animated(
      fade: const FadeAnimation(),
      child: Card(
        child: ExpansionTile(
          title: listOptions._title!.call(item),
          initiallyExpanded: widgets.length < 5,
          trailing: listOptions.trailing?.call(item),
          leading: options.selectionButton == null
              ? null
              : Checkbox(
                  value: source.isSelected(index),
                  onChanged: (v) {
                    if (v == true) {
                      source.selectItem(index);
                    } else {
                      source.unselectItem(index);
                    }
                  }),
          children: [
            for (var i = 0; i < widgets.length; i++)
              _Info(
                title: tableOptions.headers[i].label,
                body: widgets[i],
              ),
            if (actions.isNotEmpty) ...[
              Divider(color: Theme.of(context).dividerColor),
              ButtonBar(
                children: actions,
              )
            ]
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => widget.options.keepAlive;
}

class _Info extends StatelessWidget {
  final Widget title;
  final Widget body;
  const _Info({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title,
          const SizedBox(width: 20),
          Expanded(
            child: Align(
              alignment: AlignmentDirectional.topEnd,
              child: body,
            ),
          ),
        ],
      ),
    );
  }
}

class _ListAppBar<T, TController extends ReadyListController<T>>
    extends StatelessWidget {
  final _DataTableSource<T, TController> source;
  final ResponsiveDataTable<T, TController> options;
  const _ListAppBar({Key? key, required this.source, required this.options})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var filters = options.filters;

    var canSelect = (options.selectionButton != null);
    var showSelectionButton = canSelect && source.hasSelection;

    var buttons = [
      if (!showSelectionButton) ...[
        ...options.actions,
        if (filters.isNotEmpty)
          _FiltersButton(filters: filters, controller: source.controller),
      ] else
        options.selectionButton!
            .call(ResponsiveDataTableType.list, source.selectedItems),
    ];
    if (buttons.isNotEmpty || canSelect) {
      return SliverToBoxAdapter(
        child: Row(
          children: [
            if (canSelect) _checkBox(),
            Expanded(
                child: Text(
              (canSelect && source.hasSelection)
                  ? MaterialLocalizations.of(context)
                      .selectedRowCountTitle(source.selectedItems.length)
                  : '',
            )),
            ...buttons,
          ],
        ),
      );
    } else {
      return const SliverToBoxAdapter();
    }
  }

  Widget _checkBox() {
    return Checkbox(
      onChanged: (v) {
        return !source.allSelected ? source.selectAll() : source.unSelectAll();
      },
      value: source.allSelected ? true : (source.hasSelection ? true : false),
    );
  }
}

class _ChangeNotifierListener extends StatefulWidget {
  final ChangeNotifier notifier;
  final WidgetBuilder builder;
  const _ChangeNotifierListener(
      {Key? key, required this.notifier, required this.builder})
      : super(key: key);

  @override
  __ChangeNotifierListenerState createState() =>
      __ChangeNotifierListenerState();
}

class __ChangeNotifierListenerState extends State<_ChangeNotifierListener> {
  _onChanged() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    widget.notifier.addListener(_onChanged);
    super.initState();
  }

  @override
  void dispose() {
    widget.notifier.removeListener(_onChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}
