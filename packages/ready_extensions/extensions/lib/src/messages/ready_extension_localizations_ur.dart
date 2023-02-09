import 'package:intl/intl.dart' as intl;

import 'ready_extension_localizations.dart';

/// The translations for Urdu (`ur`).
class ReadyExtensionLocalizationsUr extends ReadyExtensionLocalizations {
  ReadyExtensionLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String yearsPlural(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count سال',
      few: '$count سال',
      two: 'دو سال',
      one: 'ایک سال',
      zero: '',
    );
    return '$_temp0';
  }

  @override
  String monthsPlural(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count مہینہ',
      few: '$count مہینہ',
      two: 'دو ماہ',
      one: 'ایک مہینہ',
      zero: '',
    );
    return '$_temp0';
  }

  @override
  String daysPlural(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count دن',
      few: '$count دن',
      two: 'دو دن',
      one: 'ایک دن',
      zero: '',
    );
    return '$_temp0';
  }

  @override
  String weeksPlural(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ہفتے',
      few: '$count ہفتے',
      two: 'دو ہفتے',
      one: 'ایک ہفتہ',
      zero: '',
    );
    return '$_temp0';
  }

  @override
  String hoursPlural(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count گھنٹے',
      few: '$count گھنٹے',
      two: 'دو گھنٹے',
      one: 'ایک گھنٹہ',
      zero: '',
    );
    return '$_temp0';
  }

  @override
  String minutesPlural(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count منٹ',
      few: '$count منٹ',
      two: 'دو منٹ',
      one: 'ایک منٹ',
      zero: '',
    );
    return '$_temp0';
  }

  @override
  String secondsPlural(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count سیکنڈ',
      few: '$count سیکنڈ',
      two: 'دو سیکنڈ',
      one: 'ایک سیکنڈ',
      zero: '',
    );
    return '$_temp0';
  }

  @override
  String get now => 'ابھی';

  @override
  String get formatSeparator => ' ، ';
}
