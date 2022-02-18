part of responsive_data_table;

class _DataTable<T, TController extends ReadyListController<T>>
    extends StatefulWidget {
  final ResponsiveDataTable<T, TController> options;
  final _DataTableSource<T, TController> source;
  const _DataTable({
    Key? key,
    required this.source,
    required this.options,
  }) : super(key: key);

  @override
  State<_DataTable<T, TController>> createState() =>
      _DataTableState<T, TController>();
}

class _DataTableState<T, TController extends ReadyListController<T>>
    extends State<_DataTable<T, TController>> {
  TController get controller => widget.source.controller;

  @override
  void initState() {
    if (widget.source.controller.hasHandler) {
      widget.source.controller.state.whenOrNull(
        needInitialLoading: () {
          widget.source.controller.handler!
              .loadInitialData(widget.source.paging.rowsPerPage);
        },
      );
    }
    super.initState();
  }

  @override
  void didUpdateWidget(covariant _DataTable<T, TController> oldWidget) {
    if (widget.source.controller.hasHandler) {
      widget.source.controller.state.whenOrNull(
        needInitialLoading: () {
          widget.source.controller.handler!
              .loadInitialData(widget.source.paging.rowsPerPage);
        },
      );
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return ShimmerScope(
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
        child: _buildDataTable(),
      ),
    );
  }

  Widget _buildDataTable() {
    SliverOverlapAbsorberHandle? absorber;
    try {
      absorber = NestedScrollView.sliverOverlapAbsorberHandleFor(context);
    } catch (e) {
      absorber = null;
    }
    return CustomScrollView(
      slivers: [
        if (absorber != null) SliverOverlapInjector(handle: absorber),
        SliverPadding(
          padding: widget.options.dataTable!.padding,
          sliver: SliverToBoxAdapter(
            child: _buildTable(),
          ),
        ),
      ],
    );
  }

  PaginatedDataTable _buildTable() {
    return PaginatedDataTable(
      columns: [
        ...widget.options.dataTable!.headers,
        if (widget.options.actions.isNotEmpty)
          const DataColumn(label: Text('')),
      ],
      source: widget.source,
      actions: buildHeaderActions(context),
      horizontalMargin: 0,
      headingRowHeight: 40,
      header: Row(
        children: [
          ...controller.state.mayWhen(
            orElse: () => [],
            initialLoading: (_) => [
              const CupertinoActivityIndicator(),
              const SizedBox(width: 10),
            ],
            loadingNext: (_, __, ___) => [
              const CupertinoActivityIndicator(),
              const SizedBox(width: 10),
            ],
          ),
          Text.rich(TextSpan(
            children: PageInfo.of(context)?.titleSpans ?? [],
          )),
        ],
      ),
      availableRowsPerPage: widget.source.paging.availableRowsPerPage,
      rowsPerPage: widget.source.paging.rowsPerPage,
      onPageChanged: (v) => widget.source._onPageChanged(v),
      onRowsPerPageChanged: widget.source._onRowsPerPageChanged,
      onSelectAll: (v) =>
          v == true ? widget.source.selectAll() : widget.source.unSelectAll(),
    );
  }

  Widget _buildRefreshIcon() {
    return widget.options.dataTable!.refreshButton!(
      enabled: controller.state.mayWhen(
        orElse: () => false,
        loaded: (items, total) => true,
        empty: () => true,
        error: (message) => true,
      ),
      onRefresh: () {
        controller.state.whenOrNull(
          empty: () {
            controller.handler
                ?.loadInitialData(widget.source.paging.rowsPerPage);
          },
          error: (e) {
            controller.handler
                ?.loadInitialData(widget.source.paging.rowsPerPage);
          },
          loaded: (_, __) {
            controller.handler?.refreshData(widget.source.paging.rowsPerPage);
          },
        );
      },
      refreshing: controller.state.mayWhen(
        orElse: () => false,
        refreshing: (items, total, cancelToken) => true,
      ),
    );
  }

  List<Widget> buildHeaderActions(BuildContext context) {
    var filters = widget.options.filters;
    return [
      if (widget.options.selectionButton != null)
        AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: widget.source.hasSelection ? 1 : 0,
          child: AbsorbPointer(
            absorbing: !widget.source.hasSelection,
            child: widget.options.selectionButton!.call(
                ResponsiveDataTableType.list, widget.source.selectedItems),
          ),
        ),
      ...widget.options.actions,
      if (filters.isNotEmpty)
        _FiltersButton(
          filters: filters,
          controller: widget.source.controller,
        ),
      if (widget.options.dataTable?.refreshButton != null &&
          controller.hasHandler)
        _buildRefreshIcon(),
    ];
  }
}

class _DefaultRefreshButton extends StatelessWidget {
  final bool enabled;
  final VoidCallback onRefresh;
  final bool refreshing;
  const _DefaultRefreshButton({
    Key? key,
    required this.enabled,
    required this.onRefresh,
    required this.refreshing,
  }) : super(key: key);

  static Widget get({
    required bool enabled,
    required VoidCallback onRefresh,
    required bool refreshing,
  }) =>
      _DefaultRefreshButton(
        enabled: enabled,
        onRefresh: onRefresh,
        refreshing: refreshing,
      );
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enabled ? onRefresh : null,
      child: refreshing
          ? Builder(builder: (context) {
              return SizedBox(
                width: IconTheme.of(context).size,
                height: IconTheme.of(context).size,
                child: const CupertinoActivityIndicator(),
              );
            })
          : const Icon(Icons.refresh),
    );
  }
}
