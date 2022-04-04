

import 'package:intl/intl.dart' as intl;
import 'messages.dart';

/// The translations for Urdu (`ur`).
class ReadyValidationMessagesUr extends ReadyValidationMessages {
  ReadyValidationMessagesUr([String locale = 'ur']) : super(locale);

  @override
  String contains(String value, String res) {
    return 'متن پر مشتمل ہونا چاہئے $res';
  }

  @override
  String containsItem(Iterable value, dynamic res) {
    return 'فہرست پر مشتمل ہونا چاہئے $res';
  }

  @override
  String endsWith(String value, String res) {
    return 'متن کے ساتھ ختم ہونا چاہئے $res';
  }

  @override
  String equal(dynamic value) {
    return 'صرف قدر $value کی اجازت ہے۔';
  }

  @override
  String greaterThan(bool equal, num value, num min) {
    final String selectString = intl.Intl.select(
      equal,
      {
        'true': 'یا برابر',
        'other': ''
      },
      desc: 'No description provided in @greaterThan'
    );

    return 'قیمت سے زیادہ ہونا چاہئے, ${selectString}';
  }

  @override
  String hasMaxLength(String value, int max) {
    return 'متن $max سے زیادہ نہیں ہونا چاہیے';
  }

  @override
  String hasLength(String value, int length) {
    return 'آپ کو $length حروف کا متن درج کرنا ہوگا۔';
  }

  @override
  String listHasLength(Iterable value, int length) {
    return 'عناصر کی تعداد $length کے برابر ہونی چاہیے';
  }

  @override
  String hasMinLength(String value, int min) {
    return 'متن کی لمبائی کم از کم $min ہونی چاہیے';
  }

  @override
  String hasRange(String value, int min, int max) {
    return 'آپ کو طوالت کا متن درج کرنا چاہیے جو $min سے کم نہ ہو اور $max سے زیادہ نہ ہو۔';
  }

  @override
  String isAfter(bool equal, DateTime value, DateTime date) {
    final String selectString = intl.Intl.select(
      equal,
      {
        'true': 'یا برابر',
        'other': ''
      },
      desc: 'No description provided in @isAfter'
    );

    return 'آپ کے ${selectString}';
  }

  @override
  String isBefore(bool equal, DateTime value, DateTime date) {
    final String selectString = intl.Intl.select(
      equal,
      {
        'true': 'یا اس کے برابر',
        'other': ''
      },
      desc: 'No description provided in @isBefore'
    );

    return 'آپ سے پہلے ایک تاریخ درج کرنا ضروری ${selectString}';
  }

  @override
  String isBetween(bool equal, num value, num min, num max) {
    final String selectString = intl.Intl.select(
      equal,
      {
        'true': 'یا برابر',
        'other': ''
      },
      desc: 'No description provided in @isBetween'
    );

    return 'قیمت $selectString سے زیادہ اور کم ہونا ضروری ہے';
  }

  @override
  String isDateBetween(bool equal, DateTime value, DateTime min, DateTime max) {
    final String selectString = intl.Intl.select(
      equal,
      {
        'true': 'یا ایک کے برابر',
        'other': ''
      },
      desc: 'No description provided in @isDateBetween'
    );

    return 'آپ کے ${selectString}';
  }

  @override
  String isDateTime(Object value) {
    return 'آپ کو ایک درست تاریخ درج کرنی ہوگی۔';
  }

  @override
  String isDecimal(Object value) {
    return 'آپ کو اعشاریہ نمبر درج کرنا ہوگا۔';
  }

  @override
  String isDivisibleBy(num value, num division) {
    final intl.NumberFormat valueNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String valueString = valueNumberFormat.format(value);
    final intl.NumberFormat divisionNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String divisionString = divisionNumberFormat.format(division);

    return 'ان پٹ ویلیو کی طرف سے تقسیم ہونا ضروری ہے $divisionString';
  }

  @override
  String isEven(num value) {
    final intl.NumberFormat valueNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String valueString = valueNumberFormat.format(value);

    return 'قدر ایک بھی عدد ہونا ضروری ہے';
  }

  @override
  String isIn(dynamic value, Iterable list) {
    return 'درج کردہ قدر $list میں سے ایک ہونی چاہیے';
  }

  @override
  String isInteger(Object value) {
    return 'آپ کو ایک درست نمبر درج کرنا ہوگا۔';
  }

  @override
  String isNegative(num value) {
    final intl.NumberFormat valueNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String valueString = valueNumberFormat.format(value);

    return 'قدر منفی ہونا ضروری ہے';
  }

  @override
  String isNotIn(dynamic value, Iterable list) {
    return 'درج کردہ قدر $list میں نہیں ہونی چاہیے';
  }

  @override
  String isNumber(Object value) {
    return 'آپ کو ایک درست نمبر درج کرنا ہوگا۔';
  }

  @override
  String isOdd(num value) {
    final intl.NumberFormat valueNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String valueString = valueNumberFormat.format(value);

    return 'قدر ایک عجیب عدد ہونا ضروری ہے';
  }

  @override
  String isPositive(num value) {
    final intl.NumberFormat valueNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String valueString = valueNumberFormat.format(value);

    return 'قدر مثبت ہونا چاہئے';
  }

  @override
  String isTimeOfDay(Object value) {
    return 'آپ کو ایک درست وقت درج کرنا ہوگا۔';
  }

  @override
  String lessThan(bool equal, num value, num max) {
    final String selectString = intl.Intl.select(
      equal,
      {
        'true': 'یا برابر',
        'other': ''
      },
      desc: 'No description provided in @lessThan'
    );

    return 'قیمت سے کم ہونا ضروری ہے, ${selectString}';
  }

  @override
  String listMaxLength(Iterable value, int max) {
    return 'اشیاء کی تعداد سے زیادہ نہیں ہونا چاہئے $max';
  }

  @override
  String listMinLength(Iterable value, int min) {
    return 'اشیاء کی تعداد سے کم نہیں ہونا چاہئے $min';
  }

  @override
  String listRange(Iterable value, int min, int max) {
    return 'اشیاء کی تعداد کم از کم $minاور اس سے زیادہ نہیں ہونا چاہئے $max';
  }

  @override
  String notContainsItem(Iterable value, dynamic res) {
    return 'فہرست پر مشتمل نہیں ہے $res';
  }

  @override
  String get notEmpty => 'خالی قیمت درج نہیں کی جانی چاہئے۔';

  @override
  String notEqual(dynamic value) {
    return '$value میں داخل ہونے کی اجازت نہیں ہے';
  }

  @override
  String get regexp => 'درخواست کردہ فارمیٹ ان پٹ کے ساتھ مطابقت نہیں رکھتا ہے۔';

  @override
  String get required => 'معاف کیجئے گا! اس کو پر کرنا ضروری ہے';

  @override
  String startsWith(String value, String res) {
    return 'متن کے ساتھ شروع کرنا چاہئے $res';
  }
}
