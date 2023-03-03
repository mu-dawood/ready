part of responsive_data_table;

/// toggle filter
class ToggleFilter extends StatelessWidget implements DataTableFilter<bool> {
  @override
  final ValueChanged<bool?> onChange;
  final String? activeText;
  final String? notActiveText;
  @override
  final bool value;
  const ToggleFilter({
    Key? key,
    required this.onChange,
    this.activeText,
    this.notActiveText,
    this.value = false,
  }) : super(key: key);
  @override
  @override
  Widget build(BuildContext context) {
    var val = value;
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: ChoiceChip(
        key: Key('$val'),
        visualDensity: VisualDensity.comfortable
            .copyWith(vertical: VisualDensity.minimumDensity),
        avatar: Icon(val == true ? Icons.check_circle : Icons.remove_circle),
        selected: val,
        label: Text(val == true
            ? (activeText ?? Ready.localization(context).active)
            : (notActiveText ?? Ready.localization(context).notActive)),
        onSelected: (val) {
          onChange(val);
        },
      ),
    );
  }
}
