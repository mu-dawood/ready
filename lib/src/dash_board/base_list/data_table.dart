part of responsive_data_table;

class _DataTable<T, TController extends ReadyListController<T>> extends StatefulWidget {
  final ResponsiveDataTable<T, TController> options;
  final _DataTableSource<T, TController> source;
  final BoxConstraints constraints;
  const _DataTable({
    Key? key,
    required this.source,
    required this.options,
    required this.constraints,
  }) : super(key: key);

  @override
  State<_DataTable<T, TController>> createState() => _DataTableState<T, TController>();
}

class _DataTableState<T, TController extends ReadyListController<T>> extends State<_DataTable<T, TController>> {
  @override
  void initState() {
    widget.source.controller.state.whenOrNull(
      needIntialLoading: () {
        widget.source.controller.loadIntial(widget.source.paging.rowsPerPage);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _remote = widget.source.controller;
    var actions = buildHeaderActions(context);
    return Shimmer(
      child: Theme(
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
        child: ClipRRect(
          child: Center(
            child: _buildDataTable(actions, _remote),
          ),
        ),
      ),
    );
  }

  Widget _buildDataTable(List<Widget> actions, ReadyListController<T>? _remote) {
    return SingleChildScrollView(
      padding: const EdgeInsetsDirectional.only(end: 20, start: 20),
      child: ConstrainedBox(
        constraints: widget.constraints,
        child: PaginatedDataTable(
          columns: [
            ...widget.options.dataTable!.headers,
            if (actions.isNotEmpty) const DataColumn(label: Text('')),
          ],
          source: widget.source,
          actions: actions.isEmpty ? null : actions,
          header: _remote != null ? _buildHeaders(_remote) : const SizedBox(),
          availableRowsPerPage: widget.source.paging.availableRowsPerPage,
          rowsPerPage: widget.source.paging.rowsPerPage,
          onPageChanged: (v) => widget.source._onPageChanged(v),
          onRowsPerPageChanged: widget.source._onRowsPerPageChanged,
          onSelectAll: (v) => v == true ? widget.source.selectAll() : widget.source.unSelectAll(),
        ),
      ),
    );
  }

  Widget _buildHeaders(ReadyListController<T> _remote) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: InkWell(
            onTap: _remote.state.whenOrNull(items: (_, __, ___) {
              return () => _remote.refreshData(widget.source.paging.rowsPerPage);
            }),
            child: _remote.state.maybeWhen(
              orElse: () => const Icon(Icons.refresh),
              refreshing: (_, __, ___) {
                return Builder(builder: (context) {
                  return SizedBox(
                    width: IconTheme.of(context).size,
                    height: IconTheme.of(context).size,
                    child: const CircularProgressIndicator(),
                  );
                });
              },
            ),
          ),
        ),
        ..._remote.state.maybeMap(
          orElse: () => const [],
          intialLoading: (_) => const [
            SizedBox(height: 10),
            LinearProgressIndicator(),
          ],
          loadingNext: (_) => const [
            SizedBox(height: 10),
            LinearProgressIndicator(),
          ],
        )
      ],
    );
  }

  List<Widget> buildHeaderActions(BuildContext context) {
    var filters = <Widget>[];
    if (widget.options.filters != null) filters = widget.options.filters!(widget.source.controller);
    return [
      if (widget.options.selectionButton != null)
        AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: widget.source.hasSelection ? 1 : 0,
          child: AbsorbPointer(
            absorbing: !widget.source.hasSelection,
            child: widget.options.selectionButton!.call(widget.source.selectedItems),
          ),
        ),
      if (widget.options.options != null) ...widget.options.options!,
      if (widget.options.export != null)
        _ExportButton(
          export: widget.options.export!,
          controller: widget.source.controller,
        ),
      if (filters.isNotEmpty)
        _FiltersButton(
          filters: filters,
          controller: widget.source.controller,
        ),
      if (widget.options.onCreate != null) ...[
        IconButton(
          iconSize: 35,
          icon: Icon(
            Icons.add,
            color: widget.source.controller.state.whenOrNull(
              refreshing: (_, __, ___) => Theme.of(context).disabledColor,
              loadingNext: (_, __, ___) => Theme.of(context).disabledColor,
              intialLoading: (_) => Theme.of(context).disabledColor,
            ),
          ),
          onPressed: widget.source.controller.state.maybeWhen(
            orElse: () => () => widget.options.onCreate!(context),
            refreshing: (_, __, ___) => null,
            loadingNext: (_, __, ___) => null,
            intialLoading: (_) => null,
          ),
        ),
      ],
    ];
  }
}
