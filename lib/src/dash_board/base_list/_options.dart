part of responsive_data_table;

extension DataColumnExtension on List<String> {
  List<DataColumn> toDataColumns() {
    return map((e) {
      return DataColumn(label: Text(e));
    }).toList();
  }
}

extension DataColumnSingleExtension on String {
  DataColumn toDataColumns({bool numeric = false, DataColumnSortCallback? onSort}) {
    return DataColumn(
      label: Text(this),
      numeric: numeric,
      onSort: onSort,
    );
  }
}

enum ResponsiveDataTableType { table, list, auto }
enum LayoutType { xsmall, small, medium, large, xlarge, xxlarge }
typedef BuildItemCallBack<T> = List<Widget> Function(int index, T item);
typedef ListItemBuilder<T> = Widget Function(T item, int index, LayoutType layout, List<LoadingButton> actions);

class DataTableOptions<T> {
  static List<int> _availableRowsCount(int _prefered) {
    var list = [_prefered, 10, 25, 50, 100];
    list.sort();
    return list;
  }

  static int _intialRowsPerPage(int _prefered) => _prefered;

  final List<DataColumn> headers;
  final BuildItemCallBack<T> buildItem;
  final List<int> Function(int prefered) availableRowsCount;
  final int Function(int prefered) intialRowsPerPage;

  DataTableOptions({
    required this.headers,
    required this.buildItem,
    this.availableRowsCount = _availableRowsCount,
    this.intialRowsPerPage = _intialRowsPerPage,
  });
}

class ListOptions<T> implements ReadyListConfigOptions {
  static int _crossAxisCount(LayoutType layout) {
    switch (layout) {
      case LayoutType.xsmall:
      case LayoutType.small:
        return 1;
      case LayoutType.medium:
        return 2;
      case LayoutType.large:
        return 3;
      case LayoutType.xlarge:
        return 4;
      case LayoutType.xxlarge:
        return 5;
    }
  }

  final int Function(LayoutType layout) crossAxisCount;
  final ListItemBuilder<T>? _builder;
  final Widget Function(T item)? trailing;
  final Widget Function(T item)? _title;

  final ScrollController? scrollController;
  final ReadyListWidgetBuilder<T>? headerSlivers;
  final ReadyListWidgetBuilder<T>? innerHeaderSlivers;
  final ReadyListWidgetBuilder<T>? footerSlivers;
  final ReadyListWidgetBuilder<T>? innerFooterSlivers;

  @override
  final PlaceholdersConfig? placeholdersConfig;
  @override
  final bool? showNoMoreText;
  @override
  final bool? allowRefresh;
  @override
  final bool? allowLoadNext;
  @override
  final String? loadFailedText;
  @override
  final String? noMoreText;
  @override
  final String? loadMoreText;
  @override
  final EdgeInsetsGeometry? padding;
  @override
  final bool? reverse;
  @override
  final Widget Function(int index)? buildShimmer;
  @override
  final LinearGradient? shimmergradient;
  @override
  final ShrinkWrapCallback? shrinkWrap;
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
  ListOptions({
    this.crossAxisCount = _crossAxisCount,
    this.trailing,
    this.scrollController,
    this.headerSlivers,
    this.innerHeaderSlivers,
    this.footerSlivers,
    this.innerFooterSlivers,
    this.placeholdersConfig,
    this.showNoMoreText,
    this.allowRefresh,
    this.allowLoadNext,
    this.loadFailedText,
    this.noMoreText,
    this.loadMoreText,
    this.padding,
    this.reverse,
    this.buildShimmer,
    this.shimmergradient,
    this.shrinkWrap,
    this.axis,
    this.physics,
    this.topLevelFooterSlivers,
    this.topLevelHeaderSlivers,
    this.pageSize,
    required Widget Function(T item) title,
  })  : _builder = null,
        _title = title;

  ListOptions.builder({
    required ListItemBuilder<T> builder,
    this.scrollController,
    this.headerSlivers,
    this.innerHeaderSlivers,
    this.footerSlivers,
    this.innerFooterSlivers,
    this.placeholdersConfig,
    this.showNoMoreText,
    this.allowRefresh,
    this.allowLoadNext,
    this.loadFailedText,
    this.noMoreText,
    this.loadMoreText,
    this.padding,
    this.reverse,
    this.buildShimmer,
    this.shimmergradient,
    this.shrinkWrap,
    this.axis,
    this.physics,
    this.topLevelFooterSlivers,
    this.topLevelHeaderSlivers,
    this.pageSize,
    this.crossAxisCount = _crossAxisCount,
  })  : trailing = null,
        _title = null,
        _builder = builder;
}
