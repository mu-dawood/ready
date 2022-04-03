part of duration_extension;

/// ```
///  Duration(seconds:100).format(
///    formatter: TranslatedDurationFormatter(context),
///  )
/// ```
class TranslatedDurationFormatter implements DurationFormatter {
  final ReadyExtensionLocalizations messages;
  const TranslatedDurationFormatter(this.messages);
  factory TranslatedDurationFormatter.of(BuildContext context) {
    return TranslatedDurationFormatter(
        ReadyExtensionLocalizations.of(context)!);
  }
  @override
  String getSeparator() {
    return messages.formatSeparator;
  }

  @override
  String getYears(int years) {
    if (years == 0) {
      return '';
    } else {
      return messages.yearsPlural(years);
    }
  }

  @override
  String getMonths(int months) {
    if (months == 0) {
      return '';
    } else {
      return messages.monthsPlural(months);
    }
  }

  @override
  String getDays(int days) {
    if (days == 0) {
      return '';
    } else {
      return messages.daysPlural(days);
    }
  }

  @override
  String getWeeks(int weeks) {
    if (weeks == 0) {
      return '';
    } else {
      return messages.weeksPlural(weeks);
    }
  }

  @override
  String getHours(int hours) {
    if (hours == 0) {
      return '';
    } else {
      return messages.hoursPlural(hours);
    }
  }

  @override
  String getMinutes(int minutes) {
    if (minutes == 0) {
      return '';
    } else {
      return messages.minutesPlural(minutes);
    }
  }

  @override
  String getSeconds(int seconds) {
    if (seconds == 0) {
      return '';
    } else {
      return messages.secondsPlural(seconds);
    }
  }

  @override
  String getNow() {
    return messages.now;
  }
}
