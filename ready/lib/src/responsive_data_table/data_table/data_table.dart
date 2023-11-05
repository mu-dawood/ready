part of responsive_data_table;

class _DataTable<T, S extends BaseReadyListState<T>,
    TController extends ReadyListController<T, S>> extends StatefulWidget {
  final TController controller;
  const _DataTable({Key? key, required this.controller}) : super(key: key);

  @override
  State<_DataTable<T, S, TController>> createState() =>
      _DataTableState<T, S, TController>();
}

class _DataTableState<T, S extends BaseReadyListState<T>,
        TController extends ReadyListController<T, S>>
    extends State<_DataTable<T, S, TController>> {
  late ScrollController _defaultController;

  @override
  void initState() {
    _defaultController = ScrollController();
    super.initState();
  }

  bool canSelect(ResponsiveDataTable<T, S, TController> options) =>
      options.selectionButton != null;
  @override
  void dispose() {
    _defaultController.dispose();
    super.dispose();
  }

  List<DataColumn> _columns(ResponsiveDataTable<T, S, TController> options) {
    return [
      ...options.dataTable.headers,
      if (options.rowActions.isNotEmpty)
        const DataColumn(label: Text(''), numeric: true),
    ];
  }

  @override
  Widget build(BuildContext context) {
    SliverOverlapAbsorberHandle? absorber;
    try {
      absorber = NestedScrollView.sliverOverlapAbsorberHandleFor(context);
    } catch (e) {
      absorber = null;
    }
    var options = context.dependOnInheritedWidgetOfExactType<
        ResponsiveDataTable<T, S, TController>>()!;
    Widget child;
    if (absorber != null && absorber.layoutExtent != null) {
      child = CustomScrollView(
        slivers: [
          SliverOverlapInjector(handle: absorber),
          _Header<T, S, TController>(
            controller: widget.controller,
            sliver: true,
            type: ResponsiveDataTableType.table,
          ),
          _buildTable(options, true),
          _Footer<T, S, TController>(
            controller: widget.controller,
            sliver: true,
            paging: _ResponsiveDataTable.of<T, S, TController>(context)._paging,
          ),
        ],
      );
    } else {
      child = Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Header<T, S, TController>(
            controller: widget.controller,
            sliver: false,
            type: ResponsiveDataTableType.table,
          ),
          Expanded(child: _buildTable(options, false)),
          _Footer<T, S, TController>(
            controller: widget.controller,
            sliver: false,
            paging: _ResponsiveDataTable.of<T, S, TController>(context)._paging,
          ),
        ],
      );
    }
    return Theme(
      data: Theme.of(context).copyWith(
        cardTheme: const CardTheme(
          clipBehavior: Clip.none,
          margin: EdgeInsets.zero,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(),
          elevation: 0,
          color: Colors.transparent,
        ),
      ),
      child: child,
    );
  }

  Widget _buildTable(
      ResponsiveDataTable<T, S, TController> options, bool sliver) {
    final List<DataColumn> columns = _columns(options);

    var responsive = _ResponsiveDataTable.of<T, S, TController>(context);
    var child = LayoutBuilder(
      builder: (context, constrains) {
        return SingleChildScrollView(
          child: Scrollbar(
            controller: _defaultController,
            child: SingleChildScrollView(
              controller: _defaultController,
              scrollDirection: Axis.horizontal,
              child: StreamBuilder(
                stream: widget.controller.stream,
                builder: (context, _) {
                  return ConstrainedBox(
                    constraints: BoxConstraints(minWidth: constrains.maxWidth),
                    child: ValueListenableBuilder(
                      valueListenable: responsive._paging,
                      builder: (BuildContext context, _DataTablePaging paging,
                          Widget? child) {
                        return ValueListenableBuilder(
                          valueListenable: responsive._selectedIndices,
                          builder: (BuildContext context,
                              Set<int> selectedIndices, Widget? child) {
                            return DataTable(
                              columns: columns,
                              horizontalMargin: 0,
                              decoration: const BoxDecoration(),
                              showBottomBorder: true,
                              checkboxHorizontalMargin: 5,
                              onSelectAll: (value) {
                                if (value == true) {
                                  responsive._selectedIndices.selectAll();
                                } else {
                                  responsive._selectedIndices.unSelectAll();
                                }
                              },
                              rows: _getRows(
                                options: options,
                                columns: columns,
                                selectedIndices: responsive._selectedIndices,
                                paging: paging,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
    if (sliver) {
      return SliverPadding(
        padding: options.dataTable.padding,
        sliver: SliverRemainingArea(child: child),
      );
    } else {
      return Padding(padding: options.dataTable.padding, child: child);
    }
  }

  List<DataRow> _getRows({
    required ResponsiveDataTable<T, S, TController> options,
    required List<DataColumn> columns,
    required _SelectedIndices<T, S, TController> selectedIndices,
    required _DataTablePaging paging,
  }) {
    final List<DataRow> result = <DataRow>[];
    final int startIndex = (paging.currentPage - 1) * paging.rowsPerPage;
    bool loading = ![StateType.error, StateType.loaded, StateType.intitial]
        .contains(widget.controller.state);

    var length = widget.controller.length;
    for (int index = startIndex;
        index < startIndex + paging.rowsPerPage;
        index++) {
      if (index < length) {
        var element = widget.controller.elementAt(index);
        result.add(_buildRow(
            options: options,
            index: index,
            item: element,
            selectedIndices: selectedIndices));
      } else if (loading) {
        result
            .add(_getProgressIndicatorRowFor(columns, index, selectedIndices));
      } else {
        result.add(_getBlankRowFor(columns, index, selectedIndices));
      }
    }
    return result;
  }

  DataRow _buildRow({
    required ResponsiveDataTable<T, S, TController> options,
    required int index,
    required T item,
    required _SelectedIndices<T, S, TController> selectedIndices,
  }) {
    var items = options.dataTable.buildItem(index, item);
    var cells = <DataCell>[];
    for (var item in items) {
      cells.add(DataCell(ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 300, minWidth: 20),
        child: item,
      )));
    }
    if (options.rowActions.isNotEmpty) {
      var actions = options.rowActions;
      List<Widget> rActions = [];
      if (actions.length <= 3) {
        rActions.addAll(actions.map(
            (e) => e.build(context, widget.controller, item, index, false)));
      } else {
        rActions.add(SubmenuButton(
          menuChildren: actions
              .map(
                  (e) => e.build(context, widget.controller, item, index, true))
              .toList(),
          child: const Icon(Icons.more_vert_rounded),
        ));
      }
      cells.add(DataCell(MenuBar(
        style: MenuStyle(
          alignment: AlignmentDirectional.centerEnd,
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          elevation: MaterialStateProperty.all(0),
        ),
        children: rActions,
      )));
    }
    if (canSelect(options)) {
      return DataRow(
        cells: cells,
        selected: selectedIndices.value.contains(index),
        onSelectChanged: (value) {
          if (value == true) {
            selectedIndices.selectItem(index);
          } else {
            selectedIndices.unselectItem(index);
          }
        },
      );
    } else {
      return DataRow(cells: cells);
    }
  }

  DataRow _getBlankRowFor(List<DataColumn> columns, int index,
      _SelectedIndices<T, S, TController> selectedIndices) {
    return DataRow.byIndex(
      index: index,
      cells:
          columns.map<DataCell>((DataColumn column) => DataCell.empty).toList(),
    );
  }

  DataRow _getProgressIndicatorRowFor(List<DataColumn> columns, int index,
      _SelectedIndices<T, S, TController> selectedIndices) {
    final List<DataCell> cells = columns.map<DataCell>((DataColumn column) {
      return const DataCell(
        CircularProgressIndicator.adaptive(),
        placeholder: true,
      );
    }).toList();

    return DataRow.byIndex(
      index: index,
      cells: cells,
    );
  }
}
