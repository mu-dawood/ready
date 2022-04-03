library duration_extension;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_dart/simple_dart.dart';
import '../gen_l10n/simple_localizations.dart';
import 'package:simple/src/gen_l10n/simple_localizations.dart';
part 'translated_formatter.dart';

extension FlutterDurationExtensions on Duration {
  ///Localize duration useing TranslatedDurationFormatter formatter
  ///You have to add `SimpleLocalizations.delegate` in your `localizationsDelegates`
  /// ```
  /// return MaterialApp(
  ///   localizationsDelegates: [
  ///     SimpleLocalizations.delegate,
  ///     ...other delegates
  ///   ],
  ///   supportedLocales: SimpleLocalizations.supportedLocales,
  ///   home: MyApplicationHome(),
  /// );
  /// ```
  String formatWith(
    BuildContext context, {
    int maxParts = 2,
    int secondsToShowNow = 0,
  }) {
    var simpleLocalization = SimpleLocalizations.of(context);
    if (simpleLocalization == null) {
      throw FlutterError(
          'You have to add `SimpleLocalizations.delegate` in your `localizationsDelegates`');
    }
    return format(
      maxParts: maxParts,
      secondsToShowNow: 0,
      formatter: TranslatedDurationFormatter(context),
    );
  }
}
