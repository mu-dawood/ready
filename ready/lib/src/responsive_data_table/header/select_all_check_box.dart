part of responsive_data_table;

class _SelectAllCheckBox<T, S extends BaseReadyListState<T>,
    TController extends ReadyListController<T, S>> extends StatelessWidget {
  const _SelectAllCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    var parent = _ResponsiveDataTable.of<T, S, TController>(context);
    var selectedIndices = parent._selectedIndices;
    var options = context.dependOnInheritedWidgetOfExactType<
        ResponsiveDataTable<T, S, TController>>()!;

    var canSelect = (options.selectionButton != null);
    if (!canSelect) return const SizedBox();
    return ValueListenableBuilder(
      valueListenable: selectedIndices,
      builder: (context, Set<int> value, child) {
        return Checkbox(
          onChanged: (v) {
            !selectedIndices.allSelected
                ? selectedIndices.selectAll()
                : selectedIndices.unSelectAll();
          },
          value: selectedIndices.allSelected
              ? true
              : (selectedIndices.hasSelection ? true : false),
        );
      },
    );
  }
}
