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
    final String selectString = intl.Intl.select(
        company, {'_': '  ', 'other': '${company}'},
        desc: 'No description provided in @invalidAngelCompanyUrl');

    return 'آسف! يجب عليك إدخال رابط صحيح لشركة $selectString بموقع angel.';
  }

  @override
  String invalidAngelJobUrl(String value, String jobId) {
    final String selectString = intl.Intl.select(
        jobId, {'_': '', 'other': ' تحمل المعرف : ${jobId}'},
        desc: 'No description provided in @invalidAngelJobUrl');

    return 'آسف! عليك إدخال رابط صحيح لوظيفة $selectString بموقع angel.';
  }

  @override
  String invalidCrunchbaseOrganizationUrl(String value, String organization) {
    final String selectString = intl.Intl.select(
        organization, {'_': ' url ', 'other': ' بالاسم: ${organization}'},
        desc: 'No description provided in @invalidCrunchbaseOrganizationUrl');

    return 'آسف! يجب عليك إدخال منظمة crunchbase صالحة $selectString بموقع crunchbase.';
  }

  @override
  String invalidCrunchbasePersonUrl(String value, String person) {
    final String selectString = intl.Intl.select(
        person, {'_': ' url ', 'other': ' بالاسم: ${person}'},
        desc: 'No description provided in @invalidCrunchbasePersonUrl');

    return 'آسف! يجب عليك إدخال شخص crunchbase صالح $selectString بموقع crunchbase.';
  }

  @override
  String invalidFacebookUrl(String value, String name, String id) {
    final String selectString = intl.Intl.select(
        name,
        {
          '_': '{id, select, _{ url ',
          'other': ' للمستخدم الذي يحمل المعرف: ${id}',
          'other': ' user للمستخدم: ${name}'
        },
        desc: 'No description provided in @invalidFacebookUrl');

    return 'آسف! يجب عليك إدخال رابط $selectString بموقع facebook.';
  }

  @override
  String invalidGitHubUrl(String value, String user, String repository) {
    final String selectString = intl.Intl.select(
        user,
        {
          '_': '{repository, select, _{ ',
          'other': ' للمستودع: ${repository}',
          'other': ' للمستخدم: $user {repository, select, _{',
          'other': ' : ${repository}'
        },
        desc: 'No description provided in @invalidGitHubUrl');

    return 'آسف! يجب عليك إدخال رابط $selectString بموقع gitHub.';
  }

  @override
  String invalidGooglePlusUrl(String value, String userName, String id) {
    final String selectString = intl.Intl.select(
        userName, {'_': ' لمستخدم ', 'other': ' للمستخدم: ${userName}'},
        desc: 'No description provided in @invalidGooglePlusUrl');

    return 'آسف! يجب عليك إدخال رابط $selectString بموقع google.';
  }

  @override
  String invalidHackerNewsItemUrl(String value, String id) {
    final String selectString = intl.Intl.select(
        id, {'_': ' لخبر ', 'other': 'للخبر الذي يحمل المعرف: ${id}'},
        desc: 'No description provided in @invalidHackerNewsItemUrl');

    return 'آسف! يجب عليك إدخال رابط $selectString بموقع HackerNews.';
  }

  @override
  String invalidHackerNewsUserUrl(String value, String id) {
    final String selectString = intl.Intl.select(
        id, {'_': ' لمستخدم ', 'other': ' للمستخدم الذي يحمل المعرف: ${id}'},
        desc: 'No description provided in @invalidHackerNewsUserUrl');

    return 'آسف! يجب عليك إدخال رابط $selectString بموقع HackerNews.';
  }

  @override
  String invalidInstagramUrl(String value, String user) {
    final String selectString = intl.Intl.select(
        user, {'_': ' لمستخدم ', 'other': ' للمستخدم: ${user}'},
        desc: 'No description provided in @invalidInstagramUrl');

    return 'آسف! يجب عليك إدخال رابط $selectString بموقع instagram.';
  }

  @override
  String invalidLinkedInCompanyUrl(String value, String permalink) {
    final String selectString = intl.Intl.select(permalink,
        {'_': 'لشركة', 'other': 'للشركة التي تحمل المعرف $permalink '},
        desc: 'No description provided in @invalidLinkedInCompanyUrl');

    return 'آسف! يجب عليك إدخال رابط $selectString بموقع linkedIn.';
  }

  @override
  String invalidLinkedInPostUrl(String value, String id) {
    final String selectString = intl.Intl.select(
        id, {'_': ' لمنشور', 'other': ' للمنشور الذي يحمل المعرف: ${id}'},
        desc: 'No description provided in @invalidLinkedInPostUrl');

    return 'آسف! يجب عليك إدخال رابط  $selectString بموقع linkedIn.';
  }

  @override
  String invalidLinkedInProfileUrl(String value, String permalink) {
    final String selectString = intl.Intl.select(
        permalink,
        {
          '_': 'لملف شخصي',
          'other': 'للملف الشخصي الذي يحمل المعرف ${permalink}'
        },
        desc: 'No description provided in @invalidLinkedInProfileUrl');

    return 'آسف! يجب عليك إدخال رابط $selectString بموقع linkedIn.';
  }

  @override
  String invalidMediumPostUrl(String value, String postId) {
    final String selectString = intl.Intl.select(postId,
        {'_': ' لمنشور ', 'other': ' للمنشور الذي يحمل المعرف: ${postId}'},
        desc: 'No description provided in @invalidMediumPostUrl');

    return 'آسف! يجب عليك إدخال رابط $selectString بموقع medium.';
  }

  @override
  String invalidMediumUserUrl(String value, String userName, String id) {
    final String selectString = intl.Intl.select(
        userName,
        {
          '_': '{id, select, _{ url ',
          'other': ' للمستخدم الذي يحمل المعرف: ${id}',
          'other': ' للمستخدم: ${userName}'
        },
        desc: 'No description provided in @invalidMediumUserUrl');

    return 'آسف! يجب عليك إدخال رابط $selectString  بموقع medium.';
  }

  @override
  String invalidRedditUrl(String value, String user) {
    final String selectString = intl.Intl.select(
        user, {'_': ' ', 'other': ' للمستخدم: ${user}'},
        desc: 'No description provided in @invalidRedditUrl');

    return 'آسف! يجب عليك إدخال رابط $selectString بموقع reddit.';
  }

  @override
  String invalidSnapchatUrl(String value, String user) {
    final String selectString = intl.Intl.select(
        user, {'_': ' url ', 'other': ' with user: ${user}'},
        desc: 'No description provided in @invalidSnapchatUrl');

    return 'آسف! يجب عليك إدخال snapchat صالح $selectString بموقع medium.';
  }

  @override
  String invalidStackexchangeUrl(String value, String user, String id) {
    final String selectString = intl.Intl.select(
        user,
        {
          '_': '{id, select, _{ ',
          'other': ' بالمعرف: ${id}',
          'other': ' مع اسم المستخدم: ${user}'
        },
        desc: 'No description provided in @invalidStackexchangeUrl');

    return 'آسف! يجب عليك إدخال رابط $selectString بموقع stackexchange.';
  }

  @override
  String invalidStackoverflowQuestionUrl(String value, String id) {
    final String selectString = intl.Intl.select(
        id, {'_': ' لسؤال ', 'other': ' للسؤال الذي يحمل المعرف: ${id}'},
        desc: 'No description provided in @invalidStackoverflowQuestionUrl');

    return 'آسف! يجب عليك إدخال رابط $selectString بموقع stackoverflow.';
  }

  @override
  String invalidStackoverflowUserUrl(String value, String id) {
    final String selectString = intl.Intl.select(
        id, {'_': ' لمستخدم ', 'other': ' للمستخدم الذي يحمل المعرف: ${id}'},
        desc: 'No description provided in @invalidStackoverflowUserUrl');

    return 'آسف! يجب عليك إدخال رابط $selectString بموقع stackoverflow.';
  }

  @override
  String invalidTelegramProfileUrl(String value, String userName) {
    final String selectString = intl.Intl.select(
        userName, {'_': ' لملف شخصي ', 'other': ' لملف المستخدم: ${userName}'},
        desc: 'No description provided in @invalidTelegramProfileUrl');

    return 'آسف! يجب عليك إدخال رابط $selectString بموقع telegram.';
  }

  @override
  String invalidTwitterStatusUrl(
      String value, String userName, String tweetId) {
    final String selectString = intl.Intl.select(
        tweetId,
        {
          '_': ' لتغريدة ',
          'other': ' للتغريدة التي تحمل المعرف: ${tweetId}',
          '_': '',
          'other': ' بإسم: ${userName}'
        },
        desc: 'No description provided in @invalidTwitterStatusUrl');

    return 'آسف! يجب عليك إدخال رابط $selectString  بموقع twitter.';
  }

  @override
  String invalidTwitterUserUrl(String value, String userName) {
    final String selectString = intl.Intl.select(
        userName, {'_': ' لمستخدم ', 'other': ' للمستخدم: ${userName}'},
        desc: 'No description provided in @invalidTwitterUserUrl');

    return 'آسف! يجب عليك إدخال رابط $selectString   بموقع twitter.';
  }

  @override
  String invalidYoutubeChannelUrl(String value, String id) {
    final String selectString = intl.Intl.select(
        id, {'_': ' لقناة ', 'other': 'للقناة التي تحمل المعرف: ${id}'},
        desc: 'No description provided in @invalidYoutubeChannelUrl');

    return 'آسف! عليك إدخال رابط $selectString  بموقع youtube.';
  }

  @override
  String invalidYoutubeUserUrl(String value, String userName) {
    final String selectString = intl.Intl.select(
        userName, {'_': ' لمستخدم ', 'other': ' للمستخدم: ${userName}'},
        desc: 'No description provided in @invalidYoutubeUserUrl');

    return 'آسف! عليك إدخال رابط $selectString  بموقع youtube.';
  }

  @override
  String invalidYoutubeVideoUrl(String value, String id) {
    final String selectString = intl.Intl.select(
        id, {'_': 'لفيديو ', 'other': ' للفيديو الذي يحمل المعرف: ${id}'},
        desc: 'No description provided in @invalidYoutubeVideoUrl');

    return 'آسف! عليك إدخال رابط $selectString   بموقع youtube.';
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
  String isCreditCard(String value) {
    return 'يجب إدخال رقم بطاقة ائتمان صالح';
  }

  @override
  String isDateAfter(DateTime value, DateTime other) {
    final intl.DateFormat valueDateFormat = intl.DateFormat.yMEd(localeName);
    final String valueString = valueDateFormat.format(value);
    final intl.DateFormat otherDateFormat = intl.DateFormat.yMEd(localeName);
    final String otherString = otherDateFormat.format(other);

    return 'يجب عليك إدخال تاريخ لاحق ل $otherString.';
  }

  @override
  String isDateAfterOrEqual(DateTime value, DateTime other) {
    final intl.DateFormat valueDateFormat = intl.DateFormat.yMEd(localeName);
    final String valueString = valueDateFormat.format(value);
    final intl.DateFormat otherDateFormat = intl.DateFormat.yMEd(localeName);
    final String otherString = otherDateFormat.format(other);

    return 'يجب إدخال تاريخ لاحق أو في نفس الوقت $otherString.';
  }

  @override
  String isDateBefore(DateTime value, DateTime other) {
    final intl.DateFormat valueDateFormat = intl.DateFormat.yMEd(localeName);
    final String valueString = valueDateFormat.format(value);
    final intl.DateFormat otherDateFormat = intl.DateFormat.yMEd(localeName);
    final String otherString = otherDateFormat.format(other);

    return 'يجب إدخال تاريخ سابق ل $otherString.';
  }

  @override
  String isDateBeforeOrEqual(DateTime value, DateTime other) {
    final intl.DateFormat valueDateFormat = intl.DateFormat.yMEd(localeName);
    final String valueString = valueDateFormat.format(value);
    final intl.DateFormat otherDateFormat = intl.DateFormat.yMEd(localeName);
    final String otherString = otherDateFormat.format(other);

    return 'يجب إدخال تاريخ سابق أو في نفس الوقت $otherString.';
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
  String isDateTime(Object value) {
    return 'يجب إدخال تاريخ صالح';
  }

  @override
  String isDecimal(Object value) {
    return 'يجب إدخال رقم عشري';
  }

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
  String isEmail(String value) {
    return 'يجب إدخال عنوان بريد إلكتروني صالح';
  }

  @override
  String isEven(num value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String valueString = valueNumberFormat.format(value);

    return 'يجب أن تكون القيمة رقمًا زوجي.';
  }

  @override
  String isIn(dynamic value, Iterable list) {
    return 'يجب أن تكون القيمة المدخلة واحدة من $list';
  }

  @override
  String isInteger(Object value) {
    return 'يجب إدخال رقم صحيح';
  }

  @override
  String isNegative(num value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String valueString = valueNumberFormat.format(value);

    return 'يجب أن تكون القيمة سالبة';
  }

  @override
  String isNotIn(dynamic value, Iterable list) {
    return 'يجب ألا تكون القيمة المدخلة في $list';
  }

  @override
  String isNumber(Object value) {
    return 'يجب إدخال رقم صالح';
  }

  @override
  String isOdd(num value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String valueString = valueNumberFormat.format(value);

    return 'يجب أن تكون القيمة رقمًا فرديًا';
  }

  @override
  String isPositive(num value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String valueString = valueNumberFormat.format(value);

    return 'يجب أن تكون القيمة موجبة.';
  }

  @override
  String isTimeAfter(DateTime value, DateTime other) {
    final intl.DateFormat valueDateFormat = intl.DateFormat.jm(localeName);
    final String valueString = valueDateFormat.format(value);
    final intl.DateFormat otherDateFormat = intl.DateFormat.jm(localeName);
    final String otherString = otherDateFormat.format(other);

    return 'يجب عليك إدخال وقت لاحق ل $otherString.';
  }

  @override
  String isTimeAfterOrEqual(DateTime value, DateTime other) {
    final intl.DateFormat valueDateFormat = intl.DateFormat.jm(localeName);
    final String valueString = valueDateFormat.format(value);
    final intl.DateFormat otherDateFormat = intl.DateFormat.jm(localeName);
    final String otherString = otherDateFormat.format(other);

    return 'يجب إدخال وقت لاحق أو في نفس الوقت $otherString.';
  }

  @override
  String isTimeBefore(DateTime value, DateTime other) {
    final intl.DateFormat valueDateFormat = intl.DateFormat.jm(localeName);
    final String valueString = valueDateFormat.format(value);
    final intl.DateFormat otherDateFormat = intl.DateFormat.jm(localeName);
    final String otherString = otherDateFormat.format(other);

    return 'يجب عليك إدخال وقت سابق ل $otherString.';
  }

  @override
  String isTimeBeforeOrEqual(DateTime value, DateTime other) {
    final intl.DateFormat valueDateFormat = intl.DateFormat.jm(localeName);
    final String valueString = valueDateFormat.format(value);
    final intl.DateFormat otherDateFormat = intl.DateFormat.jm(localeName);
    final String otherString = otherDateFormat.format(other);

    return 'يجب إدخال وقت سابق أو في نفس الوقت $otherString.';
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
  String isTimeOfDay(Object value) {
    return 'يجب إدخال وقت صحيح';
  }

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
    return 'يجب ألا يقل عدد العناصر عن {max}';
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
