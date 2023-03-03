part of responsive_data_table;

/// filter for  DateTime
class DateFilter extends StatelessWidget
    with DecoratedDataTableFilter<DateTime?> {
  /// Filter display
  final String? display;
  @override
  final DateTime? value;
  final DateTime? minDte;
  @override
  final InputDecoration decoration;
  @override
  final ValueChanged<DateTime?> onChange;
  const DateFilter({
    Key? key,
    this.value,
    this.minDte,
    this.display,
    required this.onChange,
    this.decoration =
        const _DefaultInputDecoration(Icon(Icons.calendar_month_rounded)),
  }) : super(key: key);

  @override
  String hintText(ReadyListLocalizations tr) {
    return display ?? tr.date;
  }

  @override
  Widget build(BuildContext context) {
    final effectiveDecoration = _effectiveDecoration(context);
    final localizations = MaterialLocalizations.of(context);
    String? displayValue =
        value == null ? '' : localizations.formatFullDate(value!);

    return buildTab(
        context,
        IntrinsicWidth(
          child: InputDecorator(
            textAlignVertical: TextAlignVertical.center,
            decoration: effectiveDecoration,
            isEmpty: value == null,
            child: Text(displayValue),
          ),
        ));
  }

  Widget buildTab(BuildContext context, Widget child) {
    return InkWell(
      onTap: () {
        buildShowDatePicker(context).then((value) {
          if (value != null) onChange(value);
        });
      },
      child: child,
    );
  }

  Future<DateTime?> buildShowDatePicker(BuildContext context) {
    var min = minDte ?? DateTime(1900);
    return showDatePicker(
      context: context,
      selectableDayPredicate: (DateTime date) {
        if (date.isAfter(min) || date.isAtSameMomentAs(min)) return true;
        if (value != null || date.isAtSameMomentAs(value!)) return true;
        return false;
      },
      initialDate: value ?? DateTime.now(),
      firstDate: value == null ? min : (value!.isBefore(min) ? value! : min),
      lastDate: DateTime(2077),
    );
  }
}
