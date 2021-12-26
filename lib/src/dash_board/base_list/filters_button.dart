part of responsive_data_table;

class _FiltersButton<T, TController extends ReadyListController<T>> extends StatelessWidget {
  final List<Widget> filters;
  final TController controller;
  const _FiltersButton({
    Key? key,
    required this.filters,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var hasFilters = filters.whereType<_DataTableFilter>().any((element) => element.value != null);
    return IconButton(
      icon: Icon(
        Icons.sort,
        color: controller.state.maybeWhen(
          orElse: () => Theme.of(context).disabledColor,
          items: (_, __, ___) => (hasFilters ? Theme.of(context).colorScheme.secondary : null),
        ),
      ),
      onPressed: controller.state.whenOrNull(
        items: (_, __, ___) {
          return () {
            showModalBottomSheet(
                context: context,
                builder: (ctx) {
                  return StreamBuilder(
                    stream: controller.stream,
                    builder: (BuildContext context, AsyncSnapshot<ReadyListState<T>> snapshot) {
                      var loading = controller.state.whenOrNull(
                        intialLoading: (_) => const LinearProgressIndicator(),
                        refreshing: (_, __, ___) => const LinearProgressIndicator(),
                      );
                      return Column(
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
                      );
                    },
                  );
                });
          };
        },
      ),
    );
  }
}
