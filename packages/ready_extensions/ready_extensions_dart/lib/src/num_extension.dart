import 'package:intl/intl.dart';

extension NumExtensions on num? {
  /// format the current number using NumberFormat
  String format(NumberFormat format) {
    if (this == null) return '';
    return format.format(this);
  }

  /// remove trailing zeros from the number
  /// ex: 15.00 => 15
  /// if fractionDigits is specified ex noTrailing(2)
  /// 15.5 => 15.50
  /// 15.500 => 15.50
  /// 15.00 => 15.00
  String noTrailing([int? fractionDigits]) {
    if (this == null) return '';
    var str = ((fractionDigits == null
            ? this!.toString()
            : this!.toStringAsFixed(fractionDigits)))
        .replaceAll(r'\.0+$', '');

    var dotIndex = str.indexOf(".");
    if (dotIndex < 0 || fractionDigits != null) return str;
    var splits = str.split('.');
    var trailing = splits[1].replaceAll(RegExp(r'0+$'), '');
    if (trailing.isEmpty) {
      return splits[0];
    } else {
      return '${splits[0]}.$trailing';
    }
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
