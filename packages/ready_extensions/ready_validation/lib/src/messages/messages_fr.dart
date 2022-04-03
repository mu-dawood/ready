

import 'package:intl/intl.dart' as intl;
import 'messages.dart';

/// The translations for French (`fr`).
class ReadyValidationMessagesFr extends ReadyValidationMessages {
  ReadyValidationMessagesFr([String locale = 'fr']) : super(locale);

  @override
  String contains(String value, String res) {
    return 'Le texte doit contenir $res';
  }

  @override
  String containsItem(dynamic value, dynamic res) {
    return 'La liste doit contenir $res';
  }

  @override
  String endsWith(String value, String res) {
    return 'Le texte doit se terminer par $res';
  }

  @override
  String equal(dynamic value) {
    return 'Seule la valeur $value est autorisée.';
  }

  @override
  String greaterThan(bool equal, num value, num min) {
    final String selectString = intl.Intl.select(
      equal,
      {
        'true': 'ou égal à',
        'autre': ''
      },
      desc: 'No description provided in @greaterThan'
    );

    return 'La valeur doit être supérieure à, ${selectString}';
  }

  @override
  String hasMaxLength(String value, int max) {
    return 'Le texte ne doit pas dépasser $max';
  }

  @override
  String hasMinLength(String value, int min) {
    return 'La longueur du texte doit être d\'au moins $min';
  }

  @override
  String hasRange(String value, int min, int max) {
    return 'Vous devez saisir un texte d\'une longueur non inférieure à $min et non supérieure à $max';
  }

  @override
  String isAfter(bool equal, DateTime value, DateTime date) {
    final String selectString = intl.Intl.select(
      equal,
      {
        'true': 'ou égal à'
      },
      desc: 'No description provided in @isAfter'
    );

    return 'Vous devez entrer une date ultérieure ${selectString}';
  }

  @override
  String isBefore(bool equal, DateTime value, DateTime date) {
    final String selectString = intl.Intl.select(
      equal,
      {
        'true': 'ou égal à'
      },
      desc: 'No description provided in @isBefore'
    );

    return 'Vous devez entrer une date antérieure ${selectString}';
  }

  @override
  String isBetween(bool equal, num value, num min, num max) {
    final String selectString = intl.Intl.select(
      equal,
      {
        'true': 'ou égal'
      },
      desc: 'No description provided in @isBetween'
    );

    return 'La valeur doit être ${selectString}';
  }

  @override
  String isDateBetween(bool equal, DateTime value, DateTime min, DateTime max) {
    final String selectString = intl.Intl.select(
      equal,
      {
        'true': 'ou égal à un'
      },
      desc: 'No description provided in @isDateBetween'
    );

    return 'Vous devez entrer une date ${selectString}';
  }

  @override
  String isDateTime(Object value) {
    return 'Vous devez entrer une date valide';
  }

  @override
  String isDecimal(Object value) {
    return 'Vous devez entrer un nombre décimal';
  }

  @override
  String isDivisibleBy(num value, num division) {
    final intl.NumberFormat valueNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String valueString = valueNumberFormat.format(value);
    final intl.NumberFormat divisionNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String divisionString = divisionNumberFormat.format(division);

    return 'La valeur d\'entrée doit être divisible par $divisionString';
  }

  @override
  String isEven(num value) {
    final intl.NumberFormat valueNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String valueString = valueNumberFormat.format(value);

    return 'La valeur doit être un nombre pair';
  }

  @override
  String isIn(dynamic value, List list) {
    return 'La valeur saisie doit faire partie de la {liste}';
  }

  @override
  String isInteger(Object value) {
    return 'Vous devez saisir un numéro valide';
  }

  @override
  String isNegative(num value) {
    final intl.NumberFormat valueNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String valueString = valueNumberFormat.format(value);

    return 'La valeur doit être négative';
  }

  @override
  String isNotIn(dynamic value, List list) {
    return 'La valeur saisie ne doit pas être dans $list';
  }

  @override
  String isNumber(Object value) {
    return 'Vous devez saisir un numéro valide';
  }

  @override
  String isOdd(num value) {
    final intl.NumberFormat valueNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String valueString = valueNumberFormat.format(value);

    return 'La valeur doit être un nombre impair';
  }

  @override
  String isPositive(num value) {
    final intl.NumberFormat valueNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String valueString = valueNumberFormat.format(value);

    return 'La valeur doit être positive';
  }

  @override
  String isTimeOfDay(Object value) {
    return 'Vous devez saisir une heure valide';
  }

  @override
  String lessThan(bool equal, num value, num max) {
    final String selectString = intl.Intl.select(
      equal,
      {
        'true': 'ou égal à',
        'autre': ''
      },
      desc: 'No description provided in @lessThan'
    );

    return 'La valeur doit être inférieure à, ${selectString}';
  }

  @override
  String listMaxLength(String value, int max) {
    return 'Le nombre d\'articles ne doit pas dépasser $max';
  }

  @override
  String listMinLength(String value, int min) {
    return 'Le nombre d\'articles ne doit pas être inférieur à $min';
  }

  @override
  String listRange(String value, int min, int max) {
    return 'Le nombre d\'articles doit être d\'au moins ${min}et pas plus de $max';
  }

  @override
  String notContainsItem(dynamic value, dynamic res) {
    return 'La liste ne doit pas nécessairement contenir $res';
  }

  @override
  String get notEmpty => 'Une valeur vide ne doit pas être saisie';

  @override
  String notEqual(dynamic value) {
    return 'Non autorisé à entrer $value';
  }

  @override
  String get regexp => 'Le format demandé n\'est pas compatible avec l\'entrée';

  @override
  String get required => 'Excuse-moi! Ce champ est requis';

  @override
  String startsWith(String value, String res) {
    return 'Le texte doit commencer par $res';
  }
}
