// cSpell: disable
// ignore_for_file: unused_local_variable, unnecessary_brace_in_string_interps, equal_keys_in_map, unnecessary_string_interpolations

import 'package:intl/intl.dart' as intl;

import 'messages.dart';

/// The translations for Arabic (`ar`).
class ReadyValidationMessagesAr extends ReadyValidationMessages {
  ReadyValidationMessagesAr([String locale = 'ar']) : super(locale);

  @override
  String contains(String value, String res) {
    return 'يجب أن يحتوي النص على $res';
  }

  @override
  String containsItem(Iterable value, dynamic res) {
    return 'يجب أن تحتوي القائمة على $res';
  }

  @override
  String endsWith(String value, String res) {
    return 'يجب أن ينتهي النص بـ $res';
  }

  @override
  String equal(dynamic value) {
    return 'لا يسمح إلا بالقيمة $value';
  }

  @override
  String greaterThan(num value, num min) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String valueString = valueNumberFormat.format(value);
    final intl.NumberFormat minNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minString = minNumberFormat.format(min);

    return 'يجب أن تكون القيمة أكبر من $minString.';
  }

  @override
  String greaterThanOrEqual(num value, num min) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String valueString = valueNumberFormat.format(value);
    final intl.NumberFormat minNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minString = minNumberFormat.format(min);

    return 'يجب أن تكون القيمة أكبر من أو مساوية ل $minString.';
  }

  @override
  String hasLength(String value, int length) {
    return 'يجب عليك إدخال نص مكون من $length حرف';
  }

  @override
  String hasMaxLength(String value, int max) {
    return 'يجب ألا يزيد النص عن $max';
  }

  @override
  String hasMinLength(String value, int min) {
    return 'يجب أن يكون طول النص على الأقل $min';
  }

  @override
  String hasRange(String value, int min, int max) {
    return 'يجب إدخال نص بطول لا يقل عن $min ولا يزيد عن $max';
  }

  @override
  String invalidAngelCompanyUrl(String value, String company) {
    String _temp0 = intl.Intl.selectLogic(
      company,
      {
        'empty': '',
        'other': '$company',
      },
    );
    return 'آسف! يجب عليك إدخال رابط صحيح لشركة $_temp0 بموقع angel.';
  }

  @override
  String invalidAngelJobUrl(String value, String jobId) {
    String _temp0 = intl.Intl.selectLogic(
      jobId,
      {
        'empty': '',
        'other': ' تحمل المعرف : $jobId',
      },
    );
    return 'آسف! عليك إدخال رابط صحيح لوظيفة $_temp0 بموقع angel.';
  }

  @override
  String invalidCrunchbaseOrganizationUrl(String value, String organization) {
    String _temp0 = intl.Intl.selectLogic(
      organization,
      {
        'empty': ' url ',
        'other': ' بالاسم: $organization',
      },
    );
    return 'آسف! يجب عليك إدخال منظمة crunchbase صالحة $_temp0 بموقع crunchbase.';
  }

  @override
  String invalidCrunchbasePersonUrl(String value, String person) {
    String _temp0 = intl.Intl.selectLogic(
      person,
      {
        'empty': ' url ',
        'other': ' بالاسم: $person',
      },
    );
    return 'آسف! يجب عليك إدخال شخص crunchbase صالح $_temp0 بموقع crunchbase.';
  }

  @override
  String invalidFacebookUrl(String value, String name, String id) {
    String _temp0 = intl.Intl.selectLogic(
      id,
      {
        'empty': ' url ',
        'other': ' للمستخدم الذي يحمل المعرف: $id',
      },
    );
    String _temp1 = intl.Intl.selectLogic(
      name,
      {
        'empty': '$_temp0',
        'other': ' user للمستخدم: $name',
      },
    );
    return 'آسف! يجب عليك إدخال رابط $_temp1 بموقع facebook.';
  }

  @override
  String invalidGitHubUrl(String value, String user, String repository) {
    String _temp0 = intl.Intl.selectLogic(
      repository,
      {
        'empty': ' ',
        'other': ' للمستودع: $repository',
      },
    );
    String _temp1 = intl.Intl.selectLogic(
      repository,
      {
        'empty': '',
        'other': ' : $repository',
      },
    );
    String _temp2 = intl.Intl.selectLogic(
      user,
      {
        'empty': '$_temp0',
        'other': ' للمستخدم: $user $_temp1',
      },
    );
    return 'آسف! يجب عليك إدخال رابط $_temp2 بموقع gitHub.';
  }

  @override
  String invalidGooglePlusUrl(String value, String userName, String id) {
    String _temp0 = intl.Intl.selectLogic(
      userName,
      {
        'empty': ' لمستخدم ',
        'other': ' للمستخدم: $userName',
      },
    );
    return 'آسف! يجب عليك إدخال رابط $_temp0 بموقع google.';
  }

  @override
  String invalidHackerNewsItemUrl(String value, String id) {
    String _temp0 = intl.Intl.selectLogic(
      id,
      {
        'empty': ' لخبر ',
        'other': 'للخبر الذي يحمل المعرف: $id',
      },
    );
    return 'آسف! يجب عليك إدخال رابط $_temp0 بموقع HackerNews.';
  }

  @override
  String invalidHackerNewsUserUrl(String value, String id) {
    String _temp0 = intl.Intl.selectLogic(
      id,
      {
        'empty': ' لمستخدم ',
        'other': ' للمستخدم الذي يحمل المعرف: $id',
      },
    );
    return 'آسف! يجب عليك إدخال رابط $_temp0 بموقع HackerNews.';
  }

  @override
  String invalidInstagramUrl(String value, String user) {
    String _temp0 = intl.Intl.selectLogic(
      user,
      {
        'empty': ' لمستخدم ',
        'other': ' للمستخدم: $user',
      },
    );
    return 'آسف! يجب عليك إدخال رابط $_temp0 بموقع instagram.';
  }

  @override
  String invalidLinkedInCompanyUrl(String value, String permalink) {
    String _temp0 = intl.Intl.selectLogic(
      permalink,
      {
        'empty': 'لشركة',
        'other': 'للشركة التي تحمل المعرف $permalink ',
      },
    );
    return 'آسف! يجب عليك إدخال رابط $_temp0 بموقع linkedIn.';
  }

  @override
  String invalidLinkedInPostUrl(String value, String id) {
    String _temp0 = intl.Intl.selectLogic(
      id,
      {
        'empty': ' لمنشور',
        'other': ' للمنشور الذي يحمل المعرف: $id',
      },
    );
    return 'آسف! يجب عليك إدخال رابط  $_temp0 بموقع linkedIn.';
  }

  @override
  String invalidLinkedInProfileUrl(String value, String permalink) {
    String _temp0 = intl.Intl.selectLogic(
      permalink,
      {
        'empty': 'لملف شخصي',
        'other': 'للملف الشخصي الذي يحمل المعرف $permalink',
      },
    );
    return 'آسف! يجب عليك إدخال رابط $_temp0 بموقع linkedIn.';
  }

  @override
  String invalidMediumPostUrl(String value, String postId) {
    String _temp0 = intl.Intl.selectLogic(
      postId,
      {
        'empty': ' لمنشور ',
        'other': ' للمنشور الذي يحمل المعرف: $postId',
      },
    );
    return 'آسف! يجب عليك إدخال رابط $_temp0 بموقع medium.';
  }

  @override
  String invalidMediumUserUrl(String value, String userName, String id) {
    String _temp0 = intl.Intl.selectLogic(
      id,
      {
        'empty': ' url ',
        'other': ' للمستخدم الذي يحمل المعرف: $id',
      },
    );
    String _temp1 = intl.Intl.selectLogic(
      userName,
      {
        'empty': '$_temp0',
        'other': ' للمستخدم: $userName',
      },
    );
    return 'آسف! يجب عليك إدخال رابط $_temp1  بموقع medium.';
  }

  @override
  String invalidRedditUrl(String value, String user) {
    String _temp0 = intl.Intl.selectLogic(
      user,
      {
        'empty': ' ',
        'other': ' للمستخدم: $user',
      },
    );
    return 'آسف! يجب عليك إدخال رابط $_temp0 بموقع reddit.';
  }

  @override
  String invalidSnapchatUrl(String value, String user) {
    String _temp0 = intl.Intl.selectLogic(
      user,
      {
        'empty': ' url ',
        'other': ' with user: $user',
      },
    );
    return 'آسف! يجب عليك إدخال snapchat صالح $_temp0 بموقع medium.';
  }

  @override
  String invalidStackexchangeUrl(String value, String user, String id) {
    String _temp0 = intl.Intl.selectLogic(
      id,
      {
        'empty': ' ',
        'other': ' بالمعرف: $id',
      },
    );
    String _temp1 = intl.Intl.selectLogic(
      user,
      {
        'empty': '$_temp0',
        'other': ' مع اسم المستخدم: $user',
      },
    );
    return 'آسف! يجب عليك إدخال رابط $_temp1 بموقع stackexchange.';
  }

  @override
  String invalidStackoverflowQuestionUrl(String value, String id) {
    String _temp0 = intl.Intl.selectLogic(
      id,
      {
        'empty': ' لسؤال ',
        'other': ' للسؤال الذي يحمل المعرف: $id',
      },
    );
    return 'آسف! يجب عليك إدخال رابط $_temp0 بموقع stackoverflow.';
  }

  @override
  String invalidStackoverflowUserUrl(String value, String id) {
    String _temp0 = intl.Intl.selectLogic(
      id,
      {
        'empty': ' لمستخدم ',
        'other': ' للمستخدم الذي يحمل المعرف: $id',
      },
    );
    return 'آسف! يجب عليك إدخال رابط $_temp0 بموقع stackoverflow.';
  }

  @override
  String invalidTelegramProfileUrl(String value, String userName) {
    String _temp0 = intl.Intl.selectLogic(
      userName,
      {
        'empty': ' لملف شخصي ',
        'other': ' لملف المستخدم: $userName',
      },
    );
    return 'آسف! يجب عليك إدخال رابط $_temp0 بموقع telegram.';
  }

  @override
  String invalidTwitterStatusUrl(
      String value, String userName, String tweetId) {
    String _temp0 = intl.Intl.selectLogic(
      tweetId,
      {
        'empty': ' لتغريدة ',
        'other': ' للتغريدة التي تحمل المعرف: $tweetId',
      },
    );
    String _temp1 = intl.Intl.selectLogic(
      userName,
      {
        'empty': '',
        'other': ' بإسم: $userName',
      },
    );
    return 'آسف! يجب عليك إدخال رابط $_temp0 $_temp1  بموقع twitter.';
  }

  @override
  String invalidTwitterUserUrl(String value, String userName) {
    String _temp0 = intl.Intl.selectLogic(
      userName,
      {
        'empty': ' لمستخدم ',
        'other': ' للمستخدم: $userName',
      },
    );
    return 'آسف! يجب عليك إدخال رابط $_temp0   بموقع twitter.';
  }

  @override
  String invalidYoutubeChannelUrl(String value, String id) {
    String _temp0 = intl.Intl.selectLogic(
      id,
      {
        'empty': ' لقناة ',
        'other': 'للقناة التي تحمل المعرف: $id',
      },
    );
    return 'آسف! عليك إدخال رابط $_temp0  بموقع youtube.';
  }

  @override
  String invalidYoutubeUserUrl(String value, String userName) {
    String _temp0 = intl.Intl.selectLogic(
      userName,
      {
        'empty': ' لمستخدم ',
        'other': ' للمستخدم: $userName',
      },
    );
    return 'آسف! عليك إدخال رابط $_temp0  بموقع youtube.';
  }

  @override
  String invalidYoutubeVideoUrl(String value, String id) {
    String _temp0 = intl.Intl.selectLogic(
      id,
      {
        'empty': 'لفيديو ',
        'other': ' للفيديو الذي يحمل المعرف: $id',
      },
    );
    return 'آسف! عليك إدخال رابط $_temp0   بموقع youtube.';
  }

  @override
  String isBetween(num value, num min, num max) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String valueString = valueNumberFormat.format(value);
    final intl.NumberFormat minNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minString = minNumberFormat.format(min);
    final intl.NumberFormat maxNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String maxString = maxNumberFormat.format(max);

    return 'يجب أن تكون القيمة أكبر من $minString وأقل من $maxString';
  }

  @override
  String isBetweenOrEqual(num value, num min, num max) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String valueString = valueNumberFormat.format(value);
    final intl.NumberFormat minNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minString = minNumberFormat.format(min);
    final intl.NumberFormat maxNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String maxString = maxNumberFormat.format(max);

    return 'يجب أن تكون القيمة أكبر من أو تساوي $minString وأقل من أو تساوي $maxString';
  }

  @override
  String isCreditCard(Object? v) => 'يجب إدخال رقم بطاقة ائتمان صالح';

  @override
  String isDateAfter(DateTime value, DateTime o) {
    final intl.DateFormat valueDateFormat = intl.DateFormat.yMEd(localeName);
    final String valueString = valueDateFormat.format(value);
    final intl.DateFormat oDateFormat = intl.DateFormat.yMEd(localeName);
    final String oString = oDateFormat.format(o);

    return 'يجب عليك إدخال تاريخ لاحق ل $oString.';
  }

  @override
  String isDateAfterOrEqual(DateTime value, DateTime o) {
    final intl.DateFormat valueDateFormat = intl.DateFormat.yMEd(localeName);
    final String valueString = valueDateFormat.format(value);
    final intl.DateFormat oDateFormat = intl.DateFormat.yMEd(localeName);
    final String oString = oDateFormat.format(o);

    return 'يجب إدخال تاريخ لاحق أو في نفس الوقت $oString.';
  }

  @override
  String isDateBefore(DateTime value, DateTime o) {
    final intl.DateFormat valueDateFormat = intl.DateFormat.yMEd(localeName);
    final String valueString = valueDateFormat.format(value);
    final intl.DateFormat oDateFormat = intl.DateFormat.yMEd(localeName);
    final String oString = oDateFormat.format(o);

    return 'يجب إدخال تاريخ سابق ل $oString.';
  }

  @override
  String isDateBeforeOrEqual(DateTime value, DateTime o) {
    final intl.DateFormat valueDateFormat = intl.DateFormat.yMEd(localeName);
    final String valueString = valueDateFormat.format(value);
    final intl.DateFormat oDateFormat = intl.DateFormat.yMEd(localeName);
    final String oString = oDateFormat.format(o);

    return 'يجب إدخال تاريخ سابق أو في نفس الوقت $oString.';
  }

  @override
  String isDateBetween(DateTime value, DateTime min, DateTime max) {
    final intl.DateFormat valueDateFormat = intl.DateFormat.yMEd(localeName);
    final String valueString = valueDateFormat.format(value);
    final intl.DateFormat minDateFormat = intl.DateFormat.yMEd(localeName);
    final String minString = minDateFormat.format(min);
    final intl.DateFormat maxDateFormat = intl.DateFormat.yMEd(localeName);
    final String maxString = maxDateFormat.format(max);

    return 'يجب عليك إدخال تاريخ بين $minString و$maxString.';
  }

  @override
  String isDateBetweenOrEqual(DateTime value, DateTime min, DateTime max) {
    final intl.DateFormat valueDateFormat = intl.DateFormat.yMEd(localeName);
    final String valueString = valueDateFormat.format(value);
    final intl.DateFormat minDateFormat = intl.DateFormat.yMEd(localeName);
    final String minString = minDateFormat.format(min);
    final intl.DateFormat maxDateFormat = intl.DateFormat.yMEd(localeName);
    final String maxString = maxDateFormat.format(max);

    return 'يجب عليك إدخال تاريخ بين $minString و $maxString  أو في نفس وقت أي منها';
  }

  @override
  String isDateTime(Object? v) => 'يجب إدخال تاريخ صالح';

  @override
  String isBoolean(Object? v) => 'يجب إدخال true أو false';

  @override
  String isDecimal(Object? v) => 'يجب إدخال رقم عشري';

  @override
  String isDivisibleBy(num value, num division) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String valueString = valueNumberFormat.format(value);
    final intl.NumberFormat divisionNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String divisionString = divisionNumberFormat.format(division);

    return 'يجب أن تكون قيمة الإدخال قابلة للقسمة $divisionString';
  }

  @override
  String isEmail(Object? v) => 'يجب إدخال عنوان بريد إلكتروني صالح';

  @override
  String isEven(Object? v) => 'يجب أن تكون القيمة رقمًا زوجي.';

  @override
  String isIn(dynamic value, Iterable list) {
    return 'يجب أن تكون القيمة المدخلة واحدة من $list';
  }

  @override
  String isInteger(Object? v) => 'يجب إدخال رقم صحيح';

  @override
  String isNegative(Object? v) => 'يجب أن تكون القيمة سالبة';

  @override
  String isNotIn(dynamic value, Iterable list) {
    return 'يجب ألا تكون القيمة المدخلة في $list';
  }

  @override
  String isNumber(Object? v) => 'يجب إدخال رقم صالح';

  @override
  String isOdd(Object? v) => 'يجب أن تكون القيمة رقمًا فرديًا';

  @override
  String isPositive(Object? v) => 'يجب أن تكون القيمة موجبة.';

  @override
  String isTimeAfter(DateTime value, DateTime o) {
    final intl.DateFormat valueDateFormat = intl.DateFormat.jm(localeName);
    final String valueString = valueDateFormat.format(value);
    final intl.DateFormat oDateFormat = intl.DateFormat.jm(localeName);
    final String oString = oDateFormat.format(o);

    return 'يجب عليك إدخال وقت لاحق ل $oString.';
  }

  @override
  String isTimeAfterOrEqual(DateTime value, DateTime o) {
    final intl.DateFormat valueDateFormat = intl.DateFormat.jm(localeName);
    final String valueString = valueDateFormat.format(value);
    final intl.DateFormat oDateFormat = intl.DateFormat.jm(localeName);
    final String oString = oDateFormat.format(o);

    return 'يجب إدخال وقت لاحق أو في نفس الوقت $oString.';
  }

  @override
  String isTimeBefore(DateTime value, DateTime o) {
    final intl.DateFormat valueDateFormat = intl.DateFormat.jm(localeName);
    final String valueString = valueDateFormat.format(value);
    final intl.DateFormat oDateFormat = intl.DateFormat.jm(localeName);
    final String oString = oDateFormat.format(o);

    return 'يجب عليك إدخال وقت سابق ل $oString.';
  }

  @override
  String isTimeBeforeOrEqual(DateTime value, DateTime o) {
    final intl.DateFormat valueDateFormat = intl.DateFormat.jm(localeName);
    final String valueString = valueDateFormat.format(value);
    final intl.DateFormat oDateFormat = intl.DateFormat.jm(localeName);
    final String oString = oDateFormat.format(o);

    return 'يجب إدخال وقت سابق أو في نفس الوقت $oString.';
  }

  @override
  String isTimeBetween(DateTime value, DateTime min, DateTime max) {
    final intl.DateFormat valueDateFormat = intl.DateFormat.jm(localeName);
    final String valueString = valueDateFormat.format(value);
    final intl.DateFormat minDateFormat = intl.DateFormat.jm(localeName);
    final String minString = minDateFormat.format(min);
    final intl.DateFormat maxDateFormat = intl.DateFormat.jm(localeName);
    final String maxString = maxDateFormat.format(max);

    return 'يجب عليك إدخال وقت بين $minString و$maxString.';
  }

  @override
  String isTimeBetweenOrEqual(DateTime value, DateTime min, DateTime max) {
    final intl.DateFormat valueDateFormat = intl.DateFormat.jm(localeName);
    final String valueString = valueDateFormat.format(value);
    final intl.DateFormat minDateFormat = intl.DateFormat.jm(localeName);
    final String minString = minDateFormat.format(min);
    final intl.DateFormat maxDateFormat = intl.DateFormat.jm(localeName);
    final String maxString = maxDateFormat.format(max);

    return 'يجب عليك إدخال وقت بين $minString و $maxString  أو في نفس وقت أي منها';
  }

  @override
  String isTimeOfDay(Object? v) => 'يجب إدخال وقت صحيح';

  @override
  String lessThan(num value, num max) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String valueString = valueNumberFormat.format(value);
    final intl.NumberFormat maxNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String maxString = maxNumberFormat.format(max);

    return 'يجب أن تكون القيمة أقل من $maxString.';
  }

  @override
  String lessThanOrEqual(num value, num max) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String valueString = valueNumberFormat.format(value);
    final intl.NumberFormat maxNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String maxString = maxNumberFormat.format(max);

    return 'يجب أن تكون القيمة أقل من أو تساوي $maxString.';
  }

  @override
  String listHasLength(Iterable value, int length) {
    return 'يجب أن يساوي عدد العناصر $length';
  }

  @override
  String listMaxLength(Iterable value, int max) {
    return 'يجب ألا يزيد عدد العناصر عن $max';
  }

  @override
  String listMinLength(Iterable value, int min) {
    return 'يجب ألا يقل عدد العناصر عن $min';
  }

  @override
  String listRange(Iterable value, int min, int max) {
    return 'يجب أن يكون عدد العناصر بين $min و $max';
  }

  @override
  String notContainsItem(Iterable value, dynamic res) {
    return 'يجب ألا تحتوي القائمة على $res';
  }

  @override
  String get notEmpty => 'يجب عدم إدخال قيمة فارغة';

  @override
  String notEqual(dynamic value) {
    return 'غير مسموح بإدخال $value';
  }

  @override
  String get regexp => 'التنسيق المطلوب غير متوافق مع المدخلات';

  @override
  String get required => 'عفوا! هذا الحقل مطلوب';

  @override
  String startsWith(String value, String res) {
    return 'يجب أن يبدأ النص ب $res';
  }
}
