

import 'package:intl/intl.dart' as intl;
import 'messages.dart';

/// The translations for Arabic (`ar`).
class ReadyValidationMessagesAr extends ReadyValidationMessages {
  ReadyValidationMessagesAr([String locale = 'ar']) : super(locale);

  @override
  String contains(String value, String res) {
    return 'يجب أن يحتوي النص علي $res';
  }

  @override
  String containsItem(dynamic value, dynamic res) {
    return 'يجب أن تحتوي القائمة علي $res';
  }

  @override
  String endsWith(String value, String res) {
    return 'يجب أن ينتهي النص ب $res';
  }

  @override
  String equal(dynamic value) {
    return 'مسموح فقط بإدخال القيمة $value';
  }

  @override
  String greaterThan(bool equal, num value, num min) {
    final String selectString = intl.Intl.select(
      equal,
      {
        'true': ' أو تساوي',
        'other': ''
      },
      desc: 'No description provided in @greaterThan'
    );

    return 'يجب أن تكون القيمة أكبر من, ${selectString}';
  }

  @override
  String hasMaxLength(String value, int max) {
    return 'يجب أن لا يزيد طول النص عن $max';
  }

  @override
  String hasMinLength(String value, int min) {
    return 'يجب أن لا يقل طول النص عن $min';
  }

  @override
  String hasRange(String value, int min, int max) {
    return 'يجب إدخال نص  لايقل طوله عن $min ولا يزيد عن $max';
  }

  @override
  String isAfter(bool equal, DateTime value, DateTime date) {
    final String selectString = intl.Intl.select(
      equal,
      {
        'true': ' أو مساو له'
      },
      desc: 'No description provided in @isAfter'
    );

    return 'يجب إدخال تاريخ لاحق ل ${selectString}';
  }

  @override
  String isBefore(bool equal, DateTime value, DateTime date) {
    final String selectString = intl.Intl.select(
      equal,
      {
        'true': ' أو مساو له'
      },
      desc: 'No description provided in @isBefore'
    );

    return 'يجب إدخال تاريخ سابق ل ${selectString}';
  }

  @override
  String isBetween(bool equal, num value, num min, num max) {
    final String selectString = intl.Intl.select(
      equal,
      {
        'true': ' أو تساويهم'
      },
      desc: 'No description provided in @isBetween'
    );

    return 'يجب أن تكون القيمة أكبر من ${selectString}';
  }

  @override
  String isDateBetween(bool equal, DateTime value, DateTime min, DateTime max) {
    final String selectString = intl.Intl.select(
      equal,
      {
        'true': ' أو مساو لأحدهم'
      },
      desc: 'No description provided in @isDateBetween'
    );

    return 'يجب إدخال تاريخ بين ${selectString}';
  }

  @override
  String isDateTime(Object value) {
    return 'يجب إدخال تاريخ صحيح';
  }

  @override
  String isDecimal(Object value) {
    return 'يجب إدخال رقم عشري';
  }

  @override
  String isDivisibleBy(num value, num division) {
    final intl.NumberFormat valueNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String valueString = valueNumberFormat.format(value);
    final intl.NumberFormat divisionNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String divisionString = divisionNumberFormat.format(division);

    return 'يجب أن تكون القيمة المدخلة قابلة للقسمة علي $divisionString';
  }

  @override
  String isEven(num value) {
    final intl.NumberFormat valueNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String valueString = valueNumberFormat.format(value);

    return 'يجب أن تكون القيمة رقم زوجي';
  }

  @override
  String isIn(dynamic value, List list) {
    return 'يجب أن تكون القيمة المدخلة من إحدى القيم $list';
  }

  @override
  String isInteger(Object value) {
    return 'يجب إدخال رقم صحيح';
  }

  @override
  String isNegative(num value) {
    final intl.NumberFormat valueNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String valueString = valueNumberFormat.format(value);

    return 'يجب أن تكون القيمة سالبة';
  }

  @override
  String isNotIn(dynamic value, List list) {
    return 'لا يجب أن تكون القيمة المدخلة من القيم $list';
  }

  @override
  String isNumber(Object value) {
    return 'يجب إدخال رقم';
  }

  @override
  String isOdd(num value) {
    final intl.NumberFormat valueNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String valueString = valueNumberFormat.format(value);

    return 'يجب أن تكون القيمة رقم فردي';
  }

  @override
  String isPositive(num value) {
    final intl.NumberFormat valueNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String valueString = valueNumberFormat.format(value);

    return 'يجب أن تكون القيمة موجبة';
  }

  @override
  String isTimeOfDay(Object value) {
    return 'يجب إدخال وقت صحيح';
  }

  @override
  String lessThan(bool equal, num value, num max) {
    final String selectString = intl.Intl.select(
      equal,
      {
        'true': ' أو تساوي',
        'other': ''
      },
      desc: 'No description provided in @lessThan'
    );

    return 'يجب أن تكون القيمة أقل من, ${selectString}';
  }

  @override
  String listMaxLength(String value, int max) {
    return 'لا يجب أن يزيد عدد العناصر عن $max';
  }

  @override
  String listMinLength(String value, int min) {
    return 'لا يجب أن يقل عدد العناصر عن $min';
  }

  @override
  String listRange(String value, int min, int max) {
    return 'يجب أن لا يقل عدد العناصر  عن $min ولا يزيد عن $max';
  }

  @override
  String notContainsItem(dynamic value, dynamic res) {
    return 'لا يجب أن تحتوي القائمة علي $res';
  }

  @override
  String get notEmpty => 'لا يجب إدخال قيمة فارغة';

  @override
  String notEqual(dynamic value) {
    return 'غير مسموح بإدخال القيمة $value';
  }

  @override
  String get regexp => 'الصيغة المطلوبة غير متوافقة مع المدخلات';

  @override
  String get required => 'عذرا! هذا الحقل مطلوب';

  @override
  String startsWith(String value, String res) {
    return 'يجب أن يبدأ النص ب $res';
  }
}
