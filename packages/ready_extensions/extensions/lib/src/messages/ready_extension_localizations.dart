import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart' as intl;

import 'ready_extension_localizations_ar.dart';
import 'ready_extension_localizations_en.dart';
import 'ready_extension_localizations_fr.dart';
import 'ready_extension_localizations_ur.dart';

/// Callers can lookup localized strings with an instance of ReadyExtensionLocalizations returned
/// by `ReadyExtensionLocalizations.of(context)`.
///
/// Applications need to include `ReadyExtensionLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'messages/ready_extension_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: ReadyExtensionLocalizations.localizationsDelegates,
///   supportedLocales: ReadyExtensionLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the ReadyExtensionLocalizations.supportedLocales
/// property.
abstract class ReadyExtensionLocalizations {
  ReadyExtensionLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static ReadyExtensionLocalizations? of(BuildContext context) {
    return Localizations.of<ReadyExtensionLocalizations>(
        context, ReadyExtensionLocalizations);
  }

  static const LocalizationsDelegate<ReadyExtensionLocalizations> delegate =
      _ReadyExtensionLocalizationsDelegate();

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
  String yearsPlural(num count);

  /// No description provided for @monthsPlural.
  ///
  /// In ar, this message translates to:
  /// **'{count,plural, =0{} =1{شهر واحد} =2{شهرين}  few{{count} أشهر}} other{{count} شهر}}'**
  String monthsPlural(num count);

  /// No description provided for @daysPlural.
  ///
  /// In ar, this message translates to:
  /// **'{count,plural, =0{} =1{يوم واحد} =2{يومين}  few{{count} أيام}} other{{count} يوم}}'**
  String daysPlural(num count);

  /// No description provided for @weeksPlural.
  ///
  /// In ar, this message translates to:
  /// **'{count,plural, =0{} =1{أسبوع واحد} =2{أسبوعين}  few{{count} أسابيع}} other{{count} أسبوع}}'**
  String weeksPlural(num count);

  /// No description provided for @hoursPlural.
  ///
  /// In ar, this message translates to:
  /// **'{count,plural, =0{} =1{ساعة واحدة} =2{ساعتين}  few{{count} ساعات}} other{{count} ساعة}}'**
  String hoursPlural(num count);

  /// No description provided for @minutesPlural.
  ///
  /// In ar, this message translates to:
  /// **'{count,plural, =0{} =1{دقيقة واحدة} =2{دقيقتين}  few{{count} دقائق}} other{{count} دقيقة}}'**
  String minutesPlural(num count);

  /// No description provided for @secondsPlural.
  ///
  /// In ar, this message translates to:
  /// **'{count,plural, =0{} =1{ثانية واحدة} =2{ثانيتين}  few{{count} ثواني}} other{{count} ثانية}}'**
  String secondsPlural(num count);

  /// No description provided for @now.
  ///
  /// In ar, this message translates to:
  /// **'الآن'**
  String get now;

  /// No description provided for @formatSeparator.
  ///
  /// In ar, this message translates to:
  /// **' ، '**
  String get formatSeparator;
}

class _ReadyExtensionLocalizationsDelegate
    extends LocalizationsDelegate<ReadyExtensionLocalizations> {
  const _ReadyExtensionLocalizationsDelegate();

  @override
  Future<ReadyExtensionLocalizations> load(Locale locale) {
    return SynchronousFuture<ReadyExtensionLocalizations>(
        lookupReadyExtensionLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en', 'fr', 'ur'].contains(locale.languageCode);

  @override
  bool shouldReload(_ReadyExtensionLocalizationsDelegate old) => false;
}

ReadyExtensionLocalizations lookupReadyExtensionLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return ReadyExtensionLocalizationsAr();
    case 'en':
      return ReadyExtensionLocalizationsEn();
    case 'fr':
      return ReadyExtensionLocalizationsFr();
    case 'ur':
      return ReadyExtensionLocalizationsUr();
  }

  throw FlutterError(
      'ReadyExtensionLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
