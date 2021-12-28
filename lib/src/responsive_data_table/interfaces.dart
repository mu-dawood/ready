part of responsive_data_table;

abstract class _DataTableFilter<T> {
  /// The current value
  T? get value;

  /// callback when value changed
  ValueChanged<T?> get onChange;
}
