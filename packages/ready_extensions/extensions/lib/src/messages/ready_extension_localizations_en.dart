import 'package:intl/intl.dart' as intl;

import 'ready_extension_localizations.dart';

/// The translations for English (`en`).
class ReadyExtensionLocalizationsEn extends ReadyExtensionLocalizations {
  ReadyExtensionLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String yearsPlural(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count years',
      two: 'Two years',
      one: 'one year',
      zero: '',
    );
    return '$_temp0';
  }

  @override
  String monthsPlural(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count months',
      two: 'two months',
      one: 'one month',
      zero: '',
    );
    return '$_temp0';
  }

  @override
  String daysPlural(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days',
      two: 'two days',
      one: 'one day',
      zero: '',
    );
    return '$_temp0';
  }

  @override
  String weeksPlural(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count weeks',
      two: 'two weeks',
      one: 'one week',
      zero: '',
    );
    return '$_temp0';
  }

  @override
  String hoursPlural(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hours',
      two: 'two hours',
      one: 'one hour',
      zero: '',
    );
    return '$_temp0';
  }

  @override
  String minutesPlural(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minutes',
      two: 'two minutes',
      one: 'one minute',
      zero: '',
    );
    return '$_temp0';
  }

  @override
  String secondsPlural(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count seconds',
      two: 'two seconds',
      one: 'one seconds',
      zero: '',
    );
    return '$_temp0';
  }

  @override
  String get now => 'now';

  @override
  String get formatSeparator => ' , ';
}
