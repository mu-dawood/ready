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
  String greaterThan(bool equal, num value, num min) {
    final String selectString = intl.Intl.select(
        equal, {'true': 'or equal to', 'other': ''},
        desc: 'No description provided in @greaterThan');

    return 'The value should be greater than, ${selectString}';
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
    final String selectString = intl.Intl.select(
        company, {'_': 'url', 'other': 'with name: ${company}'},
        desc: 'No description provided in @invalidAngelCompanyUrl');

    return 'Sorry! you have to enter a valid angel company ${selectString}.';
  }

  @override
  String invalidAngelJobUrl(String value, String jobId) {
    final String selectString = intl.Intl.select(
        jobId, {'_': 'url', 'other': 'with id: ${jobId}'},
        desc: 'No description provided in @invalidAngelJobUrl');

    return 'Sorry! you have to enter a valid angel job ${selectString}.';
  }

  @override
  String invalidCrunchbaseOrganizationUrl(String value, String organization) {
    final String selectString = intl.Intl.select(
        organization, {'_': 'url', 'other': 'with name: ${organization}'},
        desc: 'No description provided in @invalidCrunchbaseOrganizationUrl');

    return 'Sorry! you have to enter a valid crunchbase organization ${selectString}.';
  }

  @override
  String invalidCrunchbasePersonUrl(String value, String person) {
    final String selectString = intl.Intl.select(
        person, {'_': 'url', 'other': 'with name: ${person}'},
        desc: 'No description provided in @invalidCrunchbasePersonUrl');

    return 'Sorry! you have to enter a valid crunchbase person ${selectString}.';
  }

  @override
  String invalidFacebookUrl(String value, String name, String id) {
    final String selectString = intl.Intl.select(
        name,
        {
          '_': '{id, select, _{url',
          'other': 'user with id: ${id}',
          'other': 'user with name: ${name}'
        },
        desc: 'No description provided in @invalidFacebookUrl');

    return 'Sorry! you have to enter a valid facebook ${selectString}.';
  }

  @override
  String invalidGitHubUrl(String value, String user, String repository) {
    final String selectString = intl.Intl.select(
        user,
        {
          '_': '{repository, select, _{url',
          'other': 'repository: $repository',
          'other': 'user with name: $user {repository, select, _{',
          'other': 'and repository: ${repository}'
        },
        desc: 'No description provided in @invalidGitHubUrl');

    return 'Sorry! you have to enter a valid gitHub ${selectString}.';
  }

  @override
  String invalidGooglePlusUrl(String value, String userName, String id) {
    final String selectString = intl.Intl.select(
        userName, {'_': 'url', 'other': 'with user name: ${userName}'},
        desc: 'No description provided in @invalidGooglePlusUrl');

    return 'Sorry! you have to enter a valid google plus ${selectString}.';
  }

  @override
  String invalidHackerNewsItemUrl(String value, String id) {
    final String selectString = intl.Intl.select(
        id, {'_': 'url', 'other': 'with id: ${id}'},
        desc: 'No description provided in @invalidHackerNewsItemUrl');

    return 'Sorry! you have to enter a valid hacker news item  ${selectString}.';
  }

  @override
  String invalidHackerNewsUserUrl(String value, String id) {
    final String selectString = intl.Intl.select(
        id, {'_': 'url', 'other': 'with id: ${id}'},
        desc: 'No description provided in @invalidHackerNewsUserUrl');

    return 'Sorry! you have to enter a valid hacker news user  ${selectString}.';
  }

  @override
  String invalidInstagramUrl(String value, String user) {
    final String selectString = intl.Intl.select(
        user, {'_': 'url', 'other': 'with user: ${user}'},
        desc: 'No description provided in @invalidInstagramUrl');

    return 'Sorry! you have to enter a valid instagram ${selectString}.';
  }

  @override
  String invalidLinkedInCompanyUrl(String value, String permalink) {
    return 'Sorry! you have to enter a valid linked in company url. $permalink';
  }

  @override
  String invalidLinkedInPostUrl(String value, String id) {
    final String selectString = intl.Intl.select(
        id, {'_': 'url', 'other': 'with id: ${id}'},
        desc: 'No description provided in @invalidLinkedInPostUrl');

    return 'Sorry! you have to enter a valid linked in post  ${selectString}';
  }

  @override
  String invalidLinkedInProfileUrl(String value, String permalink) {
    return 'Sorry! you have to enter a valid linked in profile url. $permalink';
  }

  @override
  String invalidMediumPostUrl(String value, String postId) {
    final String selectString = intl.Intl.select(
        postId, {'_': 'url', 'other': 'with id: ${postId}'},
        desc: 'No description provided in @invalidMediumPostUrl');

    return 'Sorry! you have to enter a valid medium post ${selectString}.';
  }

  @override
  String invalidMediumUserUrl(String value, String userName, String id) {
    final String selectString = intl.Intl.select(
        userName,
        {
          '_': '{id, select, _{url',
          'other': 'with id: ${id}',
          'other': 'with user name: ${userName}'
        },
        desc: 'No description provided in @invalidMediumUserUrl');

    return 'Sorry! you have to enter a valid medium user ${selectString}.';
  }

  @override
  String invalidRedditUrl(String value, String user) {
    final String selectString = intl.Intl.select(
        user, {'_': 'url', 'other': 'with user: ${user}'},
        desc: 'No description provided in @invalidRedditUrl');

    return 'Sorry! you have to enter a valid reddit ${selectString}.';
  }

  @override
  String invalidSnapchatUrl(String value, String user) {
    final String selectString = intl.Intl.select(
        user, {'_': 'url', 'other': 'with user: ${user}'},
        desc: 'No description provided in @invalidSnapchatUrl');

    return 'Sorry! you have to enter a valid snapchat ${selectString}.';
  }

  @override
  String invalidStackexchangeUrl(String value, String user, String id) {
    final String selectString = intl.Intl.select(
        user,
        {
          '_': '{id, select, _{url',
          'other': 'with id: ${id}',
          'other': 'with user name: ${user}'
        },
        desc: 'No description provided in @invalidStackexchangeUrl');

    return 'Sorry! you have to enter a valid stackexchange ${selectString}.';
  }

  @override
  String invalidStackoverflowQuestionUrl(String value, String id) {
    final String selectString = intl.Intl.select(
        id, {'_': 'url', 'other': 'with id: ${id}'},
        desc: 'No description provided in @invalidStackoverflowQuestionUrl');

    return 'Sorry! you have to enter a valid stackoverflow question ${selectString}.';
  }

  @override
  String invalidStackoverflowUserUrl(String value, String id) {
    final String selectString = intl.Intl.select(
        id, {'_': 'url', 'other': 'with id: ${id}'},
        desc: 'No description provided in @invalidStackoverflowUserUrl');

    return 'Sorry! you have to enter a valid stackoverflow user ${selectString}.';
  }

  @override
  String invalidTelegramProfileUrl(String value, String userName) {
    final String selectString = intl.Intl.select(
        userName, {'_': 'url', 'other': 'with user name: ${userName}'},
        desc: 'No description provided in @invalidTelegramProfileUrl');

    return 'Sorry! you have to enter a valid telegram profile ${selectString}.';
  }

  @override
  String invalidTwitterStatusUrl(
      String value, String userName, String tweetId) {
    final String selectString = intl.Intl.select(
        tweetId,
        {
          '_': 'url',
          'other': 'with id: ${tweetId}',
          '_': '',
          'other': 'with user name: ${userName}'
        },
        desc: 'No description provided in @invalidTwitterStatusUrl');

    return 'Sorry! you have to enter a valid twitter status ${selectString}.';
  }

  @override
  String invalidTwitterUserUrl(String value, String userName) {
    final String selectString = intl.Intl.select(
        userName, {'_': 'url', 'other': 'with user name: ${userName}'},
        desc: 'No description provided in @invalidTwitterUserUrl');

    return 'Sorry! you have to enter a valid twitter user ${selectString}.';
  }

  @override
  String invalidYoutubeChannelUrl(String value, String id) {
    final String selectString = intl.Intl.select(
        id, {'_': 'url', 'other': 'with id: ${id}'},
        desc: 'No description provided in @invalidYoutubeChannelUrl');

    return 'Sorry! you have to enter a valid youtube channel ${selectString}.';
  }

  @override
  String invalidYoutubeUserUrl(String value, String userName) {
    final String selectString = intl.Intl.select(
        userName, {'_': 'url', 'other': 'with user name: ${userName}'},
        desc: 'No description provided in @invalidYoutubeUserUrl');

    return 'Sorry! you have to enter a valid youtube user ${selectString}.';
  }

  @override
  String invalidYoutubeVideoUrl(String value, String id) {
    final String selectString = intl.Intl.select(
        id, {'_': 'url', 'other': 'with id: ${id}'},
        desc: 'No description provided in @invalidYoutubeVideoUrl');

    return 'Sorry! you have to enter a valid youtube video ${selectString}.';
  }

  @override
  String isAfter(bool equal, DateTime value, DateTime date) {
    final String selectString = intl.Intl.select(
        equal, {'true': 'or equal to', 'other': ''},
        desc: 'No description provided in @isAfter');

    return 'You must enter a later date ${selectString}';
  }

  @override
  String isBefore(bool equal, DateTime value, DateTime date) {
    final String selectString = intl.Intl.select(
        equal, {'true': 'or equal to', 'other': ''},
        desc: 'No description provided in @isBefore');

    return 'You must enter a date prior ${selectString}';
  }

  @override
  String isBetween(bool equal, num value, num min, num max) {
    final String selectString = intl.Intl.select(
        equal, {'true': 'or equal', 'other': ''},
        desc: 'No description provided in @isBetween');

    return 'Value must be greater ${selectString}';
  }

  @override
  String isCreditCard(String value) {
    return 'You must enter the credit card number';
  }

  @override
  String isDateBetween(bool equal, DateTime value, DateTime min, DateTime max) {
    final String selectString = intl.Intl.select(
        equal, {'true': 'or equal to one', 'other': ''},
        desc: 'No description provided in @isDateBetween');

    return 'You must enter a date ${selectString}';
  }

  @override
  String isDateTime(Object value) {
    return 'You must enter a valid date';
  }

  @override
  String isDecimal(Object value) {
    return 'You must enter a decimal number';
  }

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
  String isEmail(String value) {
    return 'You must enter a valid isEmail';
  }

  @override
  String isEven(num value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String valueString = valueNumberFormat.format(value);

    return 'The value must be an even number';
  }

  @override
  String isIn(dynamic value, Iterable list) {
    return 'The entered value must be one of the $list';
  }

  @override
  String isInteger(Object value) {
    return 'You must enter a valid number';
  }

  @override
  String isNegative(num value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String valueString = valueNumberFormat.format(value);

    return 'Value must be negative';
  }

  @override
  String isNotIn(dynamic value, Iterable list) {
    return 'The entered value must not be in $list';
  }

  @override
  String isNumber(Object value) {
    return 'You must enter a valid number';
  }

  @override
  String isOdd(num value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String valueString = valueNumberFormat.format(value);

    return 'The value must be an odd number';
  }

  @override
  String isPositive(num value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String valueString = valueNumberFormat.format(value);

    return 'The value should be positive';
  }

  @override
  String isTimeOfDay(Object value) {
    return 'You must enter a valid time';
  }

  @override
  String lessThan(bool equal, num value, num max) {
    final String selectString = intl.Intl.select(
        equal, {'true': 'or equal to', 'other': ''},
        desc: 'No description provided in @lessThan');

    return 'Value must be less than, ${selectString}';
  }

  @override
  String listHasLength(Iterable value, int length) {
    return 'The number of elements must equal $length';
  }

  @override
  String listMaxLength(Iterable value, int max) {
    return 'The number of items should not be more than $max';
  }

  @override
  String listMinLength(Iterable value, int min) {
    return 'The number of items should not be less than $min';
  }

  @override
  String listRange(Iterable value, int min, int max) {
    return 'The number of items must be at least ${min}and no more than $max';
  }

  @override
  String notContainsItem(Iterable value, dynamic res) {
    return 'The list does not have to contain $res';
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
