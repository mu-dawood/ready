part of responsive_data_table;

/// time filter
class TimeFilter extends StatelessWidget
    with DecoratedDataTableFilter<TimeOfDay?> {
  @override
  final ValueChanged<TimeOfDay?> onChange;
  final String? display;
  @override
  final TimeOfDay? value;
  @override
  final InputDecoration decoration;
  const TimeFilter({
    Key? key,
    required this.onChange,
    this.value,
    this.display,
    this.decoration =
        const _DefaultInputDecoration(Icon(Icons.calendar_month_rounded)),
  }) : super(key: key);
  @override
  String hintText(ReadyListLocalizations tr) {
    return display ?? tr.time;
  }

  @override
  Widget build(BuildContext context) {
    final effectiveDecoration = _effectiveDecoration(context);

    return buildTab(
        context,
        IntrinsicWidth(
          child: InputDecorator(
            decoration: effectiveDecoration,
            isEmpty: value == null,
            textAlignVertical: TextAlignVertical.center,
            child: Text(value?.format(context) ?? ""),
          ),
        ));
  }

  Widget buildTab(BuildContext context, Widget child) {
    return InkWell(
      onTap: () {
        buildShowTimePicker(context).then(
          (value) {
            if (value != null) onChange(value);
          },
        );
      },
      child: child,
    );
  }

  Future<TimeOfDay?> buildShowTimePicker(BuildContext context) {
    return showTimePicker(
      context: context,
      initialTime: value ?? TimeOfDay.fromDateTime(DateTime.now()),
    );
  }
}
