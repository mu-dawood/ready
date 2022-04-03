
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
  ReadyValidationMessages(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static ReadyValidationMessages? of(BuildContext context) {
    return Localizations.of<ReadyValidationMessages>(context, ReadyValidationMessages);
  }

  static const LocalizationsDelegate<ReadyValidationMessages> delegate = _ReadyValidationMessagesDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('fr'),
    Locale('ur')
  ];

  /// No description provided for @required.
  ///
  /// In ar, this message translates to:
  /// **'عذرا! هذا الحقل مطلوب'**
  String get required;

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

  /// No description provided for @isNumber.
  ///
  /// In ar, this message translates to:
  /// **'يجب إدخال رقم'**
  String isNumber(Object value);

  /// No description provided for @isInteger.
  ///
  /// In ar, this message translates to:
  /// **'يجب إدخال رقم'**
  String isInteger(Object value);

  /// No description provided for @isDecimal.
  ///
  /// In ar, this message translates to:
  /// **'يجب إدخال رقم'**
  String isDecimal(Object value);
}

class _ReadyValidationMessagesDelegate extends LocalizationsDelegate<ReadyValidationMessages> {
  const _ReadyValidationMessagesDelegate();

  @override
  Future<ReadyValidationMessages> load(Locale locale) {
    return SynchronousFuture<ReadyValidationMessages>(lookupReadyValidationMessages(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en', 'fr', 'ur'].contains(locale.languageCode);

  @override
  bool shouldReload(_ReadyValidationMessagesDelegate old) => false;
}

ReadyValidationMessages lookupReadyValidationMessages(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return ReadyValidationMessagesAr();
    case 'en': return ReadyValidationMessagesEn();
    case 'fr': return ReadyValidationMessagesFr();
    case 'ur': return ReadyValidationMessagesUr();
  }

  throw FlutterError(
    'ReadyValidationMessages.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
