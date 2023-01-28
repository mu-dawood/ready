// cSpell: disable
// ignore_for_file: unused_local_variable, unnecessary_brace_in_string_interps, equal_keys_in_map, unnecessary_string_interpolations

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart' as intl;

import 'messages_ar.dart';
import 'messages_en.dart';

/// Callers can lookup localized strings with an instance of ReadyValidationMessages
/// returned by `ReadyValidationMessages.of(context)`.
///
/// Applications need to include `ReadyValidationMessages.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'messages/messages.dart';
///
/// return MaterialApp(
///   localizationsDelegates: ReadyValidationMessages.localizationsDelegates,
///   supportedLocales: ReadyValidationMessages.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the ReadyValidationMessages.supportedLocales
/// property.
abstract class ReadyValidationMessages {
  ReadyValidationMessages(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static ReadyValidationMessages? of(BuildContext context) {
    return Localizations.of<ReadyValidationMessages>(
        context, ReadyValidationMessages);
  }

  static const LocalizationsDelegate<ReadyValidationMessages> delegate =
      _ReadyValidationMessagesDelegate();

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @contains.
  ///
  /// In en, this message translates to:
  /// **'The text should contain {res}'**
  String contains(String value, String res);

  /// No description provided for @containsItem.
  ///
  /// In en, this message translates to:
  /// **'The list should contain {res}'**
  String containsItem(Iterable value, dynamic res);

  /// No description provided for @endsWith.
  ///
  /// In en, this message translates to:
  /// **'Text should end with {res}'**
  String endsWith(String value, String res);

  /// No description provided for @equal.
  ///
  /// In en, this message translates to:
  /// **'Only the value {value} is allowed.'**
  String equal(dynamic value);

  /// No description provided for @greaterThan.
  ///
  /// In en, this message translates to:
  /// **'The value should be greater than {min}.'**
  String greaterThan(num value, num min);

  /// No description provided for @greaterThanOrEqual.
  ///
  /// In en, this message translates to:
  /// **'The value should be greater than or equal {min}.'**
  String greaterThanOrEqual(num value, num min);

  /// No description provided for @hasLength.
  ///
  /// In en, this message translates to:
  /// **'You must enter a text of {length} characters'**
  String hasLength(String value, int length);

  /// No description provided for @hasMaxLength.
  ///
  /// In en, this message translates to:
  /// **'The text must be no longer than {max}'**
  String hasMaxLength(String value, int max);

  /// No description provided for @hasMinLength.
  ///
  /// In en, this message translates to:
  /// **'The length of the text must be at least {min}'**
  String hasMinLength(String value, int min);

  /// No description provided for @hasRange.
  ///
  /// In en, this message translates to:
  /// **'You must enter a text of length not less than {min} and not more than {max}'**
  String hasRange(String value, int min, int max);

  /// No description provided for @invalidAngelCompanyUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid angel company {company, select, empty{url} other{with name: {company}}}.'**
  String invalidAngelCompanyUrl(String value, String company);

  /// No description provided for @invalidAngelJobUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid angel job {jobId, select, empty{url} other{with id: {jobId}}}.'**
  String invalidAngelJobUrl(String value, String jobId);

  /// No description provided for @invalidCrunchbaseOrganizationUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid crunchbase organization {organization, select, empty{url} other{with name: {organization}}}.'**
  String invalidCrunchbaseOrganizationUrl(String value, String organization);

  /// No description provided for @invalidCrunchbasePersonUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid crunchbase person {person, select, empty{url} other{with name: {person}}}.'**
  String invalidCrunchbasePersonUrl(String value, String person);

  /// No description provided for @invalidFacebookUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid facebook {name, select, empty{{id, select, empty{url} other{user with id: {id}}}} other{user with name: {name}}}.'**
  String invalidFacebookUrl(String value, String name, String id);

  /// No description provided for @invalidGitHubUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid gitHub {user, select, empty{{repository, select, empty{url} other{repository: {repository}}}} other{user with name: {user} {repository, select, empty{} other{and repository: {repository}}}}}.'**
  String invalidGitHubUrl(String value, String user, String repository);

  /// No description provided for @invalidGooglePlusUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid google plus {userName, select, empty{url} other{with user name: {userName}}}.'**
  String invalidGooglePlusUrl(String value, String userName, String id);

  /// No description provided for @invalidHackerNewsItemUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid hacker news item  {id, select, empty{url} other{with id: {id}}}.'**
  String invalidHackerNewsItemUrl(String value, String id);

  /// No description provided for @invalidHackerNewsUserUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid hacker news user  {id, select, empty{url} other{with id: {id}}}.'**
  String invalidHackerNewsUserUrl(String value, String id);

  /// No description provided for @invalidInstagramUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid instagram {user, select, empty{url} other{with user: {user}}}.'**
  String invalidInstagramUrl(String value, String user);

  /// No description provided for @invalidLinkedInCompanyUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid inked in {permalink, select, empty{company url} other{company with {permalink} url}}.'**
  String invalidLinkedInCompanyUrl(String value, String permalink);

  /// No description provided for @invalidLinkedInPostUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid linked in post  {id, select, empty{url} other{with id: {id}}}'**
  String invalidLinkedInPostUrl(String value, String id);

  /// No description provided for @invalidLinkedInProfileUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid inked in {permalink, select, empty{profile url} other{profile with {permalink} url}}.'**
  String invalidLinkedInProfileUrl(String value, String permalink);

  /// No description provided for @invalidMediumPostUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid medium post {postId, select, empty{url} other{with id: {postId}}}.'**
  String invalidMediumPostUrl(String value, String postId);

  /// No description provided for @invalidMediumUserUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid medium user {userName, select, empty{{id, select, empty{url} other{with id: {id}}}} other{with user name: {userName}}}.'**
  String invalidMediumUserUrl(String value, String userName, String id);

  /// No description provided for @invalidRedditUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid reddit {user, select, empty{url} other{with user: {user}}}.'**
  String invalidRedditUrl(String value, String user);

  /// No description provided for @invalidSnapchatUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid snapchat {user, select, empty{url} other{with user: {user}}}.'**
  String invalidSnapchatUrl(String value, String user);

  /// No description provided for @invalidStackexchangeUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid stackexchange {user, select, empty{{id, select, empty{url} other{with id: {id}}}} other{with user name: {user}}}.'**
  String invalidStackexchangeUrl(String value, String user, String id);

  /// No description provided for @invalidStackoverflowQuestionUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid stackoverflow question {id, select, empty{url} other{with id: {id}}}.'**
  String invalidStackoverflowQuestionUrl(String value, String id);

  /// No description provided for @invalidStackoverflowUserUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid stackoverflow user {id, select, empty{url} other{with id: {id}}}.'**
  String invalidStackoverflowUserUrl(String value, String id);

  /// No description provided for @invalidTelegramProfileUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid telegram profile {userName, select, empty{url} other{with user name: {userName}}}.'**
  String invalidTelegramProfileUrl(String value, String userName);

  /// No description provided for @invalidTwitterStatusUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid twitter status {tweetId, select, empty{url} other{with id: {tweetId}}} {userName, select, empty{} other{with user name: {userName}}}.'**
  String invalidTwitterStatusUrl(String value, String userName, String tweetId);

  /// No description provided for @invalidTwitterUserUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid twitter user {userName, select, empty{url} other{with user name: {userName}}}.'**
  String invalidTwitterUserUrl(String value, String userName);

  /// No description provided for @invalidYoutubeChannelUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid youtube channel {id, select, empty{url} other{with id: {id}}}.'**
  String invalidYoutubeChannelUrl(String value, String id);

  /// No description provided for @invalidYoutubeUserUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid youtube user {userName, select, empty{url} other{with user name: {userName}}}.'**
  String invalidYoutubeUserUrl(String value, String userName);

  /// No description provided for @invalidYoutubeVideoUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid youtube video {id, select, empty{url} other{with id: {id}}}.'**
  String invalidYoutubeVideoUrl(String value, String id);

  /// No description provided for @isBetween.
  ///
  /// In en, this message translates to:
  /// **'Value must be greater than {min} and less than {max}'**
  String isBetween(num value, num min, num max);

  /// No description provided for @isBetweenOrEqual.
  ///
  /// In en, this message translates to:
  /// **'Value must be greater than or equal {min} and less than or equal {max}'**
  String isBetweenOrEqual(num value, num min, num max);

  /// No description provided for @isCreditCard.
  ///
  /// In en, this message translates to:
  /// **'You must enter a valid credit card number'**
  String isCreditCard(String value);

  /// No description provided for @isDateAfter.
  ///
  /// In en, this message translates to:
  /// **'You must enter a date after {o}.'**
  String isDateAfter(DateTime value, DateTime o);

  /// No description provided for @isDateAfterOrEqual.
  ///
  /// In en, this message translates to:
  /// **'You must enter a date after or at the same time as {o}.'**
  String isDateAfterOrEqual(DateTime value, DateTime o);

  /// No description provided for @isDateBefore.
  ///
  /// In en, this message translates to:
  /// **'You must enter a date before {o}.'**
  String isDateBefore(DateTime value, DateTime o);

  /// No description provided for @isDateBeforeOrEqual.
  ///
  /// In en, this message translates to:
  /// **'You must enter a date before or at the same time as {o}.'**
  String isDateBeforeOrEqual(DateTime value, DateTime o);

  /// No description provided for @isDateBetween.
  ///
  /// In en, this message translates to:
  /// **'You must enter a date between {min} and {max}.'**
  String isDateBetween(DateTime value, DateTime min, DateTime max);

  /// No description provided for @isDateBetweenOrEqual.
  ///
  /// In en, this message translates to:
  /// **'You must enter a date between  {min} and {max} or at the same time as any of them.'**
  String isDateBetweenOrEqual(DateTime value, DateTime min, DateTime max);

  /// No description provided for @isDateTime.
  ///
  /// In en, this message translates to:
  /// **'You must enter a valid date'**
  String isDateTime(Object value);

  /// No description provided for @isBoolean.
  ///
  /// In en, this message translates to:
  /// **'You must enter true or false'**
  String isBoolean(Object value);

  /// No description provided for @isDecimal.
  ///
  /// In en, this message translates to:
  /// **'You must enter a decimal number'**
  String isDecimal(Object value);

  /// No description provided for @isDivisibleBy.
  ///
  /// In en, this message translates to:
  /// **'The input value must be divisible by {division}'**
  String isDivisibleBy(num value, num division);

  /// No description provided for @isEmail.
  ///
  /// In en, this message translates to:
  /// **'You must enter a valid email address'**
  String isEmail(String value);

  /// No description provided for @isEven.
  ///
  /// In en, this message translates to:
  /// **'The value must be an even number'**
  String isEven(num value);

  /// No description provided for @isIn.
  ///
  /// In en, this message translates to:
  /// **'The entered value must be one of the {list}'**
  String isIn(dynamic value, Iterable list);

  /// No description provided for @isInteger.
  ///
  /// In en, this message translates to:
  /// **'You must enter a valid number'**
  String isInteger(Object value);

  /// No description provided for @isNegative.
  ///
  /// In en, this message translates to:
  /// **'Value must be negative'**
  String isNegative(num value);

  /// No description provided for @isNotIn.
  ///
  /// In en, this message translates to:
  /// **'The entered value must not be in {list}'**
  String isNotIn(dynamic value, Iterable list);

  /// No description provided for @isNumber.
  ///
  /// In en, this message translates to:
  /// **'You must enter a valid number'**
  String isNumber(Object value);

  /// No description provided for @isOdd.
  ///
  /// In en, this message translates to:
  /// **'The value must be an odd number'**
  String isOdd(num value);

  /// No description provided for @isPositive.
  ///
  /// In en, this message translates to:
  /// **'The value should be positive'**
  String isPositive(num value);

  /// No description provided for @isTimeAfter.
  ///
  /// In en, this message translates to:
  /// **'You must enter a date after {o}.'**
  String isTimeAfter(DateTime value, DateTime o);

  /// No description provided for @isTimeAfterOrEqual.
  ///
  /// In en, this message translates to:
  /// **'You must enter time after or at the same time as {o}.'**
  String isTimeAfterOrEqual(DateTime value, DateTime o);

  /// No description provided for @isTimeBefore.
  ///
  /// In en, this message translates to:
  /// **'You must enter time before {o}.'**
  String isTimeBefore(DateTime value, DateTime o);

  /// No description provided for @isTimeBeforeOrEqual.
  ///
  /// In en, this message translates to:
  /// **'You must enter time before or at the same time as {o}.'**
  String isTimeBeforeOrEqual(DateTime value, DateTime o);

  /// No description provided for @isTimeBetween.
  ///
  /// In en, this message translates to:
  /// **'You must enter time between {min} and {max}.'**
  String isTimeBetween(DateTime value, DateTime min, DateTime max);

  /// No description provided for @isTimeBetweenOrEqual.
  ///
  /// In en, this message translates to:
  /// **'You must enter time between  {min} and {max} or at the same time any of them'**
  String isTimeBetweenOrEqual(DateTime value, DateTime min, DateTime max);

  /// No description provided for @isTimeOfDay.
  ///
  /// In en, this message translates to:
  /// **'You must enter a valid time'**
  String isTimeOfDay(Object value);

  /// No description provided for @lessThan.
  ///
  /// In en, this message translates to:
  /// **'Value must be less than {max}.'**
  String lessThan(num value, num max);

  /// No description provided for @lessThanOrEqual.
  ///
  /// In en, this message translates to:
  /// **'Value must be less than or equal {max}.'**
  String lessThanOrEqual(num value, num max);

  /// No description provided for @listHasLength.
  ///
  /// In en, this message translates to:
  /// **'The number of elements must equal {length}'**
  String listHasLength(Iterable value, int length);

  /// No description provided for @listMaxLength.
  ///
  /// In en, this message translates to:
  /// **'The number of elements should not be more than {max}'**
  String listMaxLength(Iterable value, int max);

  /// No description provided for @listMinLength.
  ///
  /// In en, this message translates to:
  /// **'The number of elements should not be less than {min}'**
  String listMinLength(Iterable value, int min);

  /// No description provided for @listRange.
  ///
  /// In en, this message translates to:
  /// **'The number of elements  must be between {min} and {max}'**
  String listRange(Iterable value, int min, int max);

  /// No description provided for @notContainsItem.
  ///
  /// In en, this message translates to:
  /// **'The list should not to contain {res}'**
  String notContainsItem(Iterable value, dynamic res);

  /// No description provided for @notEmpty.
  ///
  /// In en, this message translates to:
  /// **'You should not enter an empty value'**
  String get notEmpty;

  /// No description provided for @notEqual.
  ///
  /// In en, this message translates to:
  /// **'Not allowed to enter {value}'**
  String notEqual(dynamic value);

  /// No description provided for @regexp.
  ///
  /// In en, this message translates to:
  /// **'The requested format is not compatible with the input'**
  String get regexp;

  /// No description provided for @required.
  ///
  /// In en, this message translates to:
  /// **'Excuse me! This field is required'**
  String get required;

  /// No description provided for @startsWith.
  ///
  /// In en, this message translates to:
  /// **'Text should start with {res}'**
  String startsWith(String value, String res);
}

class _ReadyValidationMessagesDelegate
    extends LocalizationsDelegate<ReadyValidationMessages> {
  const _ReadyValidationMessagesDelegate();

  @override
  Future<ReadyValidationMessages> load(Locale locale) {
    return SynchronousFuture<ReadyValidationMessages>(
        lookupReadyValidationMessages(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_ReadyValidationMessagesDelegate old) => false;
}

ReadyValidationMessages lookupReadyValidationMessages(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return ReadyValidationMessagesAr();
    case 'en':
      return ReadyValidationMessagesEn();
  }

  throw FlutterError(
      'ReadyValidationMessages.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
