library responsive_data_table;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../animated_items/animated_item.dart';
import '../../ready.dart';
import '../../ready_list/ready_list.dart';
import '../../shimmers/shimmers.dart';

part '_options.dart';
part 'data_table.dart';
part 'data_table_action.dart';
part 'data_table_source.dart';
part 'date_time_filter.dart';
part 'export_button.dart';
part 'filters_button.dart';
part 'interfaces.dart';
part 'loading_button.dart';
part 'search_filter.dart';
part 'single_option_filters.dart';
part 'time_filter.dart';
part 'toggle_filter.dart';

class ResponsiveDataTable<T, TController extends ReadyListController<T>> extends InheritedWidget {
  final Widget Function(List<int> selected)? selectionButton;
  final List<Widget>? options;
  final VoidCallback? export;
  final Function(BuildContext context)? onCreate;
  final List<DataTableAction<T>> Function(TController controller)? actions;
  final TController controller;
  final List<Widget> Function(TController controller)? filters;
  final bool keepAlive;
  final DataTableOptions<T>? dataTable;
  final ListOptions<T>? list;
  ResponsiveDataTable({
    Key? key,
    this.export,
    this.keepAlive = true,
    this.options,
    required this.dataTable,
    this.onCreate,
    required this.list,
    ResponsiveDataTableType type = ResponsiveDataTableType.auto,
    this.actions,
    required this.controller,
    this.selectionButton,
    this.filters,
  }) : super(
          key: key,
          child: _builder<T, TController>(controller, type),
        );

  static LayoutBuilder _builder<T, TController extends ReadyListController<T>>(
      controller, ResponsiveDataTableType type) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return _ResponsiveDataTable<T, TController>(
          controller: controller,
          type: type,
          constraints: constraints,
          options: context.dependOnInheritedWidgetOfExactType<ResponsiveDataTable<T, TController>>()!,
        );
      },
    );
  }

  @override
  bool updateShouldNotify(ResponsiveDataTable<T, TController> oldWidget) {
    return export != oldWidget.export ||
        options != oldWidget.options ||
        dataTable != oldWidget.dataTable ||
        list != oldWidget.list ||
        onCreate != oldWidget.onCreate ||
        actions != oldWidget.actions ||
        controller != oldWidget.controller ||
        filters != oldWidget.filters ||
        keepAlive != oldWidget.keepAlive ||
        selectionButton != oldWidget.selectionButton;
  }
}

class _ResponsiveDataTable<T, TController extends ReadyListController<T>> extends StatefulWidget {
  final TController controller;
  final ResponsiveDataTableType type;
  final BoxConstraints constraints;
  final ResponsiveDataTable<T, TController> options;
  const _ResponsiveDataTable({
    required this.type,
    required this.constraints,
    required this.controller,
    required this.options,
  });

  @override
  __ResponsiveDataTableState<T, TController> createState() => __ResponsiveDataTableState<T, TController>();
}

class __ResponsiveDataTableState<T, TController extends ReadyListController<T>>
    extends State<_ResponsiveDataTable<T, TController>> with AutomaticKeepAliveClientMixin {
  _DataTableSource<T, TController>? source;

  @override
  void dispose() {
    source?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    var options = widget.options;
    var _preferedRows = ((widget.constraints.maxHeight - 170) ~/ 48);
    source = _DataTableSource<T, TController>(
      controller: widget.controller,
      allowSelection: options.selectionButton != null,
      buildRow: buildRow,
      paging: _DataTablePaging(
        availableRowsPerPage: options.dataTable!.availableRowsCount(_preferedRows),
        rowsPerPage: options.dataTable!.intialRowsPerPage(_preferedRows),
        columns: options.dataTable!.headers.length + (options.actions == null ? 0 : 1),
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
    if (widget.options.actions != null) {
      var actions = widget.options.actions!.call(widget.controller);

      cells.add(
        Builder(builder: (context) {
          return ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300, minWidth: 50),
            child: ButtonBar(
              alignment: MainAxisAlignment.end,
              children: buildRowActions(context, actions, item, index),
            ),
          );
        }),
      );
    }
    return cells;
  }

  /// build actions
  List<Widget> buildRowActions(BuildContext context, List<DataTableAction<T>> actions, T item, int index) {
    return <Widget>[
      if (actions.isNotEmpty)
        for (var action in actions)
          LoadingButton(
            tooltip: action.toolTip(context, item),
            enabled: (loading) => action.enabled(item) && !loading,
            load: () async {
              await action.action(context, item);
            },
            icon: Icon(
              action.icon(item),
              color: action.enabled(item) ? action.color(item) : null,
            ),
          )
    ];
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var width = widget.constraints.maxWidth;
    late LayoutType layout;
    if (width <= 320) {
      layout = LayoutType.xsmall;
    } else if (width <= 640) {
      layout = LayoutType.small;
    } else if (width <= 960) {
      layout = LayoutType.medium;
    } else if (width <= 1024) {
      layout = LayoutType.large;
    } else if (width <= 1366) {
      layout = LayoutType.xlarge;
    } else {
      layout = LayoutType.xxlarge;
    }

    switch (widget.type) {
      case ResponsiveDataTableType.table:
        return dataTable(context);
      case ResponsiveDataTableType.list:
        return list(context, layout);
      case ResponsiveDataTableType.auto:
        return width <= 1024 ? list(context, layout) : dataTable(context);
    }
  }

  Widget dataTable(BuildContext context) {
    var options = widget.options;
    return StreamBuilder(
      stream: widget.controller.stream,
      builder: (BuildContext context, AsyncSnapshot<ReadyListState<T>> snapshot) {
        return _DataTable<T, TController>(
          options: options,
          source: source!,
          constraints: widget.constraints,
        );
      },
    );
  }

  Widget list(BuildContext context, LayoutType layout) {
    var options = widget.options;
    var listOptions = widget.options.list!;
    int crossAxis = listOptions.crossAxisCount(layout);
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ReadyList<T, TController>.grid(
              scrollController: listOptions.scrollController,
              innerHeaderSlivers: listOptions.innerHeaderSlivers,
              footerSlivers: listOptions.footerSlivers,
              innerFooterSlivers: listOptions.innerFooterSlivers,
              placeholdersConfig: listOptions.placeholdersConfig,
              showNoMoreText: listOptions.showNoMoreText,
              allowRefresh: listOptions.allowRefresh,
              allowLoadNext: listOptions.allowLoadNext,
              loadFailedText: listOptions.loadFailedText,
              noMoreText: listOptions.noMoreText,
              loadMoreText: listOptions.loadMoreText,
              padding: listOptions.padding,
              reverse: listOptions.reverse,
              buildShimmer: listOptions.buildShimmer,
              shimmergradient: listOptions.shimmergradient,
              shrinkWrap: listOptions.shrinkWrap,
              axis: listOptions.axis,
              physics: listOptions.physics,
              topLevelFooterSlivers: listOptions.topLevelFooterSlivers,
              topLevelHeaderSlivers: listOptions.topLevelHeaderSlivers,
              pageSize: listOptions.pageSize,
              key: Key('$layout'),
              keepAlive: false,
              controller: widget.controller,
              buildItem: (T item, int index) {
                return _buildListItem(context, index, item, layout);
              },
              headerSlivers: (controller) {
                return [
                  _ListAppBar(source: source!, options: options),
                  if (listOptions.headerSlivers != null) ...listOptions.headerSlivers!.call(controller),
                ];
              },
              gridDelegate: (int? length) {
                return SliverStaggeredGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxis,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  staggeredTileCount: length,
                  staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildListItem(BuildContext context, int index, T item, LayoutType layout) {
    var options = widget.options;
    var listOptions = widget.options.list!;

    /// build actions
    var _actions = options.actions == null ? [] : options.actions!(source!.controller);
    List<LoadingButton> actions = _actions.map((action) {
      return LoadingButton(
        tooltip: action.toolTip(context, item),
        enabled: (loading) => action.enabled(item) && !loading,
        load: () async {
          await action.action(context, item);
        },
        icon: Icon(
          action.icon(item),
          color: action.enabled(item) ? action.color(item) : null,
        ),
      );
    }).toList();

    /// check builder method
    if (listOptions._builder != null) return listOptions._builder!(item, index, layout, actions);

    /// build default
    var tableOptions = widget.options.dataTable!;
    var widgets = options.dataTable!.buildItem(index, item);

    return FadeItem(
      child: Card(
        child: ExpansionTile(
          title: listOptions._title!.call(item),
          initiallyExpanded: widgets.length < 5,
          trailing: listOptions.trailing?.call(item),
          leading: options.selectionButton == null
              ? null
              : Checkbox(
                  value: source!.isSelected(index),
                  onChanged: (v) {
                    if (v == true) {
                      source!.selectItem(index);
                    } else {
                      source!.unselectItem(index);
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
  final CrossAxisAlignment? alignment;
  const _Info({Key? key, required this.title, required this.body, this.alignment}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        crossAxisAlignment: alignment ?? CrossAxisAlignment.start,
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

class _ListAppBar<T, TController extends ReadyListController<T>> extends StatefulWidget {
  final _DataTableSource<T, TController> source;
  final ResponsiveDataTable<T, TController> options;
  const _ListAppBar({Key? key, required this.source, required this.options}) : super(key: key);

  @override
  __ListAppBarState<T, TController> createState() => __ListAppBarState<T, TController>();
}

class __ListAppBarState<T, TController extends ReadyListController<T>> extends State<_ListAppBar<T, TController>> {
  _DataTableSource<T, TController> get source => widget.source;
  ResponsiveDataTable<T, TController> get options => widget.options;
  _onChanged() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    widget.source.addListener(_onChanged);
    super.initState();
  }

  @override
  void dispose() {
    widget.source.removeListener(_onChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var filters = <Widget>[];
    if (options.filters != null) filters = options.filters!(source.controller);
    var canSelect = (options.selectionButton != null);

    var buttons = [
      if (!source.hasSelection) ...[
        if (options.options != null)
          for (var option in options.options!)
            if (option is IconButton) CircleAvatar(child: option) else option,
        if (filters.isNotEmpty)
          CircleAvatar(
            child: _FiltersButton(
              filters: filters,
              controller: source.controller,
            ),
          ),
        if (options.export != null)
          CircleAvatar(
            child: _ExportButton(
              export: options.export!,
              controller: source.controller,
            ),
          ),
        if (options.onCreate != null)
          CircleAvatar(
            child: IconButton(
              icon: Icon(
                Icons.add,
                color: source.controller.state.whenOrNull(
                  refreshing: (_, __, ___) => Theme.of(context).disabledColor,
                  loadingNext: (_, __, ___) => Theme.of(context).disabledColor,
                  intialLoading: (_) => Theme.of(context).disabledColor,
                ),
              ),
              onPressed: source.controller.state.maybeWhen(
                orElse: () => () => options.onCreate!(context),
                refreshing: (_, __, ___) => null,
                loadingNext: (_, __, ___) => null,
                intialLoading: (_) => null,
              ),
            ),
          ),
      ] else if (options.selectionButton != null)
        options.selectionButton!.call(source.selectedItems),
    ];
    if (buttons.isNotEmpty || canSelect) {
      return SliverAppBar(
        leading: canSelect ? _checkBox() : const SizedBox(),
        actions: buttons,
        leadingWidth: canSelect ? null : 0,
        title: (canSelect && source.hasSelection)
            ? Text(
                MaterialLocalizations.of(context).selectedRowCountTitle(source.selectedItems.length),
              )
            : null,
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
      value: source.allSelected ? true : (source.hasSelection ? null : false),
    );
  }
}
