part of responsive_data_table;

/// filter for  DateTime
class DateFilter extends StatelessWidget
    implements _DataTableFilter<DateTime?> {
  /// Filter display
  final String? display;
  @override
  final DateTime? value;
  final DateTime? minDte;
  @override
  final ValueChanged<DateTime?> onChange;
  const DateFilter({
    Key? key,
    this.value,
    this.minDte,
    this.display,
    required this.onChange,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final localizations = MaterialLocalizations.of(context);

    var _display = value == null
        ? display ?? Ready.localization(context).date
        : localizations.formatFullDate(value!);
    return TextButton.icon(
      onPressed: () {
        buildShowDatePicker(context).then((_value) {
          onChange(_value);
        });
      },
      icon: const Icon(Icons.calendar_today),
      label: Text(_display),
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
