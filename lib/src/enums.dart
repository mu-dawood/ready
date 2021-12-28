/// This will specify the type of [ResponsiveDataTable]
enum ResponsiveDataTableType {
  /// This will make [ResponsiveDataTable] use only table in all cases
  table,

  /// This will make [ResponsiveDataTable] use only list in all cases
  list,
}

/// specify the device breakpoints according to width
enum LayoutType {
  /// [width] <= [321]
  xsmall,

  /// [width] > [320] && [width] <= [640]
  small,

  /// [width] > [640] && [width] <= [960]
  medium,

  /// [width] > [960] && [width] <= [1024]
  large,

  /// [width] > [1024] && [width] <= [1366]
  xlarge,

  /// [width] > [1366]
  xxlarge,
}

enum ListStateType {
  /// when need intial loading
  needIntialLoading,

  /// when intial load
  intialLoading,

  /// when items loaded
  loaded,

  /// when loaded but no items
  empty,

  /// when refrshing items
  refreshing,

  /// when loading next
  loadingNext,

  /// when has error
  error,
}
