library responsive_data_table;

import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../animated_items/animated_item.dart';
import '../controllers/controllers.dart';
import '../dashboard/dashboard.dart';
import '../enums.dart';
import '../filters/filters.dart';
import '../ready.dart';
import '../ready_list/ready_list.dart';
import '../shimmers/shimmers.dart';
import '../utils.dart';

part '_options.dart';
part 'data_table/data_table.dart';
part 'data_table/footer.dart';
part 'data_table/remaining_area.dart';
part 'data_table_action.dart';
part 'filters_button.dart';
part 'header/actions.dart';
part 'header/default_refresh_button.dart';
part 'header/header.dart';
part 'header/header_title.dart';
part 'header/select_all_check_box.dart';
part 'loading_button.dart';

class _DataTablePaging {
  final int currentPage;
  final int rowsPerPage;
  int get firstRow => ((currentPage - 1) * rowsPerPage) + 1;
  int get lastRow => currentPage * rowsPerPage;
  _DataTablePaging(this.currentPage, this.rowsPerPage);

  _DataTablePaging copyWith({
    int? currentPage,
    int? rowsPerPage,
  }) {
    return _DataTablePaging(
      currentPage ?? this.currentPage,
      rowsPerPage ?? this.rowsPerPage,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is _DataTablePaging &&
        other.currentPage == currentPage &&
        other.rowsPerPage == rowsPerPage;
  }

  @override
  int get hashCode => currentPage.hashCode ^ rowsPerPage.hashCode;

  @override
  String toString() {
    return "Current page: $currentPage        Rows per page: $rowsPerPage";
  }
}

/// responsive data table
///
/// if [ResponsiveDataTableType.list] it will display [ReadyList]
///
/// if [ResponsiveDataTableType.table] it will display [PaginatedDataTable]
///
/// if type is null then next:
///
/// if width return  [LayoutType.large] or [LayoutType.xLarge] or [LayoutType.xxLarge]
class ResponsiveDataTable<T, Args,
        TController extends BaseReadyListController<T, Args>>
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
  final List<Action<T, Args, TController>> rowActions;

  /// controller that extends [BaseReadyListController]
  final TController controller;

  /// when is not empty filter button will be added to the top of [DataTable]
  final List<DataTableFilter Function(BuildContext context)> filters;

  /// This will keep the state of tab
  final bool keepAlive;

  /// DataTable options
  final DataTableOptions<T> dataTable;

  /// List options

  final ListOptions<T, Args>? list;
  ResponsiveDataTable({
    Key? key,
    this.keepAlive = true,
    this.actions = const [],
    required this.dataTable,
    this.list = const ListOptions._default(),
    ResponsiveDataTableType? type,
    this.rowActions = const [],
    required this.controller,
    this.buildFilters,
    this.selectionButton,
    this.filters = const [],
  }) : super(
          key: key,
          child: _builder<T, Args, TController>(controller, type),
        );

  static LayoutBuilder
      _builder<T, Args, TController extends BaseReadyListController<T, Args>>(
          controller, ResponsiveDataTableType? type) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return _ResponsiveDataTable<T, Args, TController>(
          controller: controller,
          type: type,
          constraints: constraints,
          options: context.dependOnInheritedWidgetOfExactType<
              ResponsiveDataTable<T, Args, TController>>()!,
        );
      },
    );
  }

  @override
  bool updateShouldNotify(ResponsiveDataTable<T, Args, TController> oldWidget) {
    return rowActions != oldWidget.rowActions ||
        dataTable != oldWidget.dataTable ||
        list != oldWidget.list ||
        actions != oldWidget.actions ||
        controller != oldWidget.controller ||
        filters != oldWidget.filters ||
        keepAlive != oldWidget.keepAlive ||
        selectionButton != oldWidget.selectionButton;
  }

  static SelectionController? selectionController<T, Args,
              TController extends BaseReadyListController<T, Args>>(
          BuildContext context) =>
      context
          .findAncestorStateOfType<
              __ResponsiveDataTableState<T, Args, TController>>()
          ?._selectedIndices;
}

class _ResponsiveDataTable<T, Args,
        TController extends BaseReadyListController<T, Args>>
    extends StatefulWidget {
  final TController controller;
  final ResponsiveDataTableType? type;
  final BoxConstraints constraints;
  final ResponsiveDataTable<T, Args, TController> options;
  const _ResponsiveDataTable({
    required this.type,
    required this.constraints,
    required this.controller,
    required this.options,
  });

  @override
  __ResponsiveDataTableState<T, Args, TController> createState() =>
      __ResponsiveDataTableState<T, Args, TController>();

  static __ResponsiveDataTableState<T, Args, TController>
      of<T, Args, TController extends BaseReadyListController<T, Args>>(
              BuildContext context) =>
          context.findAncestorStateOfType<
              __ResponsiveDataTableState<T, Args, TController>>()!;
}

class __ResponsiveDataTableState<T, Args,
        TController extends BaseReadyListController<T, Args>>
    extends State<_ResponsiveDataTable<T, Args, TController>>
    with AutomaticKeepAliveClientMixin {
  late final ValueNotifier<_DataTablePaging> _paging;
  late final _SelectedIndices<T, Args, TController> _selectedIndices;
  @override
  void initState() {
    _selectedIndices =
        _SelectedIndices<T, Args, TController>({}, widget.controller);
    _paging = ValueNotifier<_DataTablePaging>(_getPaging());
    super.initState();
  }

  _DataTablePaging _getPaging([bool current = false]) {
    var availableRowsCount = widget.options.dataTable.availableRowsCount;
    var rowsPerPage = widget.options.dataTable.initialRowsPerPage;
    if (current) {
      if (availableRowsCount.contains(_paging.value.rowsPerPage)) {
        rowsPerPage = _paging.value.rowsPerPage;
      }
      rowsPerPage ??= availableRowsCount.first;
      return _paging.value.copyWith(
        rowsPerPage: rowsPerPage,
      );
    } else {
      rowsPerPage ??= availableRowsCount.first;
      return _DataTablePaging(1, rowsPerPage);
    }
  }

  @override
  void didUpdateWidget(
      covariant _ResponsiveDataTable<T, Args, TController> oldWidget) {
    if (widget.options.dataTable.availableRowsCount !=
        oldWidget.options.dataTable.availableRowsCount) {
      _paging.value = _getPaging(true);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _paging.dispose();
    _selectedIndices.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return PageInfo.insureValid(context, (context) {
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
    });
  }

  Widget dataTable(BuildContext context) {
    return _DataTable<T, Args, TController>(controller: widget.controller);
  }

  Widget list(BuildContext context, LayoutType layout) {
    var options = widget.options;
    var listOptions = widget.options.list!;
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ReadyList<T, Args, TController>.grid(
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
        headerSlivers: (state) {
          return [
            _Header<T, Args, TController>(
              type: ResponsiveDataTableType.list,
              controller: options.controller,
            ),
            if (listOptions.headerSlivers != null)
              ...listOptions.headerSlivers!.call(state),
          ];
        },
        gridDelegate: listOptions.gridDelegate ?? Grids.responsive,
      ),
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
                  : _CheckBox(index: index, placeholder: true),
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
    var tableOptions = widget.options.dataTable;
    var widgets = options.dataTable.buildItem(index, item);
    Widget title;
    if (listOptions._title == null) {
      title = widgets.isEmpty ? const SizedBox() : widgets.first;
    } else {
      title = listOptions._title!.call(index, item);
    }
    return Animated(
      fade: const FadeAnimation(),
      child: Card(
        child: ExpansionTile(
          title: title,
          initiallyExpanded: widgets.length < 5,
          trailing: listOptions.trailing?.call(item),
          leading:
              options.selectionButton == null ? null : _CheckBox(index: index),
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

class _CheckBox<T, Args, TController extends BaseReadyListController<T, Args>>
    extends StatelessWidget {
  final int index;
  final bool placeholder;
  const _CheckBox({Key? key, required this.index, this.placeholder = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var parent = _ResponsiveDataTable.of<T, Args, TController>(context);
    return ValueListenableBuilder(
      valueListenable: parent._selectedIndices,
      builder: (context, Set<int> value, child) {
        return Checkbox(
          value: value.contains(index),
          onChanged: placeholder
              ? null
              : (v) {
                  if (v == true) {
                    parent._selectedIndices.selectItem(index);
                  } else {
                    parent._selectedIndices.unselectItem(index);
                  }
                },
        );
      },
    );
  }
}

abstract class SelectionController {
  void selectAll();

  void unSelectAll();

  void selectItem(int index);

  void unselectItem(int index);
}

class _SelectedIndices<T, Args,
        TController extends BaseReadyListController<T, Args>>
    extends ValueNotifier<Set<int>> implements SelectionController {
  final TController controller;
  _SelectedIndices(super.value, this.controller);
  ReadyListState<T, Args> get state => controller.state;

  bool get hasSelection => value.isNotEmpty;

  bool get allSelected {
    return controller.state.maybeMap(
      orElse: () => false,
      isLoaded: (state) => value.length >= state.items.length,
      requestNext: (state) => value.length >= state.currentData.items.length,
      isLoadingNext: (state) => value.length >= state.currentData.items.length,
      requestRefresh: (state) => value.length >= state.currentData.items.length,
      isRefreshing: (state) => value.length >= state.currentData.items.length,
    );
  }

  @override
  void selectAll() {
    value = List.generate(state.length, (index) => index).toSet();
  }

  @override
  void unSelectAll() {
    value = {};
  }

  @override
  void selectItem(int index) {
    value = {
      ...value,
      index,
    };
  }

  @override
  void unselectItem(int index) {
    value.remove(index);
    notifyListeners();
  }
}
