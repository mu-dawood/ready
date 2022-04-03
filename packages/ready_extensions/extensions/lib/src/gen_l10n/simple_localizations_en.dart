

import 'package:intl/intl.dart' as intl;
import 'simple_localizations.dart';

/// The translations for English (`en`).
class SimpleLocalizationsEn extends SimpleLocalizations {
  SimpleLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String yearsPlural(int count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'one year',
      two: 'Two years',
      other: '$count years',
    );
  }

  @override
  String monthsPlural(int count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'one month',
      two: 'two months',
      other: '$count months',
    );
  }

  @override
  String daysPlural(int count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'one day',
      two: 'two days',
      other: '$count days',
    );
  }

  @override
  String weeksPlural(int count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'one week',
      two: 'two weeks',
      other: '$count weeks',
    );
  }

  @override
  String hoursPlural(int count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'one hour',
      two: 'two hours',
      other: '$count hours',
    );
  }

  @override
  String minutesPlural(int count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'one minute',
      two: 'two minutes',
      other: '$count minutes',
    );
  }

  @override
  String socondsPlural(int count) {
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
  String get formatSeperator => ' , ';

  @override
  String get required => 'Excuse me! This field is required';

  @override
  String stringMaxLength(String value, int max) {
    return 'The text must be no longer than $max';
  }

  @override
  String stringMinLength(String value, int min) {
    return 'The length of the text must be at least $min';
  }

  @override
  String stringMustBeInRange(String value, int min, int max) {
    return 'You must enter a text of length not less than $min and not more than $max';
  }

  @override
  String stringMustBeDateTime(String value) {
    return 'You must enter a valid date';
  }

  @override
  String stringMustBeTimeOfDay(String value) {
    return 'You must enter a valid time';
  }

  @override
  String mustBeDateAfter(DateTime value, DateTime after) {
    final intl.DateFormat valueDateFormat = intl.DateFormat.yMMMEd(localeName);
    final String valueString = valueDateFormat.format(value);
    final intl.DateFormat afterDateFormat = intl.DateFormat.yMMMEd(localeName);
    final String afterString = afterDateFormat.format(after);

    return 'You must enter a later date for $afterString';
  }

  @override
  String mustBeDateBefore(DateTime value, DateTime before) {
    final intl.DateFormat valueDateFormat = intl.DateFormat.yMMMEd(localeName);
    final String valueString = valueDateFormat.format(value);
    final intl.DateFormat beforeDateFormat = intl.DateFormat.yMMMEd(localeName);
    final String beforeString = beforeDateFormat.format(before);

    return 'You must enter an earlier date for $beforeString';
  }

  @override
  String mustBeTimeOfDayAfter(dynamic value, dynamic after) {
    return 'You must enter a later time to $after';
  }

  @override
  String mustBeTimeOfDayBefore(dynamic value, dynamic before) {
    return 'You must enter an earlier time to $before';
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
    return 'You must enter a number';
  }

  @override
  String mustBeInteger(String value) {
    return 'You must enter a non-decimal number';
  }

  @override
  String mustBeDecimal(String value) {
    return 'You must enter a decimal number';
  }

  @override
  String mustBeGithubUrl(String value) {
    return 'You must enter a Github account link';
  }

  @override
  String mustBeRedditUrl(String value) {
    return 'Reddit account link must be entered';
  }

  @override
  String mustBeInstagramUrl(String value) {
    return 'Instagram account link must be entered';
  }

  @override
  String mustBeLinkedinProfile(String value) {
    return 'Linkedin account link must be entered';
  }

  @override
  String mustBeTwitterUser(String value) {
    return 'Twitter account link must be entered';
  }

  @override
  String mustBeYoutubeVideoUrl(String value) {
    return 'Youtube link must be entered';
  }

  @override
  String mustBeFacbookPageOrProfile(String value) {
    return 'You must enter a Facbook link';
  }

  @override
  String mustBeSnapchatProfile(String value) {
    return 'You must enter a Snapchat account link';
  }

  @override
  String mustBeUrl(String value) {
    return 'You must enter a valid link';
  }

  @override
  String mustBeEmail(String value) {
    return 'You must enter a valid email';
  }

  @override
  String mustBeHexColor(String value) {
    return 'You must enter a correct color such as (#ff0000)';
  }

  @override
  String mustBeLocalEgyptianPhone(String value) {
    return 'You must enter a local Egyptian number such as (015xxxxxxxx)';
  }

  @override
  String mustBeInternationalEgyptianPhone(String value) {
    return 'You must enter an Egyptian number in the international format such as (2015xxxxxxxx)';
  }

  @override
  String mustBeLocalKsaPhone(String value) {
    return 'You must enter a local Saudi number such as (05xxxxxxxx)';
  }

  @override
  String mustBeInternationalKsaPhone(String value) {
    return 'You must enter a Saudi number in the international format such as (96605xxxxxxxx)';
  }
}
