part of responsive_data_table;

class _HeaderActions<T, Args, TController extends ReadyListController<T, Args>>
    extends StatelessWidget {
  final ResponsiveDataTableType type;
  final TController controller;

  const _HeaderActions(
      {super.key, required this.type, required this.controller});

  @override
  Widget build(BuildContext context) {
    var parent = _ResponsiveDataTable.of<T, Args, TController>(context);
    var selectedIndices = parent._selectedIndices;
    var options = context.dependOnInheritedWidgetOfExactType<
        ResponsiveDataTable<T, Args, TController>>()!;

    var canSelect = (options.selectionButton != null);
    return ValueListenableBuilder(
      valueListenable: selectedIndices,
      builder: (context, Set<int> value, child) {
        return StreamBuilder(
          stream: controller.stream,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            var loading = controller.state.maybeMap(
              orElse: () => true,
              isLoaded: (state) => false,
              error: (message) => false,
            );
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
    required ResponsiveDataTable<T, Args, TController> options,
    required Set<int> value,
    required bool loading,
    required __ResponsiveDataTableState<T, Args, TController> parent,
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
        return builder(e);
      }).toList());
    } else {
      if (type == ResponsiveDataTableType.table) {
        children.add(absorber(_buildRefreshIcon(options, parent, loading)));
        children.add(const Spacer());
      }

      children.addAll(options.actions.map((e) => absorber(e)));
      if (filters.isNotEmpty) {
        children.add(absorber(
          _FiltersButton(
            filters: filters,
            controller: controller,
          ),
        ));
      }
    }

    return children;
  }

  Widget _buildRefreshIcon(ResponsiveDataTable<T, Args, TController> options,
      __ResponsiveDataTableState<T, Args, TController> parent, bool loading) {
    return ValueListenableBuilder(
      valueListenable: parent._paging,
      builder: (BuildContext context, _DataTablePaging paging, Widget? child) {
        return options.dataTable.refreshButton!(
          enabled: !loading,
          onRefresh: () => controller.requestRefresh(paging.rowsPerPage),
          refreshing: controller.state.maybeMap(
            orElse: () => false,
            isRefreshing: (_) => true,
            requestRefresh: (_) => true,
          ),
        );
      },
    );
  }
}
