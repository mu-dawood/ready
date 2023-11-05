part of responsive_data_table;

class _HeaderActions<T, S extends BaseReadyListState<T>,
    TController extends ReadyListController<T, S>> extends StatelessWidget {
  final ResponsiveDataTableType type;
  final TController controller;

  const _HeaderActions(
      {super.key, required this.type, required this.controller});

  @override
  Widget build(BuildContext context) {
    var parent = _ResponsiveDataTable.of<T, S, TController>(context);
    var selectedIndices = parent._selectedIndices;
    var options = context.dependOnInheritedWidgetOfExactType<
        ResponsiveDataTable<T, S, TController>>()!;

    var canSelect = (options.selectionButton != null);
    return ValueListenableBuilder(
      valueListenable: selectedIndices,
      builder: (context, Set<int> value, child) {
        return StreamBuilder(
          stream: controller.stream,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            var loading =
                ![StateType.error, StateType.loaded].contains(controller.state);

            if (!canSelect) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: buildHeaderActions(
                    context: context,
                    options: options,
                    value: {},
                    loading: loading,
                    parent: parent),
              );
            }

            return Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: buildHeaderActions(
                  context: context,
                  options: options,
                  value: value,
                  loading: loading,
                  parent: parent),
            );
          },
        );
      },
    );
  }

  List<Widget> buildHeaderActions({
    required BuildContext context,
    required ResponsiveDataTable<T, S, TController> options,
    required Set<int> value,
    required bool loading,
    required __ResponsiveDataTableState<T, S, TController> parent,
  }) {
    var filters = options.filters;
    var canSelect = (options.selectionButton != null);
    var showSelectionButton = canSelect && value.isNotEmpty;
    if (showSelectionButton) {
      return [
        options.selectionButton!.call(type, value),
      ];
    }
    Widget absorber(Widget child) {
      return AbsorbPointer(
        absorbing: loading,
        child: child,
      );
    }

    Widget builder(Widget child) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: absorber(child),
      );
    }

    List<Widget> children = [];
    if (type == ResponsiveDataTableType.table &&
        filters.isNotEmpty &&
        filters.length <= 4) {
      children.add(absorber(_buildRefreshIcon(options, parent, loading)));
      children.addAll(options.actions.map((e) => absorber(e)));
      children.add(const Spacer());
      children.addAll(filters.map((e) {
        return builder(e(context));
      }).toList());
    } else {
      if (type == ResponsiveDataTableType.table) {
        children.add(absorber(_buildRefreshIcon(options, parent, loading)));
        children.add(const Spacer());
      }

      children.addAll(options.actions.map((e) => absorber(e)));
      if (filters.isNotEmpty) {
        children.add(absorber(
          _FiltersButton<T, S, TController>(
            filters: filters.map((e) => e(context)).toList(),
            controller: controller,
          ),
        ));
      }
    }

    return children;
  }

  Widget _buildRefreshIcon(ResponsiveDataTable<T, S, TController> options,
      __ResponsiveDataTableState<T, S, TController> parent, bool loading) {
    return ValueListenableBuilder(
      valueListenable: parent._paging,
      builder: (BuildContext context, _DataTablePaging paging, Widget? child) {
        return options.dataTable.refreshButton!(
          enabled: !loading,
          onRefresh: () => controller.requestRefreshing(paging.rowsPerPage),
          refreshing: [StateType.isRefreshing, StateType.requestRefreshing]
              .contains(controller.state),
        );
      },
    );
  }
}
