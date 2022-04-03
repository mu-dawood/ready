import 'package:intl/intl.dart';

extension NumExtensions on num? {
  String format(NumberFormat format) {
    if (this == null) return '';
    return format.format(this);
  }

  String noTrailing([int? fractionDigits]) {
    if (this == null) return '';
    var str = ((fractionDigits == null ? this!.toString() : this!.toStringAsFixed(fractionDigits))).replaceAll(r'\.0+$', '');

    var dotIndex = str.indexOf(".");
    if (dotIndex < 0 || fractionDigits != null) return str;
    var splits = str.split('.');
    var trailing = splits[1].replaceAll(RegExp(r'0+$'), '');
    if (trailing.isEmpty)
      return splits[0];
    else
      return '${splits[0]}.${trailing}';
  }

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

  String compact([String? locale]) {
    if (this == null) return '';
    return NumberFormat.compact(locale: locale).format(this!);
  }

  String compactLong([String? locale]) {
    if (this == null) return '';
    return NumberFormat.compactLong(locale: locale).format(this!);
  }

  String decimalPattern([String? locale]) {
    if (this == null) return '';
    return NumberFormat.decimalPattern(locale).format(this!);
  }

  String percentPattern([String? locale]) {
    if (this == null) return '';
    return NumberFormat.percentPattern(locale).format(this!);
  }

  String scientificPattern([String? locale]) {
    if (this == null) return '';
    return NumberFormat.scientificPattern(locale).format(this!);
  }

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
