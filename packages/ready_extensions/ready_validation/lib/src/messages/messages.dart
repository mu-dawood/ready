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
  /// In ar, this message translates to:
  /// **'يجب أن يحتوي النص علي {res}'**
  String contains(String value, String res);

  /// No description provided for @containsItem.
  ///
  /// In ar, this message translates to:
  /// **'يجب أن تحتوي القائمة علي {res}'**
  String containsItem(dynamic value, dynamic res);

  /// No description provided for @endsWith.
  ///
  /// In ar, this message translates to:
  /// **'يجب أن ينتهي النص ب {res}'**
  String endsWith(String value, String res);

  /// No description provided for @equal.
  ///
  /// In ar, this message translates to:
  /// **'مسموح فقط بإدخال القيمة {value}'**
  String equal(dynamic value);

  /// No description provided for @greaterThan.
  ///
  /// In ar, this message translates to:
  /// **'يجب أن تكون القيمة أكبر من, {equal, select, true{ أو تساوي} other{}} {min}'**
  String greaterThan(bool equal, num value, num min);

  /// No description provided for @hasMaxLength.
  ///
  /// In ar, this message translates to:
  /// **'يجب أن لا يزيد طول النص عن {max}'**
  String hasMaxLength(String value, int max);

  /// No description provided for @hasMinLength.
  ///
  /// In ar, this message translates to:
  /// **'يجب أن لا يقل طول النص عن {min}'**
  String hasMinLength(String value, int min);

  /// No description provided for @hasRange.
  ///
  /// In ar, this message translates to:
  /// **'يجب إدخال نص  لايقل طوله عن {min} ولا يزيد عن {max}'**
  String hasRange(String value, int min, int max);

  /// No description provided for @isAfter.
  ///
  /// In ar, this message translates to:
  /// **'يجب إدخال تاريخ لاحق ل {other}, {equal,select,true { أو مساو له}}'**
  String isAfter(bool equal, DateTime value, DateTime date);

  /// No description provided for @isBefore.
  ///
  /// In ar, this message translates to:
  /// **'يجب إدخال تاريخ سابق ل {other}, {equal,select,true { أو مساو له}}'**
  String isBefore(bool equal, DateTime value, DateTime date);

  /// No description provided for @isBetween.
  ///
  /// In ar, this message translates to:
  /// **'يجب أن تكون القيمة أكبر من {min} وأقل من {max}{equal,select,true{ أو تساويهم}}'**
  String isBetween(bool equal, num value, num min, num max);

  /// No description provided for @isDateBetween.
  ///
  /// In ar, this message translates to:
  /// **'يجب إدخال تاريخ بين {min} و {max}, {equal,select,true { أو مساو لأحدهم}}'**
  String isDateBetween(bool equal, DateTime value, DateTime min, DateTime max);

  /// No description provided for @isDateTime.
  ///
  /// In ar, this message translates to:
  /// **'يجب إدخال تاريخ صحيح'**
  String isDateTime(Object value);

  /// No description provided for @isDecimal.
  ///
  /// In ar, this message translates to:
  /// **'يجب إدخال رقم عشري'**
  String isDecimal(Object value);

  /// No description provided for @isDivisibleBy.
  ///
  /// In ar, this message translates to:
  /// **'يجب أن تكون القيمة المدخلة قابلة للقسمة علي {division}'**
  String isDivisibleBy(num value, num division);

  /// No description provided for @isEven.
  ///
  /// In ar, this message translates to:
  /// **'يجب أن تكون القيمة رقم زوجي'**
  String isEven(num value);

  /// No description provided for @isIn.
  ///
  /// In ar, this message translates to:
  /// **'يجب أن تكون القيمة المدخلة من إحدى القيم {list}'**
  String isIn(dynamic value, List list);

  /// No description provided for @isInteger.
  ///
  /// In ar, this message translates to:
  /// **'يجب إدخال رقم صحيح'**
  String isInteger(Object value);

  /// No description provided for @isNegative.
  ///
  /// In ar, this message translates to:
  /// **'يجب أن تكون القيمة سالبة'**
  String isNegative(num value);

  /// No description provided for @isNotIn.
  ///
  /// In ar, this message translates to:
  /// **'لا يجب أن تكون القيمة المدخلة من القيم {list}'**
  String isNotIn(dynamic value, List list);

  /// No description provided for @isNumber.
  ///
  /// In ar, this message translates to:
  /// **'يجب إدخال رقم'**
  String isNumber(Object value);

  /// No description provided for @isOdd.
  ///
  /// In ar, this message translates to:
  /// **'يجب أن تكون القيمة رقم فردي'**
  String isOdd(num value);

  /// No description provided for @isPositive.
  ///
  /// In ar, this message translates to:
  /// **'يجب أن تكون القيمة موجبة'**
  String isPositive(num value);

  /// No description provided for @isTimeOfDay.
  ///
  /// In ar, this message translates to:
  /// **'يجب إدخال وقت صحيح'**
  String isTimeOfDay(Object value);

  /// No description provided for @lessThan.
  ///
  /// In ar, this message translates to:
  /// **'يجب أن تكون القيمة أقل من, {equal, select,true { أو تساوي} other {}} {max}'**
  String lessThan(bool equal, num value, num max);

  /// No description provided for @listMaxLength.
  ///
  /// In ar, this message translates to:
  /// **'لا يجب أن يزيد عدد العناصر عن {max}'**
  String listMaxLength(String value, int max);

  /// No description provided for @listMinLength.
  ///
  /// In ar, this message translates to:
  /// **'لا يجب أن يقل عدد العناصر عن {min}'**
  String listMinLength(String value, int min);

  /// No description provided for @listRange.
  ///
  /// In ar, this message translates to:
  /// **'يجب أن لا يقل عدد العناصر  عن {min} ولا يزيد عن {max}'**
  String listRange(String value, int min, int max);

  /// No description provided for @notContainsItem.
  ///
  /// In ar, this message translates to:
  /// **'لا يجب أن تحتوي القائمة علي {res}'**
  String notContainsItem(dynamic value, dynamic res);

  /// No description provided for @notEmpty.
  ///
  /// In ar, this message translates to:
  /// **'لا يجب إدخال قيمة فارغة'**
  String get notEmpty;

  /// No description provided for @notEqual.
  ///
  /// In ar, this message translates to:
  /// **'غير مسموح بإدخال القيمة {value}'**
  String notEqual(dynamic value);

  /// No description provided for @regexp.
  ///
  /// In ar, this message translates to:
  /// **'الصيغة المطلوبة غير متوافقة مع المدخلات'**
  String get regexp;

  /// No description provided for @required.
  ///
  /// In ar, this message translates to:
  /// **'عذرا! هذا الحقل مطلوب'**
  String get required;

  /// No description provided for @startsWith.
  ///
  /// In ar, this message translates to:
  /// **'يجب أن يبدأ النص ب {res}'**
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
