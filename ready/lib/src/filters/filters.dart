import 'dart:async';

import 'package:flutter/material.dart';

import '../l10n/ready_localizations.dart';
import '../ready.dart';

part 'date_range_filter.dart';
part 'date_time_filter.dart';
part 'multi_option_filters.dart';
part 'search_filter.dart';
part 'single_option_filters.dart';
part 'time_filter.dart';

mixin DataTableFilter<T> on Widget {
  /// The current value
  T get value;

  /// callback when value changed
  ValueChanged<T> get onChange;
}

mixin DecoratedDataTableFilter<T> implements DataTableFilter<T> {
  InputDecoration get decoration;
  String hintText(ReadyListLocalizations tr);

  InputDecoration _effectiveDecoration(BuildContext context) {
    var result = this.decoration is _DefaultInputDecoration
        ? this
            .decoration
            .copyWith(hintText: hintText(Ready.localization(context)))
        : decoration;

    return result.applyDefaults(Theme.of(context).inputDecorationTheme);
  }
}
