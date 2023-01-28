// cSpell: disable
// ignore_for_file: unused_local_variable, unnecessary_brace_in_string_interps, equal_keys_in_map, unnecessary_string_interpolations

import 'package:intl/intl.dart' as intl;

import 'messages.dart';

/// The translations for English (`en`).
class ReadyValidationMessagesEn extends ReadyValidationMessages {
  ReadyValidationMessagesEn([String locale = 'en']) : super(locale);

  @override
  String contains(String value, String res) {
    return 'The text should contain $res';
  }

  @override
  String containsItem(Iterable value, dynamic res) {
    return 'The list should contain $res';
  }

  @override
  String endsWith(String value, String res) {
    return 'Text should end with $res';
  }

  @override
  String equal(dynamic value) {
    return 'Only the value $value is allowed.';
  }

  @override
  String greaterThan(num value, num min) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String valueString = valueNumberFormat.format(value);
    final intl.NumberFormat minNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minString = minNumberFormat.format(min);

    return 'The value should be greater than $minString.';
  }

  @override
  String greaterThanOrEqual(num value, num min) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String valueString = valueNumberFormat.format(value);
    final intl.NumberFormat minNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minString = minNumberFormat.format(min);

    return 'The value should be greater than or equal $minString.';
  }

  @override
  String hasLength(String value, int length) {
    return 'You must enter a text of $length characters';
  }

  @override
  String hasMaxLength(String value, int max) {
    return 'The text must be no longer than $max';
  }

  @override
  String hasMinLength(String value, int min) {
    return 'The length of the text must be at least $min';
  }

  @override
  String hasRange(String value, int min, int max) {
    return 'You must enter a text of length not less than $min and not more than $max';
  }

  @override
  String invalidAngelCompanyUrl(String value, String company) {
    String _temp0 = intl.Intl.selectLogic(
      company,
      {
        'empty': 'url',
        'other': 'with name: $company',
      },
    );
    return 'Sorry! you have to enter a valid angel company $_temp0.';
  }

  @override
  String invalidAngelJobUrl(String value, String jobId) {
    String _temp0 = intl.Intl.selectLogic(
      jobId,
      {
        'empty': 'url',
        'other': 'with id: $jobId',
      },
    );
    return 'Sorry! you have to enter a valid angel job $_temp0.';
  }

  @override
  String invalidCrunchbaseOrganizationUrl(String value, String organization) {
    String _temp0 = intl.Intl.selectLogic(
      organization,
      {
        'empty': 'url',
        'other': 'with name: $organization',
      },
    );
    return 'Sorry! you have to enter a valid crunchbase organization $_temp0.';
  }

  @override
  String invalidCrunchbasePersonUrl(String value, String person) {
    String _temp0 = intl.Intl.selectLogic(
      person,
      {
        'empty': 'url',
        'other': 'with name: $person',
      },
    );
    return 'Sorry! you have to enter a valid crunchbase person $_temp0.';
  }

  @override
  String invalidFacebookUrl(String value, String name, String id) {
    String _temp0 = intl.Intl.selectLogic(
      id,
      {
        'empty': 'url',
        'other': 'user with id: $id',
      },
    );
    String _temp1 = intl.Intl.selectLogic(
      name,
      {
        'empty': '$_temp0',
        'other': 'user with name: $name',
      },
    );
    return 'Sorry! you have to enter a valid facebook $_temp1.';
  }

  @override
  String invalidGitHubUrl(String value, String user, String repository) {
    String _temp0 = intl.Intl.selectLogic(
      repository,
      {
        'empty': 'url',
        'other': 'repository: $repository',
      },
    );
    String _temp1 = intl.Intl.selectLogic(
      repository,
      {
        'empty': '',
        'other': 'and repository: $repository',
      },
    );
    String _temp2 = intl.Intl.selectLogic(
      user,
      {
        'empty': '$_temp0',
        'other': 'user with name: $user $_temp1',
      },
    );
    return 'Sorry! you have to enter a valid gitHub $_temp2.';
  }

  @override
  String invalidGooglePlusUrl(String value, String userName, String id) {
    String _temp0 = intl.Intl.selectLogic(
      userName,
      {
        'empty': 'url',
        'other': 'with user name: $userName',
      },
    );
    return 'Sorry! you have to enter a valid google plus $_temp0.';
  }

  @override
  String invalidHackerNewsItemUrl(String value, String id) {
    String _temp0 = intl.Intl.selectLogic(
      id,
      {
        'empty': 'url',
        'other': 'with id: $id',
      },
    );
    return 'Sorry! you have to enter a valid hacker news item  $_temp0.';
  }

  @override
  String invalidHackerNewsUserUrl(String value, String id) {
    String _temp0 = intl.Intl.selectLogic(
      id,
      {
        'empty': 'url',
        'other': 'with id: $id',
      },
    );
    return 'Sorry! you have to enter a valid hacker news user  $_temp0.';
  }

  @override
  String invalidInstagramUrl(String value, String user) {
    String _temp0 = intl.Intl.selectLogic(
      user,
      {
        'empty': 'url',
        'other': 'with user: $user',
      },
    );
    return 'Sorry! you have to enter a valid instagram $_temp0.';
  }

  @override
  String invalidLinkedInCompanyUrl(String value, String permalink) {
    String _temp0 = intl.Intl.selectLogic(
      permalink,
      {
        'empty': 'company url',
        'other': 'company with $permalink url',
      },
    );
    return 'Sorry! you have to enter a valid inked in $_temp0.';
  }

  @override
  String invalidLinkedInPostUrl(String value, String id) {
    String _temp0 = intl.Intl.selectLogic(
      id,
      {
        'empty': 'url',
        'other': 'with id: $id',
      },
    );
    return 'Sorry! you have to enter a valid linked in post  $_temp0';
  }

  @override
  String invalidLinkedInProfileUrl(String value, String permalink) {
    String _temp0 = intl.Intl.selectLogic(
      permalink,
      {
        'empty': 'profile url',
        'other': 'profile with $permalink url',
      },
    );
    return 'Sorry! you have to enter a valid inked in $_temp0.';
  }

  @override
  String invalidMediumPostUrl(String value, String postId) {
    String _temp0 = intl.Intl.selectLogic(
      postId,
      {
        'empty': 'url',
        'other': 'with id: $postId',
      },
    );
    return 'Sorry! you have to enter a valid medium post $_temp0.';
  }

  @override
  String invalidMediumUserUrl(String value, String userName, String id) {
    String _temp0 = intl.Intl.selectLogic(
      id,
      {
        'empty': 'url',
        'other': 'with id: $id',
      },
    );
    String _temp1 = intl.Intl.selectLogic(
      userName,
      {
        'empty': '$_temp0',
        'other': 'with user name: $userName',
      },
    );
    return 'Sorry! you have to enter a valid medium user $_temp1.';
  }

  @override
  String invalidRedditUrl(String value, String user) {
    String _temp0 = intl.Intl.selectLogic(
      user,
      {
        'empty': 'url',
        'other': 'with user: $user',
      },
    );
    return 'Sorry! you have to enter a valid reddit $_temp0.';
  }

  @override
  String invalidSnapchatUrl(String value, String user) {
    String _temp0 = intl.Intl.selectLogic(
      user,
      {
        'empty': 'url',
        'other': 'with user: $user',
      },
    );
    return 'Sorry! you have to enter a valid snapchat $_temp0.';
  }

  @override
  String invalidStackexchangeUrl(String value, String user, String id) {
    String _temp0 = intl.Intl.selectLogic(
      id,
      {
        'empty': 'url',
        'other': 'with id: $id',
      },
    );
    String _temp1 = intl.Intl.selectLogic(
      user,
      {
        'empty': '$_temp0',
        'other': 'with user name: $user',
      },
    );
    return 'Sorry! you have to enter a valid stackexchange $_temp1.';
  }

  @override
  String invalidStackoverflowQuestionUrl(String value, String id) {
    String _temp0 = intl.Intl.selectLogic(
      id,
      {
        'empty': 'url',
        'other': 'with id: $id',
      },
    );
    return 'Sorry! you have to enter a valid stackoverflow question $_temp0.';
  }

  @override
  String invalidStackoverflowUserUrl(String value, String id) {
    String _temp0 = intl.Intl.selectLogic(
      id,
      {
        'empty': 'url',
        'other': 'with id: $id',
      },
    );
    return 'Sorry! you have to enter a valid stackoverflow user $_temp0.';
  }

  @override
  String invalidTelegramProfileUrl(String value, String userName) {
    String _temp0 = intl.Intl.selectLogic(
      userName,
      {
        'empty': 'url',
        'other': 'with user name: $userName',
      },
    );
    return 'Sorry! you have to enter a valid telegram profile $_temp0.';
  }

  @override
  String invalidTwitterStatusUrl(
      String value, String userName, String tweetId) {
    String _temp0 = intl.Intl.selectLogic(
      tweetId,
      {
        'empty': 'url',
        'other': 'with id: $tweetId',
      },
    );
    String _temp1 = intl.Intl.selectLogic(
      userName,
      {
        'empty': '',
        'other': 'with user name: $userName',
      },
    );
    return 'Sorry! you have to enter a valid twitter status $_temp0 $_temp1.';
  }

  @override
  String invalidTwitterUserUrl(String value, String userName) {
    String _temp0 = intl.Intl.selectLogic(
      userName,
      {
        'empty': 'url',
        'other': 'with user name: $userName',
      },
    );
    return 'Sorry! you have to enter a valid twitter user $_temp0.';
  }

  @override
  String invalidYoutubeChannelUrl(String value, String id) {
    String _temp0 = intl.Intl.selectLogic(
      id,
      {
        'empty': 'url',
        'other': 'with id: $id',
      },
    );
    return 'Sorry! you have to enter a valid youtube channel $_temp0.';
  }

  @override
  String invalidYoutubeUserUrl(String value, String userName) {
    String _temp0 = intl.Intl.selectLogic(
      userName,
      {
        'empty': 'url',
        'other': 'with user name: $userName',
      },
    );
    return 'Sorry! you have to enter a valid youtube user $_temp0.';
  }

  @override
  String invalidYoutubeVideoUrl(String value, String id) {
    String _temp0 = intl.Intl.selectLogic(
      id,
      {
        'empty': 'url',
        'other': 'with id: $id',
      },
    );
    return 'Sorry! you have to enter a valid youtube video $_temp0.';
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

    return 'Value must be greater than $minString and less than $maxString';
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

    return 'Value must be greater than or equal $minString and less than or equal $maxString';
  }

  @override
  String isCreditCard(Object v) => 'You must enter a valid credit card number';

  @override
  String isDateAfter(DateTime value, DateTime o) {
    final intl.DateFormat valueDateFormat = intl.DateFormat.yMEd(localeName);
    final String valueString = valueDateFormat.format(value);
    final intl.DateFormat oDateFormat = intl.DateFormat.yMEd(localeName);
    final String oString = oDateFormat.format(o);

    return 'You must enter a date after $oString.';
  }

  @override
  String isDateAfterOrEqual(DateTime value, DateTime o) {
    final intl.DateFormat valueDateFormat = intl.DateFormat.yMEd(localeName);
    final String valueString = valueDateFormat.format(value);
    final intl.DateFormat oDateFormat = intl.DateFormat.yMEd(localeName);
    final String oString = oDateFormat.format(o);

    return 'You must enter a date after or at the same time as $oString.';
  }

  @override
  String isDateBefore(DateTime value, DateTime o) {
    final intl.DateFormat valueDateFormat = intl.DateFormat.yMEd(localeName);
    final String valueString = valueDateFormat.format(value);
    final intl.DateFormat oDateFormat = intl.DateFormat.yMEd(localeName);
    final String oString = oDateFormat.format(o);

    return 'You must enter a date before $oString.';
  }

  @override
  String isDateBeforeOrEqual(DateTime value, DateTime o) {
    final intl.DateFormat valueDateFormat = intl.DateFormat.yMEd(localeName);
    final String valueString = valueDateFormat.format(value);
    final intl.DateFormat oDateFormat = intl.DateFormat.yMEd(localeName);
    final String oString = oDateFormat.format(o);

    return 'You must enter a date before or at the same time as $oString.';
  }

  @override
  String isDateBetween(DateTime value, DateTime min, DateTime max) {
    final intl.DateFormat valueDateFormat = intl.DateFormat.yMEd(localeName);
    final String valueString = valueDateFormat.format(value);
    final intl.DateFormat minDateFormat = intl.DateFormat.yMEd(localeName);
    final String minString = minDateFormat.format(min);
    final intl.DateFormat maxDateFormat = intl.DateFormat.yMEd(localeName);
    final String maxString = maxDateFormat.format(max);

    return 'You must enter a date between $minString and $maxString.';
  }

  @override
  String isDateBetweenOrEqual(DateTime value, DateTime min, DateTime max) {
    final intl.DateFormat valueDateFormat = intl.DateFormat.yMEd(localeName);
    final String valueString = valueDateFormat.format(value);
    final intl.DateFormat minDateFormat = intl.DateFormat.yMEd(localeName);
    final String minString = minDateFormat.format(min);
    final intl.DateFormat maxDateFormat = intl.DateFormat.yMEd(localeName);
    final String maxString = maxDateFormat.format(max);

    return 'You must enter a date between  $minString and $maxString or at the same time as any of them.';
  }

  @override
  String isDateTime(Object? v) => 'You must enter a valid date';

  @override
  String isBoolean(Object? v) => 'You must enter true or false';

  @override
  String isDecimal(Object? v) => 'You must enter a decimal number';

  @override
  String isDivisibleBy(num value, num division) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String valueString = valueNumberFormat.format(value);
    final intl.NumberFormat divisionNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String divisionString = divisionNumberFormat.format(division);

    return 'The input value must be divisible by $divisionString';
  }

  @override
  String isEmail(Object? v) => 'You must enter a valid email address';

  @override
  String isEven(Object? v) => 'The value must be an even number';

  @override
  String isIn(dynamic value, Iterable list) {
    return 'The entered value must be one of the $list';
  }

  @override
  String isInteger(Object? v) => 'You must enter a valid number';

  @override
  String isNegative(Object? v) => 'Value must be negative';

  @override
  String isNotIn(dynamic value, Iterable list) {
    return 'The entered value must not be in $list';
  }

  @override
  String isNumber(Object? v) => 'You must enter a valid number';

  @override
  String isOdd(Object? v) => 'The value must be an odd number';

  @override
  String isPositive(Object? v) => 'The value should be positive';

  @override
  String isTimeAfter(DateTime value, DateTime o) {
    final intl.DateFormat valueDateFormat = intl.DateFormat.jm(localeName);
    final String valueString = valueDateFormat.format(value);
    final intl.DateFormat oDateFormat = intl.DateFormat.jm(localeName);
    final String oString = oDateFormat.format(o);

    return 'You must enter a date after $oString.';
  }

  @override
  String isTimeAfterOrEqual(DateTime value, DateTime o) {
    final intl.DateFormat valueDateFormat = intl.DateFormat.jm(localeName);
    final String valueString = valueDateFormat.format(value);
    final intl.DateFormat oDateFormat = intl.DateFormat.jm(localeName);
    final String oString = oDateFormat.format(o);

    return 'You must enter time after or at the same time as $oString.';
  }

  @override
  String isTimeBefore(DateTime value, DateTime o) {
    final intl.DateFormat valueDateFormat = intl.DateFormat.jm(localeName);
    final String valueString = valueDateFormat.format(value);
    final intl.DateFormat oDateFormat = intl.DateFormat.jm(localeName);
    final String oString = oDateFormat.format(o);

    return 'You must enter time before $oString.';
  }

  @override
  String isTimeBeforeOrEqual(DateTime value, DateTime o) {
    final intl.DateFormat valueDateFormat = intl.DateFormat.jm(localeName);
    final String valueString = valueDateFormat.format(value);
    final intl.DateFormat oDateFormat = intl.DateFormat.jm(localeName);
    final String oString = oDateFormat.format(o);

    return 'You must enter time before or at the same time as $oString.';
  }

  @override
  String isTimeBetween(DateTime value, DateTime min, DateTime max) {
    final intl.DateFormat valueDateFormat = intl.DateFormat.jm(localeName);
    final String valueString = valueDateFormat.format(value);
    final intl.DateFormat minDateFormat = intl.DateFormat.jm(localeName);
    final String minString = minDateFormat.format(min);
    final intl.DateFormat maxDateFormat = intl.DateFormat.jm(localeName);
    final String maxString = maxDateFormat.format(max);

    return 'You must enter time between $minString and $maxString.';
  }

  @override
  String isTimeBetweenOrEqual(DateTime value, DateTime min, DateTime max) {
    final intl.DateFormat valueDateFormat = intl.DateFormat.jm(localeName);
    final String valueString = valueDateFormat.format(value);
    final intl.DateFormat minDateFormat = intl.DateFormat.jm(localeName);
    final String minString = minDateFormat.format(min);
    final intl.DateFormat maxDateFormat = intl.DateFormat.jm(localeName);
    final String maxString = maxDateFormat.format(max);

    return 'You must enter time between  $minString and $maxString or at the same time any of them';
  }

  @override
  String isTimeOfDay(Object? v) => 'You must enter a valid time';

  @override
  String lessThan(num value, num max) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String valueString = valueNumberFormat.format(value);
    final intl.NumberFormat maxNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String maxString = maxNumberFormat.format(max);

    return 'Value must be less than $maxString.';
  }

  @override
  String lessThanOrEqual(num value, num max) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String valueString = valueNumberFormat.format(value);
    final intl.NumberFormat maxNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String maxString = maxNumberFormat.format(max);

    return 'Value must be less than or equal $maxString.';
  }

  @override
  String listHasLength(Iterable value, int length) {
    return 'The number of elements must equal $length';
  }

  @override
  String listMaxLength(Iterable value, int max) {
    return 'The number of elements should not be more than $max';
  }

  @override
  String listMinLength(Iterable value, int min) {
    return 'The number of elements should not be less than $min';
  }

  @override
  String listRange(Iterable value, int min, int max) {
    return 'The number of elements  must be between $min and $max';
  }

  @override
  String notContainsItem(Iterable value, dynamic res) {
    return 'The list should not to contain $res';
  }

  @override
  String get notEmpty => 'You should not enter an empty value';

  @override
  String notEqual(dynamic value) {
    return 'Not allowed to enter $value';
  }

  @override
  String get regexp => 'The requested format is not compatible with the input';

  @override
  String get required => 'Excuse me! This field is required';

  @override
  String startsWith(String value, String res) {
    return 'Text should start with $res';
  }
}
