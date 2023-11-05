part of responsive_data_table;

class _FiltersButton<T, S extends BaseReadyListState<T>,
    TController extends ReadyListController<T, S>> extends StatelessWidget {
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
    var stateType = controller.state.stateType;
    return IconButton(
      icon: Icon(
        Icons.sort,
        color: stateType == StateType.loaded
            ? (hasValue ? Theme.of(context).colorScheme.secondary : null)
            : Theme.of(context).disabledColor,
      ),
      onPressed: (stateType == StateType.loaded)
          ? () async {
              await showDialog(
                context: context,
                builder: (ctx) {
                  return _FiltersButtonSheet<T, S, TController>(
                    controller: () => controller,
                    filters: filters,
                  );
                },
              );
            }
          : null,
    );
  }
}

class _FiltersButtonSheet<T, S extends BaseReadyListState<T>,
    TController extends ReadyListController<T, S>> extends StatelessWidget {
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
      builder: (BuildContext context, AsyncSnapshot<S> snapshot) {
        var states = [
          StateType.isLoadingFirstTime,
          StateType.requestFirstLoading,
          StateType.isRefreshing,
          StateType.requestRefreshing
        ];
        var loading = states.contains(controller().state)
            ? const LinearProgressIndicator()
            : null;

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
