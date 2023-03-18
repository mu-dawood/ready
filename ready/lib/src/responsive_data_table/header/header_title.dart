part of responsive_data_table;

class _HeaderTitle<T, Args,
        TController extends BaseReadyListController<T, Args>>
    extends StatelessWidget {
  final TController controller;
  const _HeaderTitle({super.key, required this.controller});
  Text _selectionText(BuildContext context, Set<int> value) {
    return Text(
        MaterialLocalizations.of(context).selectedRowCountTitle(value.length));
  }

  Widget _header(
      BuildContext context, ResponsiveDataTable<T, Args, TController> options) {
    var spans = PageInfo.mayBeOf(context)?.widget.titleSpans ?? [];
    return StreamBuilder(
      stream: controller.stream,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        Widget? loading = controller.state.maybeMap(
          orElse: () => null,
          isLoadingFirst: (_) => const CupertinoActivityIndicator(),
          requestFirstLoading: (_) => const CupertinoActivityIndicator(),
          isLoadingNext: (_) => const CupertinoActivityIndicator(),
          requestNext: (_) => const CupertinoActivityIndicator(),
        );
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (loading != null) ...[
              loading,
              const SizedBox(width: 10),
            ],
            Text.rich(TextSpan(children: spans)),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var options = context.dependOnInheritedWidgetOfExactType<
        ResponsiveDataTable<T, Args, TController>>()!;
    var parent = _ResponsiveDataTable.of<T, Args, TController>(context);
    var selectedIndices = parent._selectedIndices;
    bool hasPageInfo = PageInfo.mayBeOf(context) != null;
    var canSelect = (options.selectionButton != null);
    return ValueListenableBuilder(
      valueListenable: selectedIndices,
      builder: (context, Set<int> value, child) {
        if (!hasPageInfo && !selectedIndices.hasSelection)
          return _header(context, options);
        if (canSelect && selectedIndices.hasSelection)
          return _selectionText(context, value);
        return const SizedBox();
      },
    );
  }
}
