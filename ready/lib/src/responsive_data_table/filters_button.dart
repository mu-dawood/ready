part of responsive_data_table;

class _FiltersButton<T, TController extends ReadyListController<T>>
    extends StatelessWidget {
  final List<DataTableFilter> filters;
  final TController controller;
  const _FiltersButton({
    Key? key,
    required this.filters,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var hasValue = filters.any((element) => element.value != null);

    return IconButton(
      icon: Icon(
        Icons.sort,
        color: controller.state.maybeMap(
          orElse: () => Theme.of(context).disabledColor,
          isLoaded: (_) =>
              (hasValue ? Theme.of(context).colorScheme.secondary : null),
        ),
      ),
      onPressed: controller.state.mapOrNull(
        isLoaded: (_) {
          return () async {
            await showDialog(
              context: context,
              builder: (ctx) {
                return _FiltersButtonSheet(
                  controller: () => controller,
                  filters: filters,
                );
              },
            );
          };
        },
      ),
    );
  }
}

class _FiltersButtonSheet<T, TController extends ReadyListController<T>>
    extends StatelessWidget {
  final List<DataTableFilter> filters;
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

        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                ...filters,
                if (loading != null) loading,
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.error),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
            ),
          ],
        );
      },
    );
  }
}
