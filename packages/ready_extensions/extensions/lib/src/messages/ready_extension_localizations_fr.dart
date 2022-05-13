import 'package:intl/intl.dart' as intl;
import 'ready_extension_localizations.dart';

/// The translations for French (`fr`).
class ReadyExtensionLocalizationsFr extends ReadyExtensionLocalizations {
  ReadyExtensionLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String yearsPlural(num count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'un ans',
      two: 'deux ans',
      few: '$count années',
      other: '$count années',
    );
  }

  @override
  String monthsPlural(num count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'un mois',
      two: 'deux mois',
      few: '$count mois',
      other: '$count mois',
    );
  }

  @override
  String daysPlural(num count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'un seul jour',
      two: 'deux jours',
      few: '$count jours',
      other: '$count jours',
    );
  }

  @override
  String weeksPlural(num count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'une semaine',
      two: 'deux semaines',
      few: '$count semaines',
      other: '$count semaines',
    );
  }

  @override
  String hoursPlural(num count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'une heure',
      two: 'deux heures',
      few: '$count heures',
      other: '$count heures',
    );
  }

  @override
  String minutesPlural(num count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'une minute',
      two: 'deux minutes',
      few: '$count minutes',
      other: '$count minutes',
    );
  }

  @override
  String secondsPlural(num count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'une seconde',
      two: 'deux secondes',
      few: '$count secondes',
      other: '$count secondes',
    );
  }

  @override
  String get now => 'à présent';

  @override
  String get formatSeparator => ' ، ';
}
