
import 'dart:async';

// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'simple_localizations_ar.dart';

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

  // ignore: unused_field
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
    Locale('ar')
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
  /// **' و '**
  String get formatSeperator;
}

class _SimpleLocalizationsDelegate extends LocalizationsDelegate<SimpleLocalizations> {
  const _SimpleLocalizationsDelegate();

  @override
  Future<SimpleLocalizations> load(Locale locale) {
    return SynchronousFuture<SimpleLocalizations>(_lookupSimpleLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar'].contains(locale.languageCode);

  @override
  bool shouldReload(_SimpleLocalizationsDelegate old) => false;
}

SimpleLocalizations _lookupSimpleLocalizations(Locale locale) {
  


// Lookup logic when only language code is specified.
switch (locale.languageCode) {
  case 'ar': return SimpleLocalizationsAr();
}


  throw FlutterError(
    'SimpleLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
