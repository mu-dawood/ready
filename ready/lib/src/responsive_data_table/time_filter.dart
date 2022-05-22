part of responsive_data_table;

/// time filter
class TimeFilter extends StatelessWidget
    implements _DataTableFilter<TimeOfDay?> {
  @override
  final ValueChanged<TimeOfDay?> onChange;
  final String? display;
  @override
  final TimeOfDay? value;
  const TimeFilter({
    Key? key,
    required this.onChange,
    this.value,
    this.display,
  }) : super(key: key);
  @override
  @override
  Widget build(BuildContext context) {
    var text = value == null
        ? display ?? Ready.localization(context).time
        : value!.format(context);
    return TextButton.icon(
      onPressed: () {
        buildShowTimePicker(context).then((value) {
          onChange(value);
        });
      },
      icon: const Icon(Icons.timer),
      label: Text(text),
    );
  }

  Future<TimeOfDay?> buildShowTimePicker(BuildContext context) {
    return showTimePicker(
      context: context,
      initialTime: value ?? TimeOfDay.fromDateTime(DateTime.now()),
    );
  }
}
