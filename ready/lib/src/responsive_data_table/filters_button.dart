part of responsive_data_table;

class _FiltersButton<T, TController extends ReadyListController<T>>
    extends StatelessWidget {
  final List<Widget> filters;
  final TController controller;
  const _FiltersButton({
    Key? key,
    required this.filters,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var hasFilters = filters
        .whereType<_DataTableFilter>()
        .any((element) => element.value != null);
    return IconButton(
      icon: Icon(
        Icons.sort,
        color: controller.state.maybeMap(
          orElse: () => Theme.of(context).disabledColor,
          isLoaded: (_) =>
              (hasFilters ? Theme.of(context).colorScheme.secondary : null),
        ),
      ),
      onPressed: controller.state.mapOrNull(
        isLoaded: (_) {
          return () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (ctx) {
                  return _FiltersButtonSheet(
                    controller: () => controller,
                    filters: filters,
                  );
                });
          };
        },
      ),
    );
  }
}

class _FiltersButtonSheet<T, TController extends ReadyListController<T>>
    extends StatelessWidget {
  final List<Widget> filters;
  final TController Function() controller;
  const _FiltersButtonSheet({
    Key? key,
    required this.filters,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: controller().stream,
      builder:
          (BuildContext context, AsyncSnapshot<ReadyListState<T>> snapshot) {
        var loading = controller().state.mapOrNull(
              isLoadingFirst: (_) => const LinearProgressIndicator(),
              requestFirstLoading: (_) => const LinearProgressIndicator(),
              isRefreshing: (_) => const LinearProgressIndicator(),
              requestRefresh: (_) => const LinearProgressIndicator(),
            );

        return SafeArea(
          top: false,
          child: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (loading != null) loading,
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Wrap(
                    spacing: 20,
                    children: filters,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
