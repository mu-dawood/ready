part of responsive_data_table;

class _Footer<T, S extends BaseReadyListState<T>,
    TController extends ReadyListController<T, S>> extends StatefulWidget {
  final TController controller;
  final ValueNotifier<_DataTablePaging> paging;
  final bool sliver;
  const _Footer(
      {Key? key,
      required this.controller,
      required this.paging,
      required this.sliver})
      : super(key: key);

  @override
  State<_Footer<T, S, TController>> createState() =>
      _FooterState<T, S, TController>();
}

class _FooterState<T, S extends BaseReadyListState<T>,
        TController extends ReadyListController<T, S>>
    extends State<_Footer<T, S, TController>> {
  late StreamSubscription<S> subscription;
  _DataTablePaging get paging => widget.paging.value;
  S get state => widget.controller.state;
  bool _loading = false;

  int get length => widget.controller.state.items.length;

  int get totalCount =>
      math.max(state.totalCount, widget.controller.state.items.length);

  bool get _canGoNext =>
      !_loading && (paging.currentPage * paging.rowsPerPage) < totalCount;

  bool get _canGoPrev => !_loading && paging.currentPage > 1;

  void _handleFirstLoading() {
    widget.controller.requestFirstLoading(paging.rowsPerPage);
  }

  @override
  void initState() {
    subscription = widget.controller.stream.listen(_handleDataChanged);
    widget.paging.addListener(_onPagingChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handleFirstLoading();
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant _Footer<T, S, TController> oldWidget) {
    _handleFirstLoading();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    widget.paging.removeListener(_onPagingChanged);
    subscription.cancel();
    super.dispose();
  }

  void _onPagingChanged() {
    setState(() {});
  }

  void _handleDataChanged(S state) {
    if (state.stateType == StateType.requestRefreshing ||
        state.stateType == StateType.requestFirstLoading) {
      toFirst();
    }

    bool loading = ![StateType.error, StateType.loaded, StateType.initial]
        .contains(widget.controller.state);

    if (loading != _loading) {
      setState(() {
        _loading = loading;
      });
    }
  }

  void _onRowsPerPageChanged(int v) {
    if (v == paging.rowsPerPage) return;
    var newPaging = paging.copyWith(rowsPerPage: v);
    var length = newPaging.currentPage * newPaging.rowsPerPage;
    if (this.length < length) {
      widget.controller.requestNextLoading(paging.rowsPerPage);
    }
    widget.paging.value = newPaging;
  }

  void pageTo(int page) {
    if (page == paging.currentPage) return;
    var newPaging = paging.copyWith(currentPage: page);

    var length = newPaging.currentPage * newPaging.rowsPerPage;
    if (this.length < length) {
      widget.controller.requestNextLoading(paging.rowsPerPage);
    }
    widget.paging.value = newPaging;
  }

  void toFirst() {
    pageTo(1);
  }

  void _handlePrevious() {
    pageTo(math.max(paging.currentPage - 1, 1));
  }

  void _handleNext() {
    pageTo(paging.currentPage + 1);
  }

  @override
  Widget build(BuildContext context) {
    var options = context.dependOnInheritedWidgetOfExactType<
        ResponsiveDataTable<T, S, TController>>()!;
    final ThemeData themeData = Theme.of(context);
    final TextStyle? footerTextStyle = themeData.textTheme.bodySmall;
    var child = DefaultTextStyle(
      style: footerTextStyle!,
      child: IconTheme.merge(
        data: const IconThemeData(opacity: 0.54),
        child: SizedBox(
          height: 56.0,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            reverse: true,
            child: Row(
                children: _footerWidgets(context, options, footerTextStyle)),
          ),
        ),
      ),
    );
    if (widget.sliver) {
      return SliverPadding(
        padding: options.dataTable.padding,
        sliver: SliverToBoxAdapter(
          child: child,
        ),
      );
    } else {
      return Padding(padding: options.dataTable.padding, child: child);
    }
  }

  List<Widget> _footerWidgets(BuildContext context,
      ResponsiveDataTable<T, S, TController> options, TextStyle textStyle) {
    final MaterialLocalizations localizations =
        MaterialLocalizations.of(context);
    final List<Widget> footerWidgets = <Widget>[];
    var availableRows = options.dataTable.availableRowsCount.toSet().toList();
    availableRows.sort();

    final List<Widget> availableRowsPerPage =
        availableRows.map<DropdownMenuItem<int>>((int value) {
      return DropdownMenuItem<int>(
        value: value,
        child: Text('$value'),
      );
    }).toList();
    footerWidgets.addAll(<Widget>[
      Container(
          width:
              14.0), // to match trailing padding in case we overflow and end up scrolling
      Text(localizations.rowsPerPageTitle),
      ConstrainedBox(
        constraints: const BoxConstraints(
            minWidth: 64.0), // 40.0 for the text, 24.0 for the icon
        child: Align(
          alignment: AlignmentDirectional.centerEnd,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<int>(
              items: availableRowsPerPage.cast<DropdownMenuItem<int>>(),
              value: paging.rowsPerPage,
              onChanged: (v) => _onRowsPerPageChanged(v!),
              style: textStyle,
            ),
          ),
        ),
      ),
    ]);

    footerWidgets.addAll(<Widget>[
      Container(width: 32.0),
      Text(localizations.pageRowsInfoTitle(
          paging.firstRow, paging.lastRow, totalCount, false)),
      Container(width: 32.0),
      IconButton(
        icon: const Icon(Icons.chevron_left),
        padding: EdgeInsets.zero,
        tooltip: localizations.previousPageTooltip,
        onPressed: _canGoPrev ? _handlePrevious : null,
      ),
      Container(width: 24.0),
      IconButton(
        icon: const Icon(Icons.chevron_right),
        padding: EdgeInsets.zero,
        tooltip: localizations.nextPageTooltip,
        onPressed: _canGoNext ? _handleNext : null,
      ),
      Container(width: 14.0),
    ]);
    return footerWidgets;
  }
}
