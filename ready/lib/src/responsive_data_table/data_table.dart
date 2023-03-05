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
    extends State<_DataTable<T, TController>> with PageInfoAware {
  TController get controller => widget.source.controller;
  final GlobalKey<_PaginatedDataTableState> _table =
      GlobalKey<_PaginatedDataTableState>();
  bool _hasSelection = false;

  @override
  void initState() {
    widget.source.controller.state.mapOrNull(
      requestRefresh: (state) {
        _table.currentState?.toFirst();
      },
      initializing: (state) {
        widget.source.controller.emit(ReadyListState.requestFirstLoading(
          pageSize: widget.source.paging.rowsPerPage,
          args: state.args,
        ));
      },
    );

    widget.source.addListener(_onSourceChange);
    super.initState();
  }

  void _onSourceChange() {
    var changed = false;
    if (widget.source.hasSelection != _hasSelection) {
      _hasSelection = widget.source.hasSelection;
      changed = true;
    }
    if (changed && mounted) {
      forceUpdate();
      setState(() {});
    }
  }

  @override
  void didUpdateWidget(covariant _DataTable<T, TController> oldWidget) {
    widget.source.controller.state.whenOrNull(
      initializing: (value, _) {
        if (!value) return;
        widget.source.controller.emit(ReadyListState.requestFirstLoading(
          pageSize: widget.source.paging.rowsPerPage,
        ));
      },
    );
    super.didUpdateWidget(oldWidget);
  }

  @override
  List<Widget> getAppBarActions() {
    var actions = buildHeaderActions(context);
    if (pagInfoState != null) {
      actions.insert(
          0,
          StreamBuilder(
            stream: controller.stream,
            builder: (_, __) {
              return controller.state.maybeMap(
                orElse: () => const SizedBox(),
                isLoadingFirst: (_) => const CupertinoActivityIndicator(),
                requestFirstLoading: (_) => const CupertinoActivityIndicator(),
                isLoadingNext: (_) => const CupertinoActivityIndicator(),
                requestNext: (_) => const CupertinoActivityIndicator(),
              );
            },
          ));
    }
    return actions;
  }

  @override
  void dispose() {
    widget.source.removeListener(_onSourceChange);

    super.dispose();
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

    return LayoutBuilder(
      builder: (context, constraints) {
        return CustomScrollView(
          slivers: [
            if (absorber != null) SliverOverlapInjector(handle: absorber),
            SliverFillRemaining(
              hasScrollBody: false,
              fillOverscroll: true,
              child: Padding(
                padding: widget.options.dataTable!.padding,
                child: _buildTable(constraints),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _header() {
    Widget? loading = controller.state.maybeMap(
      orElse: () => null,
      isLoadingFirst: (_) => const CupertinoActivityIndicator(),
      requestFirstLoading: (_) => const CupertinoActivityIndicator(),
      isLoadingNext: (_) => const CupertinoActivityIndicator(),
      requestNext: (_) => const CupertinoActivityIndicator(),
    );
    return Row(
      children: [
        if (loading != null) ...[
          loading,
          const SizedBox(width: 10),
        ],
        if (pagInfoState == null)
          Text.rich(TextSpan(
            children: PageInfo.mayBeOf(context)?.widget.titleSpans ?? [],
          )),
      ],
    );
  }

  Widget _buildTable(BoxConstraints constraints) {
    return _PaginatedDataTable(
      key: _table,
      columns: [
        ...widget.options.dataTable!.headers,
        if (widget.options.rowActions.isNotEmpty)
          const DataColumn(label: Text('')),
      ],
      constraints: constraints,
      source: widget.source,
      actions: pagInfoState == null ? getAppBarActions() : null,
      horizontalMargin: 0,
      headingRowHeight: 40,
      header: pagInfoState == null ? _header() : null,
      availableRowsPerPage: widget.source.paging.availableRowsPerPage,
      rowsPerPage: widget.source.paging.rowsPerPage,
      onPageChanged: (v) {
        widget.source._onPageChanged(v);
        setState(() {});
      },
      onRowsPerPageChanged: widget.source._onRowsPerPageChanged,
      onSelectAll: (v) =>
          v == true ? widget.source.selectAll() : widget.source.unSelectAll(),
    );
  }

  Widget _buildRefreshIcon() {
    return widget.options.dataTable!.refreshButton!(
      enabled: controller.state.maybeMap(
        orElse: () => false,
        isLoaded: (state) => true,
        error: (message) => true,
      ),
      onRefresh: () {
        controller.state.mapOrNull(
          error: (e) {
            widget.source.controller.emit(ReadyListState.requestFirstLoading(
              pageSize: widget.source.paging.rowsPerPage,
            ));
          },
          isLoaded: (state) {
            if (state.items.isEmpty) {
              widget.source.controller.emit(ReadyListState.requestFirstLoading(
                pageSize: widget.source.paging.rowsPerPage,
              ));
            } else {
              widget.source.controller.emit(
                ReadyListState.requestRefresh(
                  pageSize: widget.source.paging.rowsPerPage,
                  args: state.args,
                  currentData: CurrentData(
                    items: state.items,
                    totalCount: state.totalCount,
                    args: state.args,
                  ),
                ),
              );
            }
          },
        );
      },
      refreshing: controller.state.maybeMap(
        orElse: () => false,
        isRefreshing: (_) => true,
        requestRefresh: (_) => true,
      ),
    );
  }

  List<Widget> buildHeaderActions(BuildContext context) {
    var filters = widget.options.filters;
    var canSelect = (widget.options.selectionButton != null);
    var showSelectionButton = canSelect && _hasSelection;
    if (showSelectionButton) {
      return [
        widget.options.selectionButton!
            .call(ResponsiveDataTableType.list, widget.source.selectedItems),
      ];
    }
    List<Widget> children = [];
    if (filters.isNotEmpty && filters.length <= 5) {
      children.addAll(filters.map((e) {
        return AbsorbPointer(
          absorbing: controller.state.maybeMap(
            orElse: () => true,
            isLoaded: (value) => false,
          ),
          child: e,
        );
      }).toList());
    } else if (filters.isNotEmpty) {
      children.add(_FiltersButton(
        filters: filters,
        controller: widget.source.controller,
      ));
    }

    if (widget.options.dataTable?.refreshButton != null) {
      children.add(_buildRefreshIcon());
    }

    children.addAll(widget.options.actions);
    return children;
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
  }) {
    return Builder(builder: (context) {
      return _DefaultRefreshButton(
        enabled: enabled,
        onRefresh: onRefresh,
        refreshing: refreshing,
      );
    });
  }

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
