part of 'filters.dart';

/// filter for  DateTime
class DateRangeFilter extends StatelessWidget
    with DecoratedDataTableFilter<DateTimeRange?> {
  /// Filter display
  final String? display;
  @override
  final DateTimeRange? value;
  @override
  final InputDecoration decoration;
  @override
  final ValueChanged<DateTimeRange?> onChange;
  final DateTime? lastDate;
  final DateTime? firstDate;

  const DateRangeFilter({
    Key? key,
    this.value,
    this.display,
    required this.onChange,
    this.decoration =
        const _DefaultInputDecoration(Icon(Icons.calendar_month_rounded)),
    this.lastDate,
    this.firstDate,
  }) : super(key: key);

  @override
  String hintText(ReadyListLocalizations tr) {
    return display ?? tr.date;
  }

  @override
  Widget build(BuildContext context) {
    final effectiveDecoration = _effectiveDecoration(context);
    final localizations = MaterialLocalizations.of(context);
    String? displayValue = '';
    if (value != null) {
      if (value!.start.year == value!.end.year) {
        displayValue += localizations.formatShortDate(value!.start);
        displayValue += ' - ';
        displayValue += localizations.formatShortDate(value!.end);
      } else {
        displayValue += localizations.formatShortMonthDay(value!.start);
        displayValue += ' - ';
        displayValue += localizations.formatShortMonthDay(value!.end);
      }
    }

    return buildTab(
        context,
        IntrinsicWidth(
          child: InputDecorator(
            textAlignVertical: TextAlignVertical.center,
            textAlign: TextAlign.start,
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

  Future<DateTimeRange?> buildShowDatePicker(BuildContext context) {
    var first =
        firstDate ?? DateTime.now().subtract(const Duration(days: 3653));
    var last = lastDate ?? DateTime.now().add(const Duration(days: 3653));
    return showDateRangePicker(
      context: context,
      initialDateRange: value,
      firstDate: value == null
          ? first
          : (value!.start.isBefore(first) ? value!.start : first),
      lastDate:
          value == null ? last : (value!.end.isAfter(last) ? value!.end : last),
    );
  }
}
