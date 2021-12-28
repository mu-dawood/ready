part of ready_list;

typedef ShrinkWrapCallback = bool Function(ReadyListState controller);
typedef ReadyListWidgetBuilder<T> = List<Widget> Function(
    ReadyListState<T> state);
typedef GridDelegateCallback = SliverStaggeredGridDelegate Function({
  required double width,
  required int? length,
});

typedef ReadyListItemBuilder<T> = Widget Function(T? item, int index);

class ReorderOptions {
  final ReorderCallback onReorder;
  final ReorderItemProxyDecorator? proxyDecorator;
  final Widget? prototypeItem;
  ReorderOptions({
    required this.onReorder,
    this.proxyDecorator,
    this.prototypeItem,
  });
}

class PlaceholdersConfig {
  final Widget Function(bool loading, String? error)? builder;
  final String? emptyText;
  final String? loadingText;
  final Widget? icon;
  final Widget? loadingIndicator;
  final String? reload;
  final double spaceBetweenIconAndText;
  final double spaceBetweenTextAndButton;
  PlaceholdersConfig({
    this.loadingText,
    this.emptyText,
    this.reload,
    this.icon,
    this.loadingIndicator,
    this.spaceBetweenIconAndText = 10,
    this.spaceBetweenTextAndButton = 5,
  }) : builder = null;

  PlaceholdersConfig.builder({
    this.builder,
  })  : loadingText = '',
        reload = '',
        icon = null,
        loadingIndicator = null,
        spaceBetweenTextAndButton = 0,
        spaceBetweenIconAndText = 0,
        emptyText = '';
}

abstract class ReadyListConfigOptions {
  /// if false we will not show 'No more text' at the end of the list
  bool? get showNoMoreText;

  /// Config for placeholders when list is empty or has error
  /// [PlaceholdersConfig.loadingText] & [PlaceholdersConfig.loadingIndicator] is not used when [allowFakeItems] is true
  PlaceholdersConfig? get placeholdersConfig;

  /// whether to allow pull to refresh or not
  bool? get allowRefresh;

  /// whether to allow infinite scroll or not
  bool? get allowLoadNext;

  String? get noMoreText;
  String? get loadMoreText;
  EdgeInsetsGeometry? get padding;
  bool? get reverse;
  GradientGetterCallback? get shimmerScopeGradient;
  bool? get allowFakeItems;
  ShrinkWrapCallback? get shrinkWrap;
  Axis? get axis;
  ScrollPhysics? get physics;
  List<Widget>? get topLevelFooterSlivers;
  List<Widget>? get topLevelHeaderSlivers;
  int? get pageSize;
}

class ReadyListConfig extends InheritedWidget
    implements ReadyListConfigOptions {
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
  final bool? allowFakeItems;
  @override
  final GradientGetterCallback? shimmerScopeGradient;
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

  const ReadyListConfig({
    Key? key,
    required Widget child,
    this.placeholdersConfig,
    this.showNoMoreText,
    this.topLevelFooterSlivers,
    this.topLevelHeaderSlivers,
    this.allowRefresh,
    this.allowLoadNext,
    this.allowFakeItems,
    this.noMoreText,
    this.loadMoreText,
    this.padding,
    this.reverse,
    this.shimmerScopeGradient,
    this.shrinkWrap,
    this.axis,
    this.physics,
    this.pageSize,
  }) : super(key: key, child: child);

  static ReadyListConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ReadyListConfig>();
  }

  @override
  bool updateShouldNotify(ReadyListConfig oldWidget) {
    return oldWidget.placeholdersConfig != placeholdersConfig ||
        oldWidget.showNoMoreText != showNoMoreText ||
        oldWidget.padding != padding ||
        oldWidget.pageSize != pageSize ||
        oldWidget.physics != physics ||
        oldWidget.axis != axis ||
        oldWidget.shrinkWrap != shrinkWrap ||
        oldWidget.shimmerScopeGradient != shimmerScopeGradient ||
        oldWidget.reverse != reverse ||
        oldWidget.loadMoreText != loadMoreText ||
        oldWidget.noMoreText != noMoreText ||
        oldWidget.topLevelHeaderSlivers != topLevelHeaderSlivers ||
        oldWidget.allowLoadNext != allowLoadNext ||
        oldWidget.allowRefresh != allowRefresh ||
        oldWidget.topLevelFooterSlivers != topLevelFooterSlivers;
  }
}

class _ReadyListConfigOptionsDefauls implements ReadyListConfigOptions {
  @override
  final PlaceholdersConfig placeholdersConfig;
  @override
  final bool showNoMoreText;
  @override
  final bool allowRefresh;
  @override
  final bool allowLoadNext;

  @override
  final String noMoreText;
  @override
  final String loadMoreText;
  @override
  final EdgeInsetsGeometry? padding;
  @override
  final bool reverse;
  @override
  final GradientGetterCallback? shimmerScopeGradient;
  @override
  final ShrinkWrapCallback? shrinkWrap;
  @override
  final Axis axis;
  @override
  final ScrollPhysics? physics;
  @override
  final List<Widget>? topLevelFooterSlivers;
  @override
  final List<Widget>? topLevelHeaderSlivers;
  @override
  final bool allowFakeItems;
  @override
  final int pageSize;
  const _ReadyListConfigOptionsDefauls({
    required this.placeholdersConfig,
    required this.showNoMoreText,
    required this.topLevelFooterSlivers,
    required this.topLevelHeaderSlivers,
    required this.allowRefresh,
    required this.allowLoadNext,
    required this.noMoreText,
    required this.loadMoreText,
    required this.padding,
    required this.reverse,
    required this.shimmerScopeGradient,
    required this.shrinkWrap,
    required this.axis,
    required this.physics,
    required this.pageSize,
    required this.allowFakeItems,
  });

  static _ReadyListConfigOptionsDefauls effective(
      ReadyListConfigOptions? options, BuildContext context) {
    var tr = Ready.localization(context);
    var cofig = ReadyListConfig.of(context);
    return _ReadyListConfigOptionsDefauls(
      placeholdersConfig: options?.placeholdersConfig ??
          cofig?.placeholdersConfig ??
          PlaceholdersConfig(),
      topLevelFooterSlivers:
          options?.topLevelFooterSlivers ?? cofig?.topLevelFooterSlivers,
      topLevelHeaderSlivers:
          options?.topLevelHeaderSlivers ?? cofig?.topLevelHeaderSlivers,
      showNoMoreText: options?.showNoMoreText ?? cofig?.showNoMoreText ?? true,
      allowRefresh: options?.allowRefresh ?? cofig?.allowRefresh ?? true,
      allowLoadNext: options?.allowLoadNext ?? cofig?.allowLoadNext ?? true,
      noMoreText: options?.noMoreText ?? cofig?.noMoreText ?? tr.noMoreItems,
      loadMoreText: options?.loadMoreText ?? cofig?.loadMoreText ?? tr.loadMore,
      padding: options?.padding ?? cofig?.padding,
      reverse: options?.reverse ?? cofig?.reverse ?? false,
      shimmerScopeGradient:
          options?.shimmerScopeGradient ?? cofig?.shimmerScopeGradient,
      shrinkWrap: options?.shrinkWrap ?? cofig?.shrinkWrap ?? (_) => false,
      axis: options?.axis ?? cofig?.axis ?? Axis.vertical,
      physics: options?.physics ?? cofig?.physics,
      pageSize: options?.pageSize ?? cofig?.pageSize ?? 20,
      allowFakeItems: options?.allowFakeItems ?? cofig?.allowFakeItems ?? false,
    );
  }
}
