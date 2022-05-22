import 'package:intl/intl.dart';

extension NumExtensions on num? {
  /// format the current number using NumberFormat
  /// ex. #.0#
  String format(String format) {
    if (this == null) return '';
    return formatWith(NumberFormat(format));
  }

  /// format the current number using NumberFormat
  String formatWith(NumberFormat format) {
    if (this == null) return '';
    return format.format(this);
  }

  /// remove trailing zeros from the number
  /// ex: 15.00 => 15
  /// if fractionDigits is specified ex noTrailing(2)
  /// 15.5 => 15.50
  /// 15.500 => 15.50
  /// 15.00 => 15.00
  String noTrailing({
    int? fractionDigits,
    bool grouping = true,
    String? locale,
  }) {
    if (this == null) return '';
    var format = grouping ? '#,##0.' : '#.';
    if (fractionDigits == null) {
      format += '#############';
    } else {
      format += List.filled(fractionDigits, '0').join();
    }
    return formatWith(NumberFormat(format, locale));
  }

  /// format number with intl currency format
  String currency({
    String? locale,
    String? name,
    String? symbol,
    int? decimalDigits,
    String? customPattern,
  }) {
    if (this == null) return '';
    return NumberFormat.currency(
      locale: locale,
      name: name,
      symbol: symbol,
      decimalDigits: decimalDigits,
      customPattern: customPattern,
    ).format(this!);
  }

  /// format number with intl simpleCurrency format
  String simpleCurrency({
    String? locale,
    String? name,
    int? decimalDigits,
  }) {
    if (this == null) return '';
    return NumberFormat.simpleCurrency(
      locale: locale,
      name: name,
      decimalDigits: decimalDigits,
    ).format(this!);
  }

  /// format number with intl compactCurrency format
  String compactCurrency({
    String? locale,
    String? name,
    String? symbol,
    int? decimalDigits,
    String? customPattern,
  }) {
    if (this == null) return '';
    return NumberFormat.compactCurrency(
      locale: locale,
      name: name,
      symbol: symbol,
      decimalDigits: decimalDigits,
    ).format(this!);
  }

  /// format number with intl compactSimpleCurrency format
  String compactSimpleCurrency({
    String? locale,
    String? name,
    int? decimalDigits,
  }) {
    if (this == null) return '';
    return NumberFormat.compactSimpleCurrency(
      locale: locale,
      name: name,
      decimalDigits: decimalDigits,
    ).format(this!);
  }

  /// format number with intl compact format
  String compact([String? locale]) {
    if (this == null) return '';
    return NumberFormat.compact(locale: locale).format(this!);
  }

  /// format number with intl compactLong format
  String compactLong([String? locale]) {
    if (this == null) return '';
    return NumberFormat.compactLong(locale: locale).format(this!);
  }

  /// format number with intl decimalPattern format
  String decimalPattern([String? locale]) {
    if (this == null) return '';
    return NumberFormat.decimalPattern(locale).format(this!);
  }

  /// format number with intl percentPattern format
  String percentPattern([String? locale]) {
    if (this == null) return '';
    return NumberFormat.percentPattern(locale).format(this!);
  }

  /// format number with intl scientificPattern format
  String scientificPattern([String? locale]) {
    if (this == null) return '';
    return NumberFormat.scientificPattern(locale).format(this!);
  }

  /// format number with intl decimalPercentPattern format
  String decimalPercentPattern({
    String? locale,
    int? decimalDigits,
  }) {
    if (this == null) return '';
    return NumberFormat.decimalPercentPattern(
      locale: locale,
      decimalDigits: decimalDigits,
    ).format(this!);
  }
}

extension NotNullNumExtensions on num {
  /// convert duration to  ISO_8601  format
  String toISODuration() {
    var delta = toDouble();
    if (delta == 0) {
      return 'PT0S';
    }
    if (isNegative) {
      delta *= -1;
    }

    var years = (delta ~/ 31536000);
    delta = delta % 31536000;
    var months = ((delta ~/ 2592000) % 12);
    delta = delta % 2592000;
    var weeks = (delta ~/ 604800);
    delta = delta % 604800;
    var days = (delta ~/ 86400 % 365);
    delta = delta % 86400;
    var hours = (delta ~/ 3600 % 24);
    delta = delta % 3600;
    var minutes = (delta ~/ 60 % 60);
    delta = delta % 60;
    var seconds = (delta % 60).toInt();

    final strBuffer = StringBuffer('${isNegative ? '-' : ''}P');

    if (years != 0) strBuffer.write('${years}Y');
    if (months != 0) strBuffer.write('${months}M');
    if (weeks != 0) strBuffer.write('${weeks}W');
    if (days != 0) strBuffer.write('${days}D');

    if (<int>[hours, minutes, seconds].any((e) => e != 0)) {
      strBuffer.write('T');

      if (hours != 0) strBuffer.write('${hours}H');
      if (minutes != 0) strBuffer.write('${minutes}M');
      if (seconds != 0) strBuffer.write('${seconds}S');
    }
    return strBuffer.toString();
  }
}
