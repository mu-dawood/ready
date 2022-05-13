import 'package:intl/intl.dart' as intl;
import 'ready_extension_localizations.dart';

/// The translations for English (`en`).
class ReadyExtensionLocalizationsEn extends ReadyExtensionLocalizations {
  ReadyExtensionLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String yearsPlural(num count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'one year',
      two: 'Two years',
      other: '$count years',
    );
  }

  @override
  String monthsPlural(num count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'one month',
      two: 'two months',
      other: '$count months',
    );
  }

  @override
  String daysPlural(num count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'one day',
      two: 'two days',
      other: '$count days',
    );
  }

  @override
  String weeksPlural(num count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'one week',
      two: 'two weeks',
      other: '$count weeks',
    );
  }

  @override
  String hoursPlural(num count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'one hour',
      two: 'two hours',
      other: '$count hours',
    );
  }

  @override
  String minutesPlural(num count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'one minute',
      two: 'two minutes',
      other: '$count minutes',
    );
  }

  @override
  String secondsPlural(num count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'one seconds',
      two: 'two seconds',
      other: '$count seconds',
    );
  }

  @override
  String get now => 'now';

  @override
  String get formatSeparator => ' , ';
}
