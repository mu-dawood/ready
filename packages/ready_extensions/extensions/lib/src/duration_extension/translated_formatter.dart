part of duration_extension;

/// ```
///  Duration(seconds:100).format(
///    formatter: TranslatedDurationFormatter(context),
///  )
/// ```
class TranslatedDurationFormatter implements DurationFormatter {
  final BuildContext context;

  const TranslatedDurationFormatter(this.context);
  @override
  String getSeparator() {
    return SimpleLocalizations.of(context)!.formatSeperator;
  }

  @override
  String getYears(int years) {
    if (years == 0) {
      return '';
    } else {
      return SimpleLocalizations.of(context)!.yearsPlural(years);
    }
  }

  @override
  String getMonths(int months) {
    if (months == 0) {
      return '';
    } else {
      return SimpleLocalizations.of(context)!.monthsPlural(months);
    }
  }

  @override
  String getDays(int days) {
    if (days == 0) {
      return '';
    } else {
      return SimpleLocalizations.of(context)!.daysPlural(days);
    }
  }

  @override
  String getWeeks(int weeks) {
    if (weeks == 0) {
      return '';
    } else {
      return SimpleLocalizations.of(context)!.weeksPlural(weeks);
    }
  }

  @override
  String getHours(int hours) {
    if (hours == 0) {
      return '';
    } else {
      return SimpleLocalizations.of(context)!.hoursPlural(hours);
    }
  }

  @override
  String getMinutes(int minutes) {
    if (minutes == 0) {
      return '';
    } else {
      return SimpleLocalizations.of(context)!.minutesPlural(minutes);
    }
  }

  @override
  String getSeconds(int seconds) {
    if (seconds == 0) {
      return '';
    } else {
      return SimpleLocalizations.of(context)!.socondsPlural(seconds);
    }
  }

  @override
  String getNow() {
    return SimpleLocalizations.of(context)!.now;
  }
}
