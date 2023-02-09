import 'package:intl/intl.dart' as intl;

import 'ready_extension_localizations.dart';

/// The translations for Arabic (`ar`).
class ReadyExtensionLocalizationsAr extends ReadyExtensionLocalizations {
  ReadyExtensionLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String yearsPlural(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count عام',
      few: '$count أعوام',
      two: 'عامين',
      one: 'عام واحد',
      zero: '',
    );
    return '$_temp0';
  }

  @override
  String monthsPlural(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count شهر',
      few: '$count أشهر',
      two: 'شهرين',
      one: 'شهر واحد',
      zero: '',
    );
    return '$_temp0';
  }

  @override
  String daysPlural(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count يوم',
      few: '$count أيام',
      two: 'يومين',
      one: 'يوم واحد',
      zero: '',
    );
    return '$_temp0';
  }

  @override
  String weeksPlural(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count أسبوع',
      few: '$count أسابيع',
      two: 'أسبوعين',
      one: 'أسبوع واحد',
      zero: '',
    );
    return '$_temp0';
  }

  @override
  String hoursPlural(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ساعة',
      few: '$count ساعات',
      two: 'ساعتين',
      one: 'ساعة واحدة',
      zero: '',
    );
    return '$_temp0';
  }

  @override
  String minutesPlural(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count دقيقة',
      few: '$count دقائق',
      two: 'دقيقتين',
      one: 'دقيقة واحدة',
      zero: '',
    );
    return '$_temp0';
  }

  @override
  String secondsPlural(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ثانية',
      few: '$count ثواني',
      two: 'ثانيتين',
      one: 'ثانية واحدة',
      zero: '',
    );
    return '$_temp0';
  }

  @override
  String get now => 'الآن';

  @override
  String get formatSeparator => ' ، ';
}
