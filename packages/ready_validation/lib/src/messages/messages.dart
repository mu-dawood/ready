import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart' as intl;

import 'messages_ar.dart';
import 'messages_en.dart';
import 'messages_fr.dart';
import 'messages_ur.dart';

/// Callers can lookup localized strings with an instance of ReadyValidationMessages returned
/// by `ReadyValidationMessages.of(context)`.
///
/// Applications need to include `ReadyValidationMessages.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
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
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # rest of dependencies
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
    Locale('en'),
    Locale('fr'),
    Locale('ur')
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
  /// **'The value should be greater than, {equal, select, true {or equal to}  other {}} {min}'**
  String greaterThan(bool equal, num value, num min);

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
  /// **'Sorry! you have to enter a valid angel company {company, select, _{url} other{with name: {company}}}.'**
  String invalidAngelCompanyUrl(String value, String company);

  /// No description provided for @invalidAngelJobUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid angel job {jobId, select, _{url} other{with id: {jobId}}}.'**
  String invalidAngelJobUrl(String value, String jobId);

  /// No description provided for @invalidCrunchbaseOrganizationUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid crunchbase organization {organization, select, _{url} other{with name: {organization}}}.'**
  String invalidCrunchbaseOrganizationUrl(String value, String organization);

  /// No description provided for @invalidCrunchbasePersonUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid crunchbase person {person, select, _{url} other{with name: {person}}}.'**
  String invalidCrunchbasePersonUrl(String value, String person);

  /// No description provided for @invalidFacebookUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid facebook {name, select, _{{id, select, _{url} other{user with id: {id}}}} other{user with name: {name}}}.'**
  String invalidFacebookUrl(String value, String name, String id);

  /// No description provided for @invalidGitHubUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid gitHub {user, select, _{{repository, select, _{url} other{repository: {repository}}}} other{user with name: {user} {repository, select, _{} other{and repository: {repository}}}}}.'**
  String invalidGitHubUrl(String value, String user, String repository);

  /// No description provided for @invalidGooglePlusUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid google plus {userName, select, _{url} other{with user name: {userName}}}.'**
  String invalidGooglePlusUrl(String value, String userName, String id);

  /// No description provided for @invalidHackerNewsItemUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid hacker news item  {id, select, _{url} other{with id: {id}}}.'**
  String invalidHackerNewsItemUrl(String value, String id);

  /// No description provided for @invalidHackerNewsUserUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid hacker news user  {id, select, _{url} other{with id: {id}}}.'**
  String invalidHackerNewsUserUrl(String value, String id);

  /// No description provided for @invalidInstagramUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid instagram {user, select, _{url} other{with user: {user}}}.'**
  String invalidInstagramUrl(String value, String user);

  /// No description provided for @invalidLinkedInCompanyUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid linked in company url. {permalink}'**
  String invalidLinkedInCompanyUrl(String value, String permalink);

  /// No description provided for @invalidLinkedInPostUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid linked in post  {id, select, _{url} other{with id: {id}}}'**
  String invalidLinkedInPostUrl(String value, String id);

  /// No description provided for @invalidLinkedInProfileUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid linked in profile url. {permalink}'**
  String invalidLinkedInProfileUrl(String value, String permalink);

  /// No description provided for @invalidMediumPostUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid medium post {postId, select, _{url} other{with id: {postId}}}.'**
  String invalidMediumPostUrl(String value, String postId);

  /// No description provided for @invalidMediumUserUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid medium user {userName, select, _{{id, select, _{url} other{with id: {id}}}} other{with user name: {userName}}}.'**
  String invalidMediumUserUrl(String value, String userName, String id);

  /// No description provided for @invalidRedditUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid reddit {user, select, _{url} other{with user: {user}}}.'**
  String invalidRedditUrl(String value, String user);

  /// No description provided for @invalidSnapchatUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid snapchat {user, select, _{url} other{with user: {user}}}.'**
  String invalidSnapchatUrl(String value, String user);

  /// No description provided for @invalidStackexchangeUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid stackexchange {user, select, _{{id, select, _{url} other{with id: {id}}}} other{with user name: {user}}}.'**
  String invalidStackexchangeUrl(String value, String user, String id);

  /// No description provided for @invalidStackoverflowQuestionUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid stackoverflow question {id, select, _{url} other{with id: {id}}}.'**
  String invalidStackoverflowQuestionUrl(String value, String id);

  /// No description provided for @invalidStackoverflowUserUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid stackoverflow user {id, select, _{url} other{with id: {id}}}.'**
  String invalidStackoverflowUserUrl(String value, String id);

  /// No description provided for @invalidTelegramProfileUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid telegram profile {userName, select, _{url} other{with user name: {userName}}}.'**
  String invalidTelegramProfileUrl(String value, String userName);

  /// No description provided for @invalidTwitterStatusUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid twitter status {tweetId, select, _{url} other{with id: {tweetId}}} {userName, select, _{} other{with user name: {userName}}}.'**
  String invalidTwitterStatusUrl(String value, String userName, String tweetId);

  /// No description provided for @invalidTwitterUserUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid twitter user {userName, select, _{url} other{with user name: {userName}}}.'**
  String invalidTwitterUserUrl(String value, String userName);

  /// No description provided for @invalidYoutubeChannelUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid youtube channel {id, select, _{url} other{with id: {id}}}.'**
  String invalidYoutubeChannelUrl(String value, String id);

  /// No description provided for @invalidYoutubeUserUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid youtube user {userName, select, _{url} other{with user name: {userName}}}.'**
  String invalidYoutubeUserUrl(String value, String userName);

  /// No description provided for @invalidYoutubeVideoUrl.
  ///
  /// In en, this message translates to:
  /// **'Sorry! you have to enter a valid youtube video {id, select, _{url} other{with id: {id}}}.'**
  String invalidYoutubeVideoUrl(String value, String id);

  /// No description provided for @isAfter.
  ///
  /// In en, this message translates to:
  /// **'You must enter a later date {other}for, {equal, select, true {or equal to} other{}}'**
  String isAfter(bool equal, DateTime value, DateTime date);

  /// No description provided for @isBefore.
  ///
  /// In en, this message translates to:
  /// **'You must enter a date prior {other}to, {equal, select, true {or equal to} other{}}'**
  String isBefore(bool equal, DateTime value, DateTime date);

  /// No description provided for @isBetween.
  ///
  /// In en, this message translates to:
  /// **'Value must be greater {min}than and less than {max}{equal, select, true {or equal} other{}}'**
  String isBetween(bool equal, num value, num min, num max);

  /// No description provided for @isCreditCard.
  ///
  /// In en, this message translates to:
  /// **'You must enter the credit card number'**
  String isCreditCard(String value);

  /// No description provided for @isDateBetween.
  ///
  /// In en, this message translates to:
  /// **'You must enter a date {min}{max}between and, {equal, select, true {or equal to one} other{}}'**
  String isDateBetween(bool equal, DateTime value, DateTime min, DateTime max);

  /// No description provided for @isDateTime.
  ///
  /// In en, this message translates to:
  /// **'You must enter a valid date'**
  String isDateTime(Object value);

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
  /// **'You must enter a valid isEmail'**
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

  /// No description provided for @isTimeOfDay.
  ///
  /// In en, this message translates to:
  /// **'You must enter a valid time'**
  String isTimeOfDay(Object value);

  /// No description provided for @lessThan.
  ///
  /// In en, this message translates to:
  /// **'Value must be less than, {equal, select, true {or equal to}  other {}} {max}'**
  String lessThan(bool equal, num value, num max);

  /// No description provided for @listHasLength.
  ///
  /// In en, this message translates to:
  /// **'The number of elements must equal {length}'**
  String listHasLength(Iterable value, int length);

  /// No description provided for @listMaxLength.
  ///
  /// In en, this message translates to:
  /// **'The number of items should not be more than {max}'**
  String listMaxLength(Iterable value, int max);

  /// No description provided for @listMinLength.
  ///
  /// In en, this message translates to:
  /// **'The number of items should not be less than {min}'**
  String listMinLength(Iterable value, int min);

  /// No description provided for @listRange.
  ///
  /// In en, this message translates to:
  /// **'The number of items must be at least {min}and no more than {max}'**
  String listRange(Iterable value, int min, int max);

  /// No description provided for @notContainsItem.
  ///
  /// In en, this message translates to:
  /// **'The list does not have to contain {res}'**
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
      <String>['ar', 'en', 'fr', 'ur'].contains(locale.languageCode);

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
    case 'fr':
      return ReadyValidationMessagesFr();
    case 'ur':
      return ReadyValidationMessagesUr();
  }

  throw FlutterError(
      'ReadyValidationMessages.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
