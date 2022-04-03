part of duration_extension;

/// formatter to be used  with duration formatter
/// you must do the following before use it
/// ```
/// import 'gen_l10n/simple_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: SimpleLocalizations.localizationsDelegates,
///   supportedLocales: SimpleLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
class DefaultDurationFormatter implements DurationFormatter {
  const DefaultDurationFormatter();
  @override
  String getSeparator() => ' & ';

  @override
  String getYears(int years) {
    if (years == 0) {
      return '';
    } else if (years == 1) {
      return 'one year';
    } else if (years == 2) {
      return 'two years';
    } else {
      return '$years years';
    }
  }

  @override
  String getMonths(int months) {
    if (months == 0) {
      return '';
    } else if (months == 1) {
      return 'one month';
    } else if (months == 2) {
      return 'two months';
    } else {
      return '$months months';
    }
  }

  @override
  String getDays(int days) {
    if (days == 0) {
      return '';
    } else if (days == 1) {
      return 'one day';
    } else if (days == 2) {
      return 'two days';
    } else {
      return '$days days';
    }
  }

  @override
  String getWeeks(int weeks) {
    if (weeks == 0) {
      return '';
    } else if (weeks == 1) {
      return 'one week';
    } else if (weeks == 2) {
      return 'two weeks';
    } else {
      return '$weeks weeks';
    }
  }

  @override
  String getHours(int hours) {
    if (hours == 0) {
      return '';
    } else if (hours == 1) {
      return 'one hour';
    } else if (hours == 2) {
      return 'two hours';
    } else {
      return '$hours hours';
    }
  }

  @override
  String getMinutes(int minutes) {
    if (minutes == 0) {
      return '';
    } else if (minutes == 1) {
      return 'one minute';
    } else if (minutes == 2) {
      return 'two minutes';
    } else {
      return '$minutes minutes';
    }
  }

  @override
  String getSeconds(int seconds) {
    if (seconds == 0) {
      return '';
    } else if (seconds == 1) {
      return 'one second';
    } else if (seconds == 2) {
      return 'two seconds';
    } else {
      return '$seconds seconds';
    }
  }

  @override
  String getNow() => 'Now';
}
