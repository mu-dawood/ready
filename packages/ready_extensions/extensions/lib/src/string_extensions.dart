import 'dart:ui' as ui show TextHeightBehavior;

import 'package:flutter/material.dart';
import 'package:ready_extensions_dart/ready_extensions_dart.dart';

import './duration_extension/duration_extension.dart';

extension FlutterStringExtensions on String? {
  /// will parse string to time of days
  /// example 19:16 or 07:18 pm
  TimeOfDay? toTimeOfDay() {
    if (this == null) return null;
    var str = this!.toLowerCase();
    var splits = str.replaceAll(RegExp('[^0-9:]'), '').split(':');
    if (splits.length >= 2) {
      var hour = int.tryParse(splits[0]);
      var minute = int.tryParse(splits[1]);
      if (hour != null && minute != null) {
        if (str.contains(RegExp('[^0-9:]'))) {
          if (str.toLowerCase().contains('pm')) hour += 12;
        }
        if (hour == 24) hour = 0;
        return TimeOfDay(hour: hour, minute: minute);
      }
      return null;
    } else {
      return null;
    }
  }

  /// check the string can be timeousDay
  bool get isTimeOfDay {
    return toTimeOfDay() != null;
  }

  /// converts string to text widget
  Text toTextWidget({
    TextAlign? textAlign,
    TextStyle? style,
    StrutStyle? strutStyle,
    TextDirection? textDirection,
    Locale? locale,
    bool? softWrap,
    TextOverflow? overflow,
    double? textScaleFactor,
    int? maxLines,
    String? semanticsLabel,
    TextWidthBasis? textWidthBasis,
    ui.TextHeightBehavior? textHeightBehavior,
  }) =>
      Text(
        this ?? '',
        textAlign: textAlign,
        style: style,
        strutStyle: strutStyle,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        overflow: overflow,
        textScaleFactor: textScaleFactor,
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        textHeightBehavior: textHeightBehavior,
        textWidthBasis: textWidthBasis,
      );

  /// convert  ISO_8601 duration to dart duration
  /// copied from iso_duration_parser package
  TimeOfDay parseIsoTimeOfDay() {
    var res = parseIsoDuration();
    if (res == null) {
      throw Exception('$this is not a valid ISO_8601 duration');
    }
    return res.toTimeOfDay();
  }
}
