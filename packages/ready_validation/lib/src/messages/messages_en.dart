// cSpell: disable
// ignore_for_file: unused_local_variable, unnecessary_brace_in_string_interps, equal_keys_in_map, unnecessary_string_interpolations, no_leading_underscores_for_local_identifiers


import 'package:intl/intl.dart' as intl;

import 'messages.dart';

/// The translations for English (`en`).
class ReadyValidationMessagesEn extends ReadyValidationMessages {
  ReadyValidationMessagesEn([String locale = 'en']) : super(locale);

  @override
  String contains(String res) {
    return 'The text should contain $res';
  }

  @override
  String containsItem(dynamic res) {
    return 'The list should contain $res';
  }

  @override
  String endsWith(String res) {
    return 'Text should end with $res';
  }

  @override
  String equal(dynamic value) {
    return 'Only the value $value is allowed.';
  }

  @override
  String greaterThan(num min) {
    final intl.NumberFormat minNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String minString = minNumberFormat.format(min);

    return 'The value should be greater than $minString.';
  }

  @override
  String greaterThanOrEqual(num min) {
    final intl.NumberFormat minNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String minString = minNumberFormat.format(min);

    return 'The value should be greater than or equal $minString.';
  }

  @override
  String hasLength(int length) {
    return 'You must enter a text of $length characters';
  }

  @override
  String hasMaxLength(int max) {
    return 'The text must be no longer than $max';
  }

  @override
  String hasMinLength(int min) {
    return 'The length of the text must be at least $min';
  }

  @override
  String hasRange(int min, int max) {
    return 'You must enter a text of length not less than $min and not more than $max';
  }

  @override
  String invalidAngelCompanyUrl(String company) {
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
  String invalidAngelJobUrl(String jobId) {
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
  String invalidCrunchbaseOrganizationUrl(String organization) {
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
  String invalidCrunchbasePersonUrl(String person) {
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
  String invalidFacebookUrl(String name, String id) {
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
  String invalidGitHubUrl(String user, String repository) {
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
  String invalidGooglePlusUrl(String userName, String id) {
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
  String invalidHackerNewsItemUrl(String id) {
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
  String invalidHackerNewsUserUrl(String id) {
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
  String invalidInstagramUrl(String user) {
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
  String invalidLinkedInCompanyUrl(String permalink) {
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
  String invalidLinkedInPostUrl(String id) {
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
  String invalidLinkedInProfileUrl(String permalink) {
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
  String invalidMediumPostUrl(String postId) {
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
  String invalidMediumUserUrl(String userName, String id) {
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
  String invalidRedditUrl(String user) {
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
  String invalidSnapchatUrl(String user) {
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
  String invalidStackexchangeUrl(String user, String id) {
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
  String invalidStackoverflowQuestionUrl(String id) {
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
  String invalidStackoverflowUserUrl(String id) {
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
  String invalidTelegramProfileUrl(String userName) {
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
  String invalidTwitterStatusUrl(String userName, String tweetId) {
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
  String invalidTwitterUserUrl(String userName) {
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
  String invalidYoutubeChannelUrl(String id) {
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
  String invalidYoutubeUserUrl(String userName) {
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
  String invalidYoutubeVideoUrl(String id) {
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
  String isBetween(num min, num max) {
    final intl.NumberFormat minNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String minString = minNumberFormat.format(min);
    final intl.NumberFormat maxNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String maxString = maxNumberFormat.format(max);

    return 'Value must be greater than $minString and less than $maxString';
  }

  @override
  String isBetweenOrEqual(num min, num max) {
    final intl.NumberFormat minNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String minString = minNumberFormat.format(min);
    final intl.NumberFormat maxNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String maxString = maxNumberFormat.format(max);

    return 'Value must be greater than or equal $minString and less than or equal $maxString';
  }

  @override
  String get isCreditCard => 'You must enter a valid credit card number';

  @override
  String isDateAfter(DateTime o) {
    final intl.DateFormat oDateFormat = intl.DateFormat.yMEd(localeName);
    final String oString = oDateFormat.format(o);

    return 'You must enter a date after $oString.';
  }

  @override
  String isDateAfterOrEqual(DateTime o) {
    final intl.DateFormat oDateFormat = intl.DateFormat.yMEd(localeName);
    final String oString = oDateFormat.format(o);

    return 'You must enter a date after or at the same time as $oString.';
  }

  @override
  String isDateBefore(DateTime o) {
    final intl.DateFormat oDateFormat = intl.DateFormat.yMEd(localeName);
    final String oString = oDateFormat.format(o);

    return 'You must enter a date before $oString.';
  }

  @override
  String isDateBeforeOrEqual(DateTime o) {
    final intl.DateFormat oDateFormat = intl.DateFormat.yMEd(localeName);
    final String oString = oDateFormat.format(o);

    return 'You must enter a date before or at the same time as $oString.';
  }

  @override
  String isDateBetween(DateTime min, DateTime max) {
    final intl.DateFormat minDateFormat = intl.DateFormat.yMEd(localeName);
    final String minString = minDateFormat.format(min);
    final intl.DateFormat maxDateFormat = intl.DateFormat.yMEd(localeName);
    final String maxString = maxDateFormat.format(max);

    return 'You must enter a date between $minString and $maxString.';
  }

  @override
  String isDateBetweenOrEqual(DateTime min, DateTime max) {
    final intl.DateFormat minDateFormat = intl.DateFormat.yMEd(localeName);
    final String minString = minDateFormat.format(min);
    final intl.DateFormat maxDateFormat = intl.DateFormat.yMEd(localeName);
    final String maxString = maxDateFormat.format(max);

    return 'You must enter a date between  $minString and $maxString or at the same time as any of them.';
  }

  @override
  String get isDateTime => 'You must enter a valid date';

  @override
  String get isBoolean => 'You must enter true or false';

  @override
  String get isDecimal => 'You must enter a decimal number';

  @override
  String isDivisibleBy(num division) {
    final intl.NumberFormat divisionNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String divisionString = divisionNumberFormat.format(division);

    return 'The input value must be divisible by $divisionString';
  }

  @override
  String get isEmail => 'You must enter a valid email address';

  @override
  String get isEven => 'The value must be an even number';

  @override
  String isIn(Iterable list) {
    return 'The entered value must be one of the $list';
  }

  @override
  String get isInteger => 'You must enter a valid number';

  @override
  String get isNegative => 'Value must be negative';

  @override
  String isNotIn(Iterable list) {
    return 'The entered value must not be in $list';
  }

  @override
  String get isNumber => 'You must enter a valid number';

  @override
  String get isOdd => 'The value must be an odd number';

  @override
  String get isPositive => 'The value should be positive';

  @override
  String isTimeAfter(DateTime o) {
    final intl.DateFormat oDateFormat = intl.DateFormat.jm(localeName);
    final String oString = oDateFormat.format(o);

    return 'You must enter a date after $oString.';
  }

  @override
  String isTimeAfterOrEqual(DateTime o) {
    final intl.DateFormat oDateFormat = intl.DateFormat.jm(localeName);
    final String oString = oDateFormat.format(o);

    return 'You must enter time after or at the same time as $oString.';
  }

  @override
  String isTimeBefore(DateTime o) {
    final intl.DateFormat oDateFormat = intl.DateFormat.jm(localeName);
    final String oString = oDateFormat.format(o);

    return 'You must enter time before $oString.';
  }

  @override
  String isTimeBeforeOrEqual(DateTime o) {
    final intl.DateFormat oDateFormat = intl.DateFormat.jm(localeName);
    final String oString = oDateFormat.format(o);

    return 'You must enter time before or at the same time as $oString.';
  }

  @override
  String isTimeBetween(DateTime min, DateTime max) {
    final intl.DateFormat minDateFormat = intl.DateFormat.jm(localeName);
    final String minString = minDateFormat.format(min);
    final intl.DateFormat maxDateFormat = intl.DateFormat.jm(localeName);
    final String maxString = maxDateFormat.format(max);

    return 'You must enter time between $minString and $maxString.';
  }

  @override
  String isTimeBetweenOrEqual(DateTime min, DateTime max) {
    final intl.DateFormat minDateFormat = intl.DateFormat.jm(localeName);
    final String minString = minDateFormat.format(min);
    final intl.DateFormat maxDateFormat = intl.DateFormat.jm(localeName);
    final String maxString = maxDateFormat.format(max);

    return 'You must enter time between  $minString and $maxString or at the same time any of them';
  }

  @override
  String get isTimeOfDay => 'You must enter a valid time';

  @override
  String lessThan(num max) {
    final intl.NumberFormat maxNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String maxString = maxNumberFormat.format(max);

    return 'Value must be less than $maxString.';
  }

  @override
  String lessThanOrEqual(num max) {
    final intl.NumberFormat maxNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String maxString = maxNumberFormat.format(max);

    return 'Value must be less than or equal $maxString.';
  }

  @override
  String listHasLength(int length) {
    return 'The number of elements must equal $length';
  }

  @override
  String listMaxLength(int max) {
    return 'The number of elements should not be more than $max';
  }

  @override
  String listMinLength(int min) {
    return 'The number of elements should not be less than $min';
  }

  @override
  String listRange(int min, int max) {
    return 'The number of elements  must be between $min and $max';
  }

  @override
  String notContainsItem(dynamic res) {
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
  String startsWith(String res) {
    return 'Text should start with $res';
  }
}
