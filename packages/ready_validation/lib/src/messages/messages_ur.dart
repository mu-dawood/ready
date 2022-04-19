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
        equal, {'true': 'یا برابر', 'other': ''},
        desc: 'No description provided in @greaterThan');

    return 'قیمت سے زیادہ ہونا چاہئے, ${selectString}';
  }

  @override
  String hasLength(String value, int length) {
    return 'آپ کو $length حروف کا متن درج کرنا ہوگا۔';
  }

  @override
  String hasMaxLength(String value, int max) {
    return 'متن $max سے زیادہ نہیں ہونا چاہیے';
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
  String invalidAngelCompanyUrl(String value, String company) {
    final String selectString = intl.Intl.select(
        company, {'_': ' url ', 'other': ' name: ${company}'},
        desc: 'No description provided in @invalidAngelCompanyUrl');

    return 'معذرت! آپ کو ایک درست فرشتہ کمپنی درج کرنی ہوگی $selectString کے ساتھ۔';
  }

  @override
  String invalidAngelJobUrl(String value, String jobId) {
    final String selectString = intl.Intl.select(
        jobId, {'_': ' url ', 'other': ' id کے ساتھ: ${jobId}'},
        desc: 'No description provided in @invalidAngelJobUrl');

    return 'معذرت! آپ کو ایک درست فرشتہ جاب درج کرنا ہوگا $selectString ۔';
  }

  @override
  String invalidCrunchbaseOrganizationUrl(String value, String organization) {
    final String selectString = intl.Intl.select(organization,
        {'_': ' url ', 'other': ' نام کے ساتھ درج کرنا ہوگا: ${organization}'},
        desc: 'No description provided in @invalidCrunchbaseOrganizationUrl');

    return 'معذرت! آپ کو ایک درست کرنچبیس تنظیم $selectString ۔';
  }

  @override
  String invalidCrunchbasePersonUrl(String value, String person) {
    final String selectString = intl.Intl.select(
        person, {'_': ' url ', 'other': ' نام کے ساتھ: ${person}'},
        desc: 'No description provided in @invalidCrunchbasePersonUrl');

    return 'معذرت! آپ کو ایک درست crunchbase person $selectString درج کرنا ہوگا۔';
  }

  @override
  String invalidFacebookUrl(String value, String name, String id) {
    final String selectString = intl.Intl.select(
        name,
        {
          '_': '{id, select, _{ url ',
          'other': ' user آئی ڈی کے ساتھ: ${id}',
          'other': ' user نام کے ساتھ: ${name}'
        },
        desc: 'No description provided in @invalidFacebookUrl');

    return 'معذرت! آپ کو ایک درست facebook $selectString کرنا ہوگا۔';
  }

  @override
  String invalidGitHubUrl(String value, String user, String repository) {
    final String selectString = intl.Intl.select(
        user,
        {
          '_': '{repository, select, _{ url ',
          'other': ' repository: $repository',
          'other': ' user نام کے ساتھ: $user {repository, select, _{',
          'other': ' درج کرنا ہوگا۔ {repository, select, _{',
          'other': ' اور repository: ${repository}'
        },
        desc: 'No description provided in @invalidGitHubUrl');

    return 'معذرت! آپ کو ایک درست gitHub $selectString ۔';
  }

  @override
  String invalidGooglePlusUrl(String value, String userName, String id) {
    final String selectString = intl.Intl.select(
        userName, {'_': ' url ', 'other': ' صارف نام کے ساتھ: ${userName}'},
        desc: 'No description provided in @invalidGooglePlusUrl');

    return 'معذرت! آپ کو ایک درست گوگل پلس درج کرنا ہوگا $selectString ۔';
  }

  @override
  String invalidHackerNewsItemUrl(String value, String id) {
    final String selectString = intl.Intl.select(
        id, {'_': ' url ', 'other': ' id کے ساتھ: $id'},
        desc: 'No description provided in @invalidHackerNewsItemUrl');

    return 'معذرت! آپ کو ایک درست ہیکر نیوز آئٹم درج کرنا ہوگا $selectString ۔';
  }

  @override
  String invalidHackerNewsUserUrl(String value, String id) {
    final String selectString = intl.Intl.select(
        id, {'_': ' url ', 'other': ' id کے ساتھ درج کرنا ہوگا: $id'},
        desc: 'No description provided in @invalidHackerNewsUserUrl');

    return 'معذرت! آپ کو ایک درست ہیکر نیوز صارف $selectString ۔';
  }

  @override
  String invalidInstagramUrl(String value, String user) {
    final String selectString = intl.Intl.select(
        user, {'_': ' url ', 'other': ' user: $user'},
        desc: 'No description provided in @invalidInstagramUrl');

    return 'معذرت! آپ کو ایک درست انسٹاگرام درج کرنا ہوگا $selectString کے ساتھ۔';
  }

  @override
  String invalidLinkedInCompanyUrl(String value, String permalink) {
    return 'معذرت! آپ کو کمپنی کے یو آر ایل میں ایک درست لنک درج کرنا ہوگا۔ $permalink';
  }

  @override
  String invalidLinkedInPostUrl(String value, String id) {
    final String selectString = intl.Intl.select(id,
        {'_': ' url ', 'other': ' id کے ساتھ ایک درست لنک درج کرنا ہوگا: $id'},
        desc: 'No description provided in @invalidLinkedInPostUrl');

    return 'معذرت! آپ کو پوسٹ ${selectString}';
  }

  @override
  String invalidLinkedInProfileUrl(String value, String permalink) {
    return 'معذرت! آپ کو پروفائل یو آر ایل میں ایک درست لنک درج کرنا ہوگا۔ $permalink';
  }

  @override
  String invalidMediumPostUrl(String value, String postId) {
    final String selectString = intl.Intl.select(
        postId, {'_': ' url ', 'other': ' درج کرنا ہوگا: ${postId}'},
        desc: 'No description provided in @invalidMediumPostUrl');

    return 'معذرت! آپ کو id کے ساتھ ایک درست میڈیم پوسٹ $selectString ۔';
  }

  @override
  String invalidMediumUserUrl(String value, String userName, String id) {
    final String selectString = intl.Intl.select(
        userName,
        {
          '_': '{id, select, _{ url ',
          'other': ' id کے ساتھ: $id',
          'other': ' user name: ${userName}'
        },
        desc: 'No description provided in @invalidMediumUserUrl');

    return 'معذرت! آپ کو ایک درست میڈیم صارف درج کرنا ہوگا $selectString کے ساتھ۔';
  }

  @override
  String invalidRedditUrl(String value, String user) {
    final String selectString = intl.Intl.select(
        user, {'_': ' url ', 'other': ' user: $user'},
        desc: 'No description provided in @invalidRedditUrl');

    return 'معذرت! آپ کو ایک درست reddit درج کرنا ہوگا $selectString کے ساتھ۔';
  }

  @override
  String invalidSnapchatUrl(String value, String user) {
    final String selectString = intl.Intl.select(
        user, {'_': ' url ', 'other': ' user: $user'},
        desc: 'No description provided in @invalidSnapchatUrl');

    return 'معذرت! آپ کو ایک درست اسنیپ چیٹ درج کرنا ہوگا $selectString کے ساتھ۔';
  }

  @override
  String invalidStackexchangeUrl(String value, String user, String id) {
    final String selectString = intl.Intl.select(
        user,
        {
          '_': '{id, select, _{ url ',
          'other': ' id کے ساتھ: $id',
          'other': ' user name: $user'
        },
        desc: 'No description provided in @invalidStackexchangeUrl');

    return 'معذرت! آپ کو ایک درست stackexchange درج کرنا ہوگا $selectString کے ساتھ۔';
  }

  @override
  String invalidStackoverflowQuestionUrl(String value, String id) {
    final String selectString = intl.Intl.select(
        id, {'_': ' url ', 'other': ' id کے ساتھ: $id'},
        desc: 'No description provided in @invalidStackoverflowQuestionUrl');

    return 'معذرت! آپ کو ایک درست اسٹیک اوور فلو سوال درج کرنا ہوگا $selectString ۔';
  }

  @override
  String invalidStackoverflowUserUrl(String value, String id) {
    final String selectString = intl.Intl.select(
        id, {'_': ' url ', 'other': ' id: $id'},
        desc: 'No description provided in @invalidStackoverflowUserUrl');

    return 'معذرت! آپ کو ایک درست اسٹیک اوور فلو صارف $selectString کے ساتھ درج کرنا ہوگا۔';
  }

  @override
  String invalidTelegramProfileUrl(String value, String userName) {
    final String selectString = intl.Intl.select(
        userName, {'_': ' url ', 'other': ' صارف نام کے ساتھ: ${userName}'},
        desc: 'No description provided in @invalidTelegramProfileUrl');

    return 'معذرت! آپ کو ایک درست ٹیلیگرام پروفائل درج کرنا ہوگا $selectString ۔';
  }

  @override
  String invalidTwitterStatusUrl(
      String value, String userName, String tweetId) {
    final String selectString = intl.Intl.select(
        tweetId,
        {
          '_': ' url ',
          'other': ' id کے ساتھ: ${tweetId}',
          '_': '',
          'other': ' user name: ${userName}'
        },
        desc: 'No description provided in @invalidTwitterStatusUrl');

    return 'معذرت! آپ کو ایک درست ٹویٹر اسٹیٹس درج کرنا ہوگا $selectString کے ساتھ۔';
  }

  @override
  String invalidTwitterUserUrl(String value, String userName) {
    final String selectString = intl.Intl.select(userName,
        {'_': ' url ', 'other': ' صارف نام کے ساتھ درج کرنا ہوگا: ${userName}'},
        desc: 'No description provided in @invalidTwitterUserUrl');

    return 'معذرت! آپ کو ایک درست ٹویٹر صارف $selectString ۔';
  }

  @override
  String invalidYoutubeChannelUrl(String value, String id) {
    final String selectString = intl.Intl.select(
        id, {'_': ' url ', 'other': ' id: $id'},
        desc: 'No description provided in @invalidYoutubeChannelUrl');

    return 'معذرت! آپ کو ایک درست یوٹیوب چینل $selectString کے ساتھ درج کرنا ہوگا۔';
  }

  @override
  String invalidYoutubeUserUrl(String value, String userName) {
    final String selectString = intl.Intl.select(
        userName,
        {
          '_': ' url ',
          'other': ' صارف کے نام کے ساتھ درج کرنا ہوگا: ${userName}'
        },
        desc: 'No description provided in @invalidYoutubeUserUrl');

    return 'معذرت! آپ کو ایک درست یوٹیوب صارف $selectString ۔';
  }

  @override
  String invalidYoutubeVideoUrl(String value, String id) {
    final String selectString = intl.Intl.select(
        id, {'_': ' url ', 'other': ' id: $id'},
        desc: 'No description provided in @invalidYoutubeVideoUrl');

    return 'معذرت! آپ کو ایک درست یوٹیوب ویڈیو $selectString کے ساتھ درج کرنا ہوگا۔';
  }

  @override
  String isAfter(bool equal, DateTime value, DateTime date) {
    final String selectString = intl.Intl.select(
        equal, {'true': 'یا برابر', 'other': ''},
        desc: 'No description provided in @isAfter');

    return 'آپ کے ${selectString}';
  }

  @override
  String isBefore(bool equal, DateTime value, DateTime date) {
    final String selectString = intl.Intl.select(
        equal, {'true': 'یا اس کے برابر', 'other': ''},
        desc: 'No description provided in @isBefore');

    return 'آپ سے پہلے ایک تاریخ درج کرنا ضروری ${selectString}';
  }

  @override
  String isBetween(bool equal, num value, num min, num max) {
    final String selectString = intl.Intl.select(
        equal, {'true': 'یا برابر', 'other': ''},
        desc: 'No description provided in @isBetween');

    return 'قیمت $selectString سے زیادہ اور کم ہونا ضروری ہے';
  }

  @override
  String isCreditCard(String value) {
    return 'آپ کو ایک درست کریڈٹ کارڈ نمبر درج کرنا ہوگا';
  }

  @override
  String isDateBetween(bool equal, DateTime value, DateTime min, DateTime max) {
    final String selectString = intl.Intl.select(
        equal, {'true': 'یا ایک کے برابر', 'other': ''},
        desc: 'No description provided in @isDateBetween');

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
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String valueString = valueNumberFormat.format(value);
    final intl.NumberFormat divisionNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String divisionString = divisionNumberFormat.format(division);

    return 'ان پٹ ویلیو کی طرف سے تقسیم ہونا ضروری ہے $divisionString';
  }

  @override
  String isEmail(String value) {
    return 'آپ کو ایک درست ای میل درج کرنا ہوگی۔';
  }

  @override
  String isEven(num value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
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
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
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
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String valueString = valueNumberFormat.format(value);

    return 'قدر ایک عجیب عدد ہونا ضروری ہے';
  }

  @override
  String isPositive(num value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
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
        equal, {'true': 'یا برابر', 'other': ''},
        desc: 'No description provided in @lessThan');

    return 'قیمت سے کم ہونا ضروری ہے, ${selectString}';
  }

  @override
  String listHasLength(Iterable value, int length) {
    return 'عناصر کی تعداد $length کے برابر ہونی چاہیے';
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
  String get regexp => 'درخواست کردہ وضع ان پٹ سے مطابقت نہیں رکھتی';

  @override
  String get required => 'معاف کیجئے گا! اس کو پر کرنا ضروری ہے';

  @override
  String startsWith(String value, String res) {
    return 'متن کے ساتھ شروع کرنا چاہئے $res';
  }
}
