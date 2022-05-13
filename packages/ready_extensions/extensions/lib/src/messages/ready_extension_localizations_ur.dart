import 'package:intl/intl.dart' as intl;
import 'ready_extension_localizations.dart';

/// The translations for Urdu (`ur`).
class ReadyExtensionLocalizationsUr extends ReadyExtensionLocalizations {
  ReadyExtensionLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String yearsPlural(num count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'ایک سال',
      two: 'دو سال',
      few: '$count سال',
      other: '$count سال',
    );
  }

  @override
  String monthsPlural(num count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'ایک مہینہ',
      two: 'دو ماہ',
      few: '$count مہینہ',
      other: '$count مہینہ',
    );
  }

  @override
  String daysPlural(num count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'ایک دن',
      two: 'دو دن',
      few: '$count دن',
      other: '$count دن',
    );
  }

  @override
  String weeksPlural(num count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'ایک ہفتہ',
      two: 'دو ہفتے',
      few: '$count ہفتے',
      other: '$count ہفتے',
    );
  }

  @override
  String hoursPlural(num count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'ایک گھنٹہ',
      two: 'دو گھنٹے',
      few: '$count گھنٹے',
      other: '$count گھنٹے',
    );
  }

  @override
  String minutesPlural(num count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'ایک منٹ',
      two: 'دو منٹ',
      few: '$count منٹ',
      other: '$count منٹ',
    );
  }

  @override
  String secondsPlural(num count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'ایک سیکنڈ',
      two: 'دو سیکنڈ',
      few: '$count سیکنڈ',
      other: '$count سیکنڈ',
    );
  }

  @override
  String get now => 'ابھی';

  @override
  String get formatSeparator => ' ، ';
}
