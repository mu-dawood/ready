library ready;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'l10n/ready_localizations.dart';
import 'l10n/ready_localizations_en.dart';

class Ready {
  /// get [RListLocalizations] localization delegates
  /// This must be added to your [MaterialApp]
  static LocalizationsDelegate<ReadyListLocalizations> get delegate =>
      ReadyListLocalizations.delegate;

  /// list of  supported locales by this package
  static List<Locale> get supportedLocales =>
      ReadyListLocalizations.supportedLocales;

  /// get localization  from [context] or english if no localizations found
  static ReadyListLocalizations localization(BuildContext context) {
    var localizations = ReadyListLocalizations.of(context);
    if (localizations == null) return ReadyListLocalizationsEn();
    return localizations;
  }

  /// detect of the widget with the [context] is visible on the screen or not
  static bool isVisible(
    BuildContext context, {
    double alignment = 0.0,
    Duration duration = Duration.zero,
    Curve curve = Curves.ease,
    ScrollPositionAlignmentPolicy alignmentPolicy =
        ScrollPositionAlignmentPolicy.explicit,
  }) {
    ScrollableState? scrollable = Scrollable.of(context);
    while (scrollable != null) {
      if (!_isVisible(
        scrollable.position,
        context.findRenderObject()!,
        alignment: alignment,
      )) {
        return false;
      }
      context = scrollable.context;
      scrollable = Scrollable.of(context);
    }
    return true;
  }

  static bool _isVisible(
    ScrollPosition position,
    RenderObject object, {
    double alignment = 0.0,
  }) {
    assert(object.attached);
    try {
      final RenderAbstractViewport viewport =
          RenderAbstractViewport.of(object)!;
      num target = viewport
          .getOffsetToReveal(object, alignment)
          .offset
          .clamp(position.minScrollExtent, position.maxScrollExtent);

      return (target >= position.minScrollExtent &&
          target <= position.maxScrollExtent);
    } catch (e) {
      return false;
    }
  }
}
