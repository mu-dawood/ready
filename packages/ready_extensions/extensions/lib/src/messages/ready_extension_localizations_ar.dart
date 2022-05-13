import 'package:intl/intl.dart' as intl;
import 'ready_extension_localizations.dart';

/// The translations for Arabic (`ar`).
class ReadyExtensionLocalizationsAr extends ReadyExtensionLocalizations {
  ReadyExtensionLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String yearsPlural(num count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'عام واحد',
      two: 'عامين',
      few: '$count أعوام',
      other: '$count عام',
    );
  }

  @override
  String monthsPlural(num count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'شهر واحد',
      two: 'شهرين',
      few: '$count أشهر',
      other: '$count شهر',
    );
  }

  @override
  String daysPlural(num count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'يوم واحد',
      two: 'يومين',
      few: '$count أيام',
      other: '$count يوم',
    );
  }

  @override
  String weeksPlural(num count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'أسبوع واحد',
      two: 'أسبوعين',
      few: '$count أسابيع',
      other: '$count أسبوع',
    );
  }

  @override
  String hoursPlural(num count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'ساعة واحدة',
      two: 'ساعتين',
      few: '$count ساعات',
      other: '$count ساعة',
    );
  }

  @override
  String minutesPlural(num count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'دقيقة واحدة',
      two: 'دقيقتين',
      few: '$count دقائق',
      other: '$count دقيقة',
    );
  }

  @override
  String secondsPlural(num count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'ثانية واحدة',
      two: 'ثانيتين',
      few: '$count ثواني',
      other: '$count ثانية',
    );
  }

  @override
  String get now => 'الآن';

  @override
  String get formatSeparator => ' ، ';
}
