import 'package:intl/intl.dart' as intl;

import 'ready_extension_localizations.dart';

/// The translations for French (`fr`).
class ReadyExtensionLocalizationsFr extends ReadyExtensionLocalizations {
  ReadyExtensionLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String yearsPlural(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count années',
      few: '$count années',
      two: 'deux ans',
      one: 'un ans',
      zero: '',
    );
    return '$_temp0';
  }

  @override
  String monthsPlural(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mois',
      few: '$count mois',
      two: 'deux mois',
      one: 'un mois',
      zero: '',
    );
    return '$_temp0';
  }

  @override
  String daysPlural(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count jours',
      few: '$count jours',
      two: 'deux jours',
      one: 'un seul jour',
      zero: '',
    );
    return '$_temp0';
  }

  @override
  String weeksPlural(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count semaines',
      few: '$count semaines',
      two: 'deux semaines',
      one: 'une semaine',
      zero: '',
    );
    return '$_temp0';
  }

  @override
  String hoursPlural(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count heures',
      few: '$count heures',
      two: 'deux heures',
      one: 'une heure',
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
      few: '$count minutes',
      two: 'deux minutes',
      one: 'une minute',
      zero: '',
    );
    return '$_temp0';
  }

  @override
  String secondsPlural(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count secondes',
      few: '$count secondes',
      two: 'deux secondes',
      one: 'une seconde',
      zero: '',
    );
    return '$_temp0';
  }

  @override
  String get now => 'à présent';

  @override
  String get formatSeparator => ' ، ';
}
