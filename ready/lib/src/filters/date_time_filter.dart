part of 'filters.dart';

/// filter for  DateTime
class DateFilter extends StatelessWidget
    with DecoratedDataTableFilter<DateTime?> {
  /// Filter display
  final String? display;
  @override
  final DateTime? value;
  final DateTime? lastDate;
  final DateTime? firstDate;
  @override
  final InputDecoration decoration;
  @override
  final ValueChanged<DateTime?> onChange;
  const DateFilter({
    Key? key,
    this.value,
    this.firstDate,
    this.lastDate,
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
    var val = value;

    String? displayValue = val == null ? '' : localizations.formatFullDate(val);

    return buildTab(
        context,
        IntrinsicWidth(
          child: InputDecorator(
            textAlignVertical: TextAlignVertical.center,
            textAlign: TextAlign.start,
            decoration: effectiveDecoration,
            isEmpty: val == null,
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
    var first =
        firstDate ?? DateTime.now().subtract(const Duration(days: 3653));
    var last = lastDate ?? DateTime.now().add(const Duration(days: 3653));
    var val = value;

    return showDatePicker(
      context: context,
      selectableDayPredicate: (DateTime date) {
        if (date.isAfter(first) || date.isAtSameMomentAs(first)) return true;
        if (val != null || date.isAtSameMomentAs(val!)) return true;
        return false;
      },
      initialDate: val ?? DateTime.now(),
      firstDate: val == null ? first : (val.isBefore(first) ? val : first),
      lastDate: val == null ? last : (val.isAfter(last) ? val : last),
    );
  }
}
