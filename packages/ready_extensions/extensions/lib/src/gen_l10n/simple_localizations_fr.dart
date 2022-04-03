

import 'package:intl/intl.dart' as intl;
import 'simple_localizations.dart';

/// The translations for French (`fr`).
class SimpleLocalizationsFr extends SimpleLocalizations {
  SimpleLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String yearsPlural(int count) {
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
  String monthsPlural(int count) {
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
  String daysPlural(int count) {
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
  String weeksPlural(int count) {
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
  String hoursPlural(int count) {
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
  String minutesPlural(int count) {
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
  String socondsPlural(int count) {
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
  String get formatSeperator => ' ، ';

  @override
  String get required => 'Excuse-moi! Ce champ est obligatoire';

  @override
  String stringMaxLength(String value, int max) {
    return 'Le texte ne doit pas dépasser $max';
  }

  @override
  String stringMinLength(String value, int min) {
    return 'La longueur du texte doit être d\'au moins $min';
  }

  @override
  String stringMustBeInRange(String value, int min, int max) {
    return 'Vous devez saisir un texte d\'une longueur d\'au moins $min et d\'au plus $max';
  }

  @override
  String stringMustBeDateTime(String value) {
    return 'Vous devez entrer une date valide';
  }

  @override
  String stringMustBeTimeOfDay(String value) {
    return 'Vous devez entrer une heure valide';
  }

  @override
  String mustBeDateAfter(DateTime value, DateTime after) {
    final intl.DateFormat valueDateFormat = intl.DateFormat.yMMMEd(localeName);
    final String valueString = valueDateFormat.format(value);
    final intl.DateFormat afterDateFormat = intl.DateFormat.yMMMEd(localeName);
    final String afterString = afterDateFormat.format(after);

    return 'Vous devez entrer une date ultérieure pour $afterString';
  }

  @override
  String mustBeDateBefore(DateTime value, DateTime before) {
    final intl.DateFormat valueDateFormat = intl.DateFormat.yMMMEd(localeName);
    final String valueString = valueDateFormat.format(value);
    final intl.DateFormat beforeDateFormat = intl.DateFormat.yMMMEd(localeName);
    final String beforeString = beforeDateFormat.format(before);

    return 'Vous devez entrer une date antérieure pour $beforeString';
  }

  @override
  String mustBeTimeOfDayAfter(dynamic value, dynamic after) {
    return 'Vous devez entrer ultérieurement pour $after';
  }

  @override
  String mustBeTimeOfDayBefore(dynamic value, dynamic before) {
    return 'Vous devez entrer une date antérieure pour $before';
  }

  @override
  String mustBeDateBetween(dynamic value, DateTime min, DateTime max) {
    final intl.DateFormat minDateFormat = intl.DateFormat.yMMMEd(localeName);
    final String minString = minDateFormat.format(min);
    final intl.DateFormat maxDateFormat = intl.DateFormat.yMMMEd(localeName);
    final String maxString = maxDateFormat.format(max);

    return 'يجب إختيار تاريخ بين $minString و $maxString';
  }

  @override
  String mustBeTimeOfDayBetween(dynamic value, dynamic min, dynamic max) {
    return 'يجب إختيار وقت بين $min و $max';
  }

  @override
  String mustBeNumber(String value) {
    return 'Vous devez entrer un numéro';
  }

  @override
  String mustBeInteger(String value) {
    return 'Vous devez entrer un nombre non décimal';
  }

  @override
  String mustBeDecimal(String value) {
    return 'Vous devez entrer un nombre décimal';
  }

  @override
  String mustBeGithubUrl(String value) {
    return 'Vous devez saisir un lien de compte Github';
  }

  @override
  String mustBeRedditUrl(String value) {
    return 'Le lien du compte Reddit doit être saisi';
  }

  @override
  String mustBeInstagramUrl(String value) {
    return 'Le lien du compte Instagram doit être saisi';
  }

  @override
  String mustBeLinkedinProfile(String value) {
    return 'Le lien du compte Linkedin doit être saisi';
  }

  @override
  String mustBeTwitterUser(String value) {
    return 'Le lien du compte Twitter doit être saisi';
  }

  @override
  String mustBeYoutubeVideoUrl(String value) {
    return 'Le lien Youtube doit être saisi';
  }

  @override
  String mustBeFacbookPageOrProfile(String value) {
    return 'Vous devez saisir un lien Facebook';
  }

  @override
  String mustBeSnapchatProfile(String value) {
    return 'Vous devez saisir un lien de compte Snapchat';
  }

  @override
  String mustBeUrl(String value) {
    return 'Vous devez saisir un lien valide';
  }

  @override
  String mustBeEmail(String value) {
    return 'Vous devez entrer un e-mail valide';
  }

  @override
  String mustBeHexColor(String value) {
    return 'Vous devez entrer une couleur correcte telle que (#ff0000)';
  }

  @override
  String mustBeLocalEgyptianPhone(String value) {
    return 'Vous devez entrer un numéro égyptien local tel que (015xxxxxxxx)';
  }

  @override
  String mustBeInternationalEgyptianPhone(String value) {
    return 'Vous devez entrer un numéro égyptien au format international tel que (2015xxxxxxxx)';
  }

  @override
  String mustBeLocalKsaPhone(String value) {
    return 'Vous devez entrer un numéro saoudien local tel que (05xxxxxxxx)';
  }

  @override
  String mustBeInternationalKsaPhone(String value) {
    return 'Vous devez entrer un numéro saoudien au format international tel que (96605xxxxxxxx)';
  }
}
