part of responsive_data_table;

class TimeFilter extends StatelessWidget implements _DataTableFilter<TimeOfDay?> {
  @override
  final ValueChanged<TimeOfDay?> onChange;
  final String display;
  @override
  final TimeOfDay? value;
  const TimeFilter({
    Key? key,
    required this.onChange,
    this.value,
    required this.display,
  }) : super(key: key);
  @override
  @override
  Widget build(BuildContext context) {
    var _display = value == null ? display : value!.format(context);
    return TextButton.icon(
      onPressed: () {
        buildShowTimePicker(context).then((_value) {
          onChange(_value);
        });
      },
      icon: const Icon(Icons.timer),
      label: Text(_display),
    );
  }

  Future<TimeOfDay?> buildShowTimePicker(BuildContext context) {
    return showTimePicker(
      context: context,
      initialTime: value ?? TimeOfDay.fromDateTime(DateTime.now()),
    );
  }
}
