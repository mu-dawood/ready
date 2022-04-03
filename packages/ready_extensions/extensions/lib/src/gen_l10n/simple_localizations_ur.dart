

import 'package:intl/intl.dart' as intl;
import 'simple_localizations.dart';

/// The translations for Urdu (`ur`).
class SimpleLocalizationsUr extends SimpleLocalizations {
  SimpleLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String yearsPlural(int count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'ایک سال',
      two: 'دو سال',
      few: '$count سال',
      other: '$count سال',
    );
  }

  @override
  String monthsPlural(int count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'ایک مہینہ',
      two: 'دو ماہ',
      few: '$count مہینہ',
      other: '$count مہینہ',
    );
  }

  @override
  String daysPlural(int count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'ایک دن',
      two: 'دو دن',
      few: '$count دن',
      other: '$count دن',
    );
  }

  @override
  String weeksPlural(int count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'ایک ہفتہ',
      two: 'دو ہفتے',
      few: '$count ہفتے',
      other: '$count ہفتے',
    );
  }

  @override
  String hoursPlural(int count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'ایک گھنٹہ',
      two: 'دو گھنٹے',
      few: '$count گھنٹے',
      other: '$count گھنٹے',
    );
  }

  @override
  String minutesPlural(int count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'ایک منٹ',
      two: 'دو منٹ',
      few: '$count منٹ',
      other: '$count منٹ',
    );
  }

  @override
  String socondsPlural(int count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'ایک سیکنڈ',
      two: 'دو سیکنڈ',
      few: '$count سیکنڈ',
      other: '$count سیکنڈ',
    );
  }

  @override
  String get now => 'ابھی';

  @override
  String get formatSeperator => ' ، ';

  @override
  String get required => 'معذرت! اس کو پر کرنا ضروری ہے';

  @override
  String stringMaxLength(String value, int max) {
    return 'متن $max سے زیادہ نہیں ہونا چاہیے';
  }

  @override
  String stringMinLength(String value, int min) {
    return 'متن کی لمبائی کم از کم $min ہونی چاہیے';
  }

  @override
  String stringMustBeInRange(String value, int min, int max) {
    return 'آپ کو طوالت کا متن درج کرنا چاہیے جو $min سے کم نہ ہو اور $max سے زیادہ نہ ہو۔';
  }

  @override
  String stringMustBeDateTime(String value) {
    return 'آپ کو ایک درست تاریخ درج کرنی ہوگی۔';
  }

  @override
  String stringMustBeTimeOfDay(String value) {
    return 'آپ کو ایک درست وقت درج کرنا ہوگا۔';
  }

  @override
  String mustBeDateAfter(DateTime value, DateTime after) {
    final intl.DateFormat valueDateFormat = intl.DateFormat.yMMMEd(localeName);
    final String valueString = valueDateFormat.format(value);
    final intl.DateFormat afterDateFormat = intl.DateFormat.yMMMEd(localeName);
    final String afterString = afterDateFormat.format(after);

    return '$afterString کے لیے بعد کی تاریخ درج کرنا ضروری ہے';
  }

  @override
  String mustBeDateBefore(DateTime value, DateTime before) {
    final intl.DateFormat valueDateFormat = intl.DateFormat.yMMMEd(localeName);
    final String valueString = valueDateFormat.format(value);
    final intl.DateFormat beforeDateFormat = intl.DateFormat.yMMMEd(localeName);
    final String beforeString = beforeDateFormat.format(before);

    return 'آپ کو پہلے کی تاریخ درج کرنا ضروری ہے $beforeString';
  }

  @override
  String mustBeTimeOfDayAfter(dynamic value, dynamic after) {
    return 'آپ کو بعد میں داخل ہونا ضروری ہے $after';
  }

  @override
  String mustBeTimeOfDayBefore(dynamic value, dynamic before) {
    return 'آپ کو پہلے وقت میں داخل ہونا ضروری ہے $before';
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
    return 'آپ کو ایک نمبر درج کرنا ہوگا';
  }

  @override
  String mustBeInteger(String value) {
    return 'آپ کو ایک غیر دشملو نمبر درج کرنا ضروری ہے';
  }

  @override
  String mustBeDecimal(String value) {
    return 'آپ کو ایک دشملو نمبر درج کرنا ضروری ہے';
  }

  @override
  String mustBeGithubUrl(String value) {
    return 'آپ کو ایک Github اکاؤنٹ لنک درج کرنا ہوگا';
  }

  @override
  String mustBeRedditUrl(String value) {
    return 'ریڈٹ اکاؤنٹ کا لنک درج ہونا ضروری ہے';
  }

  @override
  String mustBeInstagramUrl(String value) {
    return 'Instagram اکاؤنٹ کا لنک درج ہونا ضروری ہے';
  }

  @override
  String mustBeLinkedinProfile(String value) {
    return 'لنکڈین اکاؤنٹ کا لنک درج ہونا ضروری ہے';
  }

  @override
  String mustBeTwitterUser(String value) {
    return 'ٹویٹر اکاؤنٹ کا لنک درج ہونا ضروری ہے';
  }

  @override
  String mustBeYoutubeVideoUrl(String value) {
    return 'یو ٹیوب لنک داخل ہونا ضروری ہے';
  }

  @override
  String mustBeFacbookPageOrProfile(String value) {
    return 'آپ کو ایک فیکبک لنک درج کرنا ہوگا';
  }

  @override
  String mustBeSnapchatProfile(String value) {
    return 'آپ کو ایک سنیپ چیٹ اکاؤنٹ لنک درج کرنا ہوگا';
  }

  @override
  String mustBeUrl(String value) {
    return 'آپ کو ایک درست لنک درج کرنا ضروری ہے';
  }

  @override
  String mustBeEmail(String value) {
    return 'آپ کو ایک درست ای میل درج کرنا ضروری ہے';
  }

  @override
  String mustBeHexColor(String value) {
    return 'آپ کو صحیح رنگ درج کرنا ہوگا جیسے (#ff0000)';
  }

  @override
  String mustBeLocalEgyptianPhone(String value) {
    return 'آپ کو مقامی مصری نمبر درج کرنا ہوگا جیسے (015xxxxxxxx)';
  }

  @override
  String mustBeInternationalEgyptianPhone(String value) {
    return 'آپ کو بین الاقوامی شکل میں ایک مصری نمبر درج کرنا ہوگا جیسے (2015xxxxxxxx)';
  }

  @override
  String mustBeLocalKsaPhone(String value) {
    return 'آپ کو ایک مقامی سعودی نمبر درج کرنا ہوگا جیسے (05xxxxxxxx)';
  }

  @override
  String mustBeInternationalKsaPhone(String value) {
    return 'آپ کو بین الاقوامی شکل میں سعودی نمبر درج کرنا ہوگا جیسے (96605xxxxxxxx)';
  }
}
