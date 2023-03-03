part of responsive_data_table;

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
