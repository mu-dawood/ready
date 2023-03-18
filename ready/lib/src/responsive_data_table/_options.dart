part of responsive_data_table;

typedef BuildItemCallBack<T> = List<Widget> Function(int index, T item);
typedef ListItemBuilder<T> = Widget Function(
    T item, int index, LayoutType layout, List<Widget> actions);

typedef DataTableActionCallBack<T, Args,
        TController extends BaseReadyListController<T, Args>>
    = Future Function(BuildContext context, TController controller, T item);

typedef DataTableActionProperty<T, Type> = Type Function(T item);
typedef DataTableActionPropertyCtx<T, Type> = Type Function(
    BuildContext context, T item);
typedef SelectedButtonCallBack = Widget Function(
    ResponsiveDataTableType type, Set<int> selected);
typedef TitleBuilderCallBack<T> = Widget Function(int index, T item);

extension DataColumnExtension on List<String> {
  /// extension method to help map [List] of [String] to [List] of [DataColumn]
  ///
  /// example:
  /// ```dart
  /// ['#','name'].toDataColumns(),
  /// ```
  List<DataColumn> toDataColumns() {
    return map((e) {
      return DataColumn(label: Text(e));
    }).toList();
  }
}

extension DataColumnSingleExtension on String {
  /// extension method to help convert  [String] to  [DataColumn]
  ///
  /// example:
  /// ```dart
  /// '#'.toDataColumns(),
  /// ```
  DataColumn toDataColumns(
      {bool numeric = false, DataColumnSortCallback? onSort}) {
    return DataColumn(
      label: Text(this),
      numeric: numeric,
      onSort: onSort,
    );
  }
}

/// options of DataTable
class DataTableOptions<T> {
  /// DataTable headers
  ///
  /// example
  /// ```dart
  /// ['#','name'].toDataColumns(),
  /// ```
  final List<DataColumn> headers;

  /// Get the list of widgets that describe the row
  /// list length must be equal to [headers] list
  final BuildItemCallBack<T> buildItem;

  /// get the [availableRowsCount] which will show menu to allow user select from it
  /// We prefer list that contains [preferred] but its optional
  final Set<int> availableRowsCount;

  /// the initial rows per page
  /// it must be in  [availableRowsCount]
  final int? initialRowsPerPage;

  /// whether to show refresh icon or not
  final Widget Function({
    required bool enabled,
    required VoidCallback onRefresh,
    required bool refreshing,
  })? refreshButton;

  /// the initial rows per page
  /// it must be in  [availableRowsCount]
  final EdgeInsetsGeometry padding;
  final Color Function(double percent)? headerColor;
  const DataTableOptions({
    required this.headers,
    required this.buildItem,
    this.padding = const EdgeInsets.symmetric(horizontal: 20),
    this.refreshButton = _DefaultRefreshButton.get,
    this.availableRowsCount = const {20, 40, 60, 80, 100},
    this.initialRowsPerPage,
    this.headerColor,
  }) : assert(availableRowsCount.length > 0);
}

/// options for [ReadyList]
class ListOptions<T, Args> implements ReadyListConfigOptions {
  /// specify the grid delegate when the visible layout is [ReadyList]
  final GridDelegateCallback? gridDelegate;
  final ListItemBuilder<T>? _builder;

  final Widget Function(T item)? trailing;
  final Widget Function(int index, T item)? _title;

  /// scroll controller for [ReadyList]
  final ScrollController? scrollController;

  /// [ReadyList.headerSlivers]
  final ReadyListWidgetBuilder<T, Args>? headerSlivers;

  /// [ReadyList.footerSlivers]
  final ReadyListWidgetBuilder<T, Args>? footerSlivers;

  /// [ReadyList.innerFooterSlivers]
  final ReadyListWidgetBuilder<T, Args>? innerFooterSlivers;
  @override
  final StateResultCallBack<bool>? handleNestedScrollViewOverlap;
  @override
  final PlaceholdersConfig? placeholdersConfig;
  @override
  final bool? showNoMoreText;

  @override
  final String? noMoreText;
  @override
  final String? loadMoreText;
  @override
  final EdgeInsetsGeometry? padding;
  @override
  final bool? reverse;
  @override
  final GradientGetterCallback? shimmerScopeGradient;
  @override
  final StateResultCallBack<bool>? shrinkWrap;
  @override
  final AxisConfig? axis;
  @override
  final ScrollPhysics? physics;
  @override
  final List<Widget>? topLevelFooterSlivers;
  @override
  final List<Widget>? topLevelHeaderSlivers;
  @override
  final int? pageSize;
  @override
  final bool? allowFakeItems;

  /// [title] is the card title of [ReadyList] item
  final Color Function(double percent)? headerColor;
  const ListOptions({
    this.gridDelegate,
    this.trailing,
    this.scrollController,
    this.headerSlivers,
    this.footerSlivers,
    this.innerFooterSlivers,
    this.placeholdersConfig,
    this.showNoMoreText,
    this.handleNestedScrollViewOverlap,
    this.noMoreText,
    this.loadMoreText,
    this.padding,
    this.reverse,
    this.shimmerScopeGradient,
    this.shrinkWrap,
    this.headerColor,
    this.axis,
    this.physics,
    this.topLevelFooterSlivers,
    this.topLevelHeaderSlivers,
    this.pageSize,
    required TitleBuilderCallBack<T> title,
  })  : _builder = null,
        _title = title,
        allowFakeItems = true;

  const ListOptions._default({
    this.gridDelegate,
    this.trailing,
    this.scrollController,
    this.headerSlivers,
    this.footerSlivers,
    this.innerFooterSlivers,
    this.placeholdersConfig,
    this.showNoMoreText,
    this.handleNestedScrollViewOverlap,
    this.noMoreText,
    this.loadMoreText,
    this.padding,
    this.reverse,
    this.shimmerScopeGradient,
    this.shrinkWrap,
    this.headerColor,
    this.axis,
    this.physics,
    this.topLevelFooterSlivers,
    this.topLevelHeaderSlivers,
    this.pageSize,
  })  : _builder = null,
        _title = null,
        allowFakeItems = true;

  /// build [ReadyList] item with custom builder
  ListOptions.builder({
    required ListItemBuilder<T> builder,
    this.scrollController,
    this.headerSlivers,
    this.footerSlivers,
    this.handleNestedScrollViewOverlap,
    this.innerFooterSlivers,
    this.placeholdersConfig,
    this.showNoMoreText,
    this.headerColor,
    this.noMoreText,
    this.loadMoreText,
    this.padding,
    this.reverse,
    this.shimmerScopeGradient,
    this.shrinkWrap,
    this.axis,
    this.physics,
    this.topLevelFooterSlivers,
    this.topLevelHeaderSlivers,
    this.pageSize,
    this.allowFakeItems,
    this.gridDelegate,
  })  : trailing = null,
        _title = null,
        _builder = builder;

  @override
  bool? get allowLoadNext => null;

  @override
  bool? get allowRefresh => null;
}
