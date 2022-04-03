
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'simple_localizations_ar.dart';
import 'simple_localizations_en.dart';
import 'simple_localizations_fr.dart';
import 'simple_localizations_ur.dart';

/// Callers can lookup localized strings with an instance of SimpleLocalizations returned
/// by `SimpleLocalizations.of(context)`.
///
/// Applications need to include `SimpleLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'gen_l10n/simple_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: SimpleLocalizations.localizationsDelegates,
///   supportedLocales: SimpleLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the SimpleLocalizations.supportedLocales
/// property.
abstract class SimpleLocalizations {
  SimpleLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static SimpleLocalizations? of(BuildContext context) {
    return Localizations.of<SimpleLocalizations>(context, SimpleLocalizations);
  }

  static const LocalizationsDelegate<SimpleLocalizations> delegate = _SimpleLocalizationsDelegate();

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

  /// No description provided for @yearsPlural.
  ///
  /// In ar, this message translates to:
  /// **'{count,plural, =0{} =1{عام واحد} =2{عامين}  few{{count} أعوام}} other{{count} عام}}'**
  String yearsPlural(int count);

  /// No description provided for @monthsPlural.
  ///
  /// In ar, this message translates to:
  /// **'{count,plural, =0{} =1{شهر واحد} =2{شهرين}  few{{count} أشهر}} other{{count} شهر}}'**
  String monthsPlural(int count);

  /// No description provided for @daysPlural.
  ///
  /// In ar, this message translates to:
  /// **'{count,plural, =0{} =1{يوم واحد} =2{يومين}  few{{count} أيام}} other{{count} يوم}}'**
  String daysPlural(int count);

  /// No description provided for @weeksPlural.
  ///
  /// In ar, this message translates to:
  /// **'{count,plural, =0{} =1{أسبوع واحد} =2{أسبوعين}  few{{count} أسابيع}} other{{count} أسبوع}}'**
  String weeksPlural(int count);

  /// No description provided for @hoursPlural.
  ///
  /// In ar, this message translates to:
  /// **'{count,plural, =0{} =1{ساعة واحدة} =2{ساعتين}  few{{count} ساعات}} other{{count} ساعة}}'**
  String hoursPlural(int count);

  /// No description provided for @minutesPlural.
  ///
  /// In ar, this message translates to:
  /// **'{count,plural, =0{} =1{دقيقة واحدة} =2{دقيقتين}  few{{count} دقائق}} other{{count} دقيقة}}'**
  String minutesPlural(int count);

  /// No description provided for @socondsPlural.
  ///
  /// In ar, this message translates to:
  /// **'{count,plural, =0{} =1{ثانية واحدة} =2{ثانيتين}  few{{count} ثواني}} other{{count} ثانية}}'**
  String socondsPlural(int count);

  /// No description provided for @now.
  ///
  /// In ar, this message translates to:
  /// **'الآن'**
  String get now;

  /// No description provided for @formatSeperator.
  ///
  /// In ar, this message translates to:
  /// **' ، '**
  String get formatSeperator;

  /// No description provided for @required.
  ///
  /// In ar, this message translates to:
  /// **'عذرا! هذا الحقل مطلوب'**
  String get required;

  /// No description provided for @stringMaxLength.
  ///
  /// In ar, this message translates to:
  /// **'يجب أن لا يزيد طول النص عن {max}'**
  String stringMaxLength(String value, int max);

  /// No description provided for @stringMinLength.
  ///
  /// In ar, this message translates to:
  /// **'يجب أن لا يقل طول النص عن {min}'**
  String stringMinLength(String value, int min);

  /// No description provided for @stringMustBeInRange.
  ///
  /// In ar, this message translates to:
  /// **'يجب إدخال نص  لايقل طوله عن {min} ولا يزيد عن {max}'**
  String stringMustBeInRange(String value, int min, int max);

  /// No description provided for @stringMustBeDateTime.
  ///
  /// In ar, this message translates to:
  /// **'يجب إدخال تاريخ صحيح'**
  String stringMustBeDateTime(String value);

  /// No description provided for @stringMustBeTimeOfDay.
  ///
  /// In ar, this message translates to:
  /// **'يجب إدخال وقت صحيح'**
  String stringMustBeTimeOfDay(String value);

  /// No description provided for @mustBeDateAfter.
  ///
  /// In ar, this message translates to:
  /// **'يجب إدخال تاريخ لاحق ل {after}'**
  String mustBeDateAfter(DateTime value, DateTime after);

  /// No description provided for @mustBeDateBefore.
  ///
  /// In ar, this message translates to:
  /// **'يجب إدخال تاريخ سابق ل {before}'**
  String mustBeDateBefore(DateTime value, DateTime before);

  /// No description provided for @mustBeTimeOfDayAfter.
  ///
  /// In ar, this message translates to:
  /// **'يجب إدخال وقت لاحق ل {after}'**
  String mustBeTimeOfDayAfter(dynamic value, dynamic after);

  /// No description provided for @mustBeTimeOfDayBefore.
  ///
  /// In ar, this message translates to:
  /// **'يجب إدخال وقت سابق ل {before}'**
  String mustBeTimeOfDayBefore(dynamic value, dynamic before);

  /// No description provided for @mustBeDateBetween.
  ///
  /// In ar, this message translates to:
  /// **'يجب إختيار تاريخ بين {min} و {max}'**
  String mustBeDateBetween(dynamic value, DateTime min, DateTime max);

  /// No description provided for @mustBeTimeOfDayBetween.
  ///
  /// In ar, this message translates to:
  /// **'يجب إختيار وقت بين {min} و {max}'**
  String mustBeTimeOfDayBetween(dynamic value, dynamic min, dynamic max);

  /// No description provided for @mustBeNumber.
  ///
  /// In ar, this message translates to:
  /// **'يجب إدخال رقم'**
  String mustBeNumber(String value);

  /// No description provided for @mustBeInteger.
  ///
  /// In ar, this message translates to:
  /// **'يجب إدخال رقم غير عشري'**
  String mustBeInteger(String value);

  /// No description provided for @mustBeDecimal.
  ///
  /// In ar, this message translates to:
  /// **'يجب إدخال رقم عشري'**
  String mustBeDecimal(String value);

  /// No description provided for @mustBeGithubUrl.
  ///
  /// In ar, this message translates to:
  /// **'يجب إدخال رابط حساب Github'**
  String mustBeGithubUrl(String value);

  /// No description provided for @mustBeRedditUrl.
  ///
  /// In ar, this message translates to:
  /// **'يجب إدخال رابط حساب Reddit'**
  String mustBeRedditUrl(String value);

  /// No description provided for @mustBeInstagramUrl.
  ///
  /// In ar, this message translates to:
  /// **'يجب إدخال رابط حساب Instagram'**
  String mustBeInstagramUrl(String value);

  /// No description provided for @mustBeLinkedinProfile.
  ///
  /// In ar, this message translates to:
  /// **'يجب إدخال رابط حساب Linkedin'**
  String mustBeLinkedinProfile(String value);

  /// No description provided for @mustBeTwitterUser.
  ///
  /// In ar, this message translates to:
  /// **'يجب إدخال رابط حساب Twitter'**
  String mustBeTwitterUser(String value);

  /// No description provided for @mustBeYoutubeVideoUrl.
  ///
  /// In ar, this message translates to:
  /// **'يجب إدخال رابط لفيديو Youtube'**
  String mustBeYoutubeVideoUrl(String value);

  /// No description provided for @mustBeFacbookPageOrProfile.
  ///
  /// In ar, this message translates to:
  /// **'يجب إدخال رابط  Facbook'**
  String mustBeFacbookPageOrProfile(String value);

  /// No description provided for @mustBeSnapchatProfile.
  ///
  /// In ar, this message translates to:
  /// **'يجب إدخال رابط حساب Snapchat'**
  String mustBeSnapchatProfile(String value);

  /// No description provided for @mustBeUrl.
  ///
  /// In ar, this message translates to:
  /// **'يجب إدخال رابط صحيح'**
  String mustBeUrl(String value);

  /// No description provided for @mustBeEmail.
  ///
  /// In ar, this message translates to:
  /// **'يجب إدخال بريد إلكتروني صحيح'**
  String mustBeEmail(String value);

  /// No description provided for @mustBeHexColor.
  ///
  /// In ar, this message translates to:
  /// **'يجب إدخال لون صحيح مثل (#ff0000)'**
  String mustBeHexColor(String value);

  /// No description provided for @mustBeLocalEgyptianPhone.
  ///
  /// In ar, this message translates to:
  /// **'يجب إدخال رقم مصري محلي مثل (015xxxxxxxx)'**
  String mustBeLocalEgyptianPhone(String value);

  /// No description provided for @mustBeInternationalEgyptianPhone.
  ///
  /// In ar, this message translates to:
  /// **'يجب إدخال رقم مصري بالصيغة الدولية مثل (2015xxxxxxxx)'**
  String mustBeInternationalEgyptianPhone(String value);

  /// No description provided for @mustBeLocalKsaPhone.
  ///
  /// In ar, this message translates to:
  /// **'يجب إدخال رقم سعودي محلي مثل (05xxxxxxxx)'**
  String mustBeLocalKsaPhone(String value);

  /// No description provided for @mustBeInternationalKsaPhone.
  ///
  /// In ar, this message translates to:
  /// **'يجب إدخال رقم سعودي بالصيغة الدولية مثل (96605xxxxxxxx)'**
  String mustBeInternationalKsaPhone(String value);
}

class _SimpleLocalizationsDelegate extends LocalizationsDelegate<SimpleLocalizations> {
  const _SimpleLocalizationsDelegate();

  @override
  Future<SimpleLocalizations> load(Locale locale) {
    return SynchronousFuture<SimpleLocalizations>(lookupSimpleLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en', 'fr', 'ur'].contains(locale.languageCode);

  @override
  bool shouldReload(_SimpleLocalizationsDelegate old) => false;
}

SimpleLocalizations lookupSimpleLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return SimpleLocalizationsAr();
    case 'en': return SimpleLocalizationsEn();
    case 'fr': return SimpleLocalizationsFr();
    case 'ur': return SimpleLocalizationsUr();
  }

  throw FlutterError(
    'SimpleLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
