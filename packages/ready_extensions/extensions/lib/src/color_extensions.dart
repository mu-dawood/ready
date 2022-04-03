import 'package:flutter/painting.dart';

extension ColorExtensions on Color {
  /// This will return the lighter color of current
  /// amount must be between 0 & 1
  Color lighten([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    var lightness = (hsl.lightness + amount).clamp(0.0, 1.0);
    final hslLight = hsl.withLightness(lightness);

    return hslLight.toColor();
  }

  /// This will return the darker color of current
  /// amount must be between 0 & 1
  Color darken([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    var lightness = (hsl.lightness - amount).clamp(0.0, 1.0);
    final hslLight = hsl.withLightness(lightness);
    return hslLight.toColor();
  }
}
