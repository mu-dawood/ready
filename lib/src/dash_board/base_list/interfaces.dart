part of responsive_data_table;

abstract class _DataTableFilter<T> {
  T? get value;
  ValueChanged<T?> get onChange;
}
