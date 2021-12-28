part of responsive_data_table;

/// toggle filter
class ToggleFilter extends StatelessWidget implements _DataTableFilter<bool> {
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
  Widget build(BuildContext context) {
    var _value = value;
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: ActionChip(
        key: Key('$_value'),
        avatar: Icon(_value == true ? Icons.check_circle : Icons.remove_circle),
        backgroundColor: _value == true ? Colors.greenAccent : Colors.redAccent,
        label: Text(_value == true
            ? (activeText ?? Ready.localization(context).active)
            : (notActiveText ?? Ready.localization(context).notActive)),
        onPressed: () {
          onChange(!_value);
        },
      ),
    );
  }
}
