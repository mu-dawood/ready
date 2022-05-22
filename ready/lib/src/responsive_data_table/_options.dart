part of responsive_data_table;

typedef BuildItemCallBack<T> = List<Widget> Function(int index, T item);
typedef ListItemBuilder<T> = Widget Function(
    T item, int index, LayoutType layout, List<Widget> actions);

typedef DataTableActionCallBack<T, TController extends ReadyListController<T>>
    = Future Function(BuildContext context, TController controller, T item);

typedef DataTableActionProperty<T, Type> = Type Function(T item);
typedef DataTableActionPropertyCtx<T, Type> = Type Function(
    BuildContext context, T item);
typedef SelectedButtonCallBack = Widget Function(
    ResponsiveDataTableType type, List<int> selected);

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
  static List<int> _availableRowsCount(int preferred) {
    var list = [preferred, 10, 25, 50, 100];
    list.sort();
    return list;
  }

  static int _initialRowsPerPage(int preferred) => preferred;

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
  final List<int> Function(int preferred) availableRowsCount;

  /// the initial rows per page
  /// it must be in  [availableRowsCount]
  final int Function(int preferred) initialRowsPerPage;

  /// whether to show refresh icon or not
  final Widget Function({
    required bool enabled,
    required VoidCallback onRefresh,
    required bool refreshing,
  })? refreshButton;

  /// the initial rows per page
  /// it must be in  [availableRowsCount]
  final EdgeInsetsGeometry padding;
  DataTableOptions({
    required this.headers,
    required this.buildItem,
    this.padding = const EdgeInsets.symmetric(horizontal: 20),
    this.refreshButton = _DefaultRefreshButton.get,
    this.availableRowsCount = _availableRowsCount,
    this.initialRowsPerPage = _initialRowsPerPage,
  });
}

/// options for [ReadyList]
class ListOptions<T> implements ReadyListConfigOptions {
  /// specify the grid delegate when the visible layout is [ReadyList]
  final GridDelegateCallback? gridDelegate;
  final ListItemBuilder<T>? _builder;

  final Widget Function(T item)? trailing;
  final Widget Function(T item)? _title;

  /// scroll controller for [ReadyList]
  final ScrollController? scrollController;

  /// [ReadyList.headerSlivers]
  final ReadyListWidgetBuilder<T>? headerSlivers;

  /// [ReadyList.footerSlivers]
  final ReadyListWidgetBuilder<T>? footerSlivers;

  /// [ReadyList.innerFooterSlivers]
  final ReadyListWidgetBuilder<T>? innerFooterSlivers;
  @override
  final StateResultCallBack<bool>? handleNestedScrollViewOverlap;
  @override
  final PlaceholdersConfig? placeholdersConfig;
  @override
  final bool? showNoMoreText;
  @override
  final bool? allowRefresh;
  @override
  final bool? allowLoadNext;
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
  final Axis? axis;
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
  ListOptions({
    this.gridDelegate,
    this.trailing,
    this.scrollController,
    this.headerSlivers,
    this.footerSlivers,
    this.innerFooterSlivers,
    this.placeholdersConfig,
    this.showNoMoreText,
    this.allowRefresh,
    this.handleNestedScrollViewOverlap,
    this.allowLoadNext,
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
    required Widget Function(T item) title,
  })  : _builder = null,
        _title = title,
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
    this.allowRefresh,
    this.allowLoadNext,
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
}
