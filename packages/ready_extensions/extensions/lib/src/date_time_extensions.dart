// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String _format(
      BuildContext context, DateFormat Function(String? locale) getFormatted) {
    var locale = Localizations.maybeLocaleOf(context)?.languageCode;
    return getFormatted(locale).format(this);
  }

  /// Format date with DateFormat.d intl format
  String d(BuildContext context) =>
      _format(context, (locale) => DateFormat.d(locale));

  /// Format date with DateFormat.E intl format
  String E(BuildContext context) =>
      _format(context, (locale) => DateFormat.E(locale));

  /// Format date with DateFormat.EEEE intl format
  String EEEE(BuildContext context) =>
      _format(context, (locale) => DateFormat.EEEE(locale));

  /// Format date with DateFormat.LLL intl format
  String LLL(BuildContext context) =>
      _format(context, (locale) => DateFormat.LLL(locale));

  /// Format date with DateFormat.LLLL intl format
  String LLLL(BuildContext context) =>
      _format(context, (locale) => DateFormat.LLLL(locale));

  /// Format date with DateFormat.M intl format
  String M(BuildContext context) =>
      _format(context, (locale) => DateFormat.M(locale));

  /// Format date with DateFormat.Md intl format
  String Md(BuildContext context) =>
      _format(context, (locale) => DateFormat.Md(locale));

  /// Format date with DateFormat.MEd intl format
  String MEd(BuildContext context) =>
      _format(context, (locale) => DateFormat.MEd(locale));

  /// Format date with DateFormat.MMM intl format
  String MMM(BuildContext context) =>
      _format(context, (locale) => DateFormat.MMM(locale));

  /// Format date with DateFormat.MMMd intl format
  String MMMd(BuildContext context) =>
      _format(context, (locale) => DateFormat.MMMd(locale));

  /// Format date with DateFormat.MMMEd intl format
  String MMMEd(BuildContext context) =>
      _format(context, (locale) => DateFormat.MMMEd(locale));

  /// Format date with DateFormat.MMMM intl format
  String MMMM(BuildContext context) =>
      _format(context, (locale) => DateFormat.MMMM(locale));

  /// Format date with DateFormat.MMMd intl format
  String MMMMd(BuildContext context) =>
      _format(context, (locale) => DateFormat.MMMMd(locale));

  // cSpell: ignore MMMMEEEEd
  /// Format date with DateFormat.MMMMEEEEd intl format
  String MMMMEEEEd(BuildContext context) =>
      _format(context, (locale) => DateFormat.MMMMEEEEd(locale));

  /// Format date with DateFormat.QQQ intl format
  String QQQ(BuildContext context) =>
      _format(context, (locale) => DateFormat.QQQ(locale));

  /// Format date with DateFormat.QQQQ intl format
  String QQQQ(BuildContext context) =>
      _format(context, (locale) => DateFormat.QQQQ(locale));

  /// Format date with DateFormat.y intl format
  String y(BuildContext context) =>
      _format(context, (locale) => DateFormat.y(locale));

  /// Format date with DateFormat.yM intl format
  String yM(BuildContext context) =>
      _format(context, (locale) => DateFormat.yM(locale));

  /// Format date with DateFormat.yMd intl format
  String yMd(BuildContext context) =>
      _format(context, (locale) => DateFormat.yMd(locale));

  /// Format date with DateFormat.yMEd intl format
  String yMEd(BuildContext context) =>
      _format(context, (locale) => DateFormat.yMEd(locale));

  /// Format date with DateFormat.yMMM intl format
  String yMMM(BuildContext context) =>
      _format(context, (locale) => DateFormat.yMMM(locale));

  /// Format date with DateFormat.yMMMd intl format
  String yMMMd(BuildContext context) =>
      _format(context, (locale) => DateFormat.yMMMd(locale));

  /// Format date with DateFormat.yMMMEd intl format
  String yMMMEd(BuildContext context) =>
      _format(context, (locale) => DateFormat.yMMMEd(locale));

  /// Format date with DateFormat.yMMMM intl format
  String yMMMM(BuildContext context) =>
      _format(context, (locale) => DateFormat.yMMMM(locale));

  /// Format date with DateFormat.yMMMMd intl format
  String yMMMMd(BuildContext context) =>
      _format(context, (locale) => DateFormat.yMMMMd(locale));

  /// Format date with DateFormat.yMMMMEEEEd intl format
  String yMMMMEEEEd(BuildContext context) =>
      _format(context, (locale) => DateFormat.yMMMMEEEEd(locale));

  /// Format date with DateFormat.yQQQ intl format

  String yQQQ(BuildContext context) =>
      _format(context, (locale) => DateFormat.yQQQ(locale));

  /// Format date with DateFormat.yQQQQ intl format

  String yQQQQ(BuildContext context) =>
      _format(context, (locale) => DateFormat.yQQQQ(locale));

  /// Format date with DateFormat.H intl format

  String H(BuildContext context) =>
      _format(context, (locale) => DateFormat.H(locale));

  /// Format date with DateFormat.Hm intl format

  String Hm(BuildContext context) =>
      _format(context, (locale) => DateFormat.Hm(locale));

  /// Format date with DateFormat.Hms intl format

  String Hms(BuildContext context) =>
      _format(context, (locale) => DateFormat.Hms(locale));

  /// Format date with DateFormat.j intl format

  String j(BuildContext context) =>
      _format(context, (locale) => DateFormat.j(locale));

  /// Format date with DateFormat.jm intl format

  String jm(BuildContext context) =>
      _format(context, (locale) => DateFormat.jm(locale));

  /// Format date with DateFormat.jms intl format

  String jms(BuildContext context) =>
      _format(context, (locale) => DateFormat.jms(locale));

  /// Format date with DateFormat.m intl format

  String m(BuildContext context) =>
      _format(context, (locale) => DateFormat.m(locale));

  /// Format date with DateFormat.ms intl format

  String ms(BuildContext context) =>
      _format(context, (locale) => DateFormat.ms(locale));

  /// Format date with DateFormat.s intl format

  String s(BuildContext context) =>
      _format(context, (locale) => DateFormat.s(locale));

  /// Format date with DateFormat(patterns) intl format
  String format(BuildContext context, String pattern) =>
      _format(context, (locale) => DateFormat(pattern, locale));

  /// If the date did not exceed 24 hours will format jms else will format yMMMEd
  String format24(BuildContext context) {
    var now = DateTime.now();
    if (isAfter(now)) {
      return _format(context, (locale) => DateFormat.yMMMEd(locale));
    } else if (now.difference(this).inHours <= 24) {
      return _format(context, (locale) => DateFormat.jms(locale));
    } else {
      return _format(context, (locale) => DateFormat.yMMMEd(locale));
    }
  }
}
