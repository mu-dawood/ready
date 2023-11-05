part of ready_list;

typedef StateResultCallBack<T> = T Function(BaseReadyListState state);
typedef ReadyListWidgetBuilder<T, S extends BaseReadyListState<T>>
    = List<Widget> Function(S state);

typedef ReadyListSliverBuilder<T, S extends BaseReadyListState<T>>
    = List<Widget> Function(S state, Widget? Function() defaultPlaceHolder);
typedef GridDelegateCallback = SliverSimpleGridDelegate Function({
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
  PlaceholdersConfig._({
    this.loadingText,
    this.emptyText,
    this.builder,
    this.reload,
    this.icon,
    this.loadingIndicator,
    this.spaceBetweenIconAndText = 10,
    this.spaceBetweenTextAndButton = 5,
  });
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

  PlaceholdersConfig copyWith(PlaceholdersConfig? other) {
    return PlaceholdersConfig._(
      builder: other?.builder ?? builder,
      emptyText: other?.emptyText ?? emptyText,
      loadingText: other?.loadingText ?? loadingText,
      icon: other?.icon ?? icon,
      loadingIndicator: other?.loadingIndicator ?? loadingIndicator,
      reload: other?.reload ?? reload,
      spaceBetweenIconAndText:
          other?.spaceBetweenIconAndText ?? spaceBetweenIconAndText,
      spaceBetweenTextAndButton:
          other?.spaceBetweenTextAndButton ?? spaceBetweenTextAndButton,
    );
  }
}

class AxisConfig {
  final Axis axis;
  final StateResultCallBack<BoxConstraints> constraints;

  AxisConfig._(this.axis, this.constraints);

  const AxisConfig.horizontal(this.constraints) : axis = Axis.horizontal;

  factory AxisConfig.vertical() {
    return AxisConfig._(Axis.vertical, (state) => const BoxConstraints());
  }
}

abstract class ReadyListConfigOptions {
  /// if true it will add [SliverOverlapInjector] if the list placed inside [NestedScrollView]
  /// defaults to true
  StateResultCallBack<bool>? get handleNestedScrollViewOverlap;

  /// if false we will not show 'No more text' at the end of the list
  bool? get showNoMoreText;

  /// Config for placeholders when list is empty or has error
  /// [PlaceholdersConfig.loadingText] & [PlaceholdersConfig.loadingIndicator] is not used when [allowFakeItems] is true
  PlaceholdersConfig? get placeholdersConfig;

  /// whether to allow pull to refresh or not
  bool? get allowRefresh;

  /// whether to allow infinite scroll or not
  bool? get allowLoadNext;

  /// The text to displayed when no more items
  String? get noMoreText;

  /// The text to display when  items loaded but not fill the screen
  String? get loadMoreText;

  /// padding of the list
  EdgeInsetsGeometry? get padding;

  /// whether to reverse the list or not
  bool? get reverse;

  /// gradient of shimmer scope
  GradientGetterCallback? get shimmerScopeGradient;

  /// if this is true the the item that passed to builder item may be null
  /// useful to display shimmer
  bool? get allowFakeItems;

  /// whether to shrink-wrap or not
  StateResultCallBack<bool>? get shrinkWrap;

  /// axis of the list
  AxisConfig? get axis;

  /// physics of the list
  ScrollPhysics? get physics;

  /// The first items in the list
  /// This can be configured globally
  List<Widget>? get topLevelFooterSlivers;

  /// The last items in the list
  /// This can be configured globally
  List<Widget>? get topLevelHeaderSlivers;

  /// page size to be passed to controller loadData
  int? get pageSize;
}

class ReadyListConfig extends InheritedWidget
    implements ReadyListConfigOptions {
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
  final bool? allowFakeItems;
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

  const ReadyListConfig({
    Key? key,
    required Widget child,
    this.placeholdersConfig,
    this.handleNestedScrollViewOverlap,
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
        oldWidget.handleNestedScrollViewOverlap !=
            handleNestedScrollViewOverlap ||
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

class _ReadyListConfigOptionsDefaults implements ReadyListConfigOptions {
  @override
  final StateResultCallBack<bool> handleNestedScrollViewOverlap;
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
  final StateResultCallBack<bool>? shrinkWrap;
  @override
  final AxisConfig axis;
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
  const _ReadyListConfigOptionsDefaults({
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
    required this.handleNestedScrollViewOverlap,
  });

  static _ReadyListConfigOptionsDefaults effective(
      ReadyListConfigOptions? options, BuildContext context) {
    var tr = Ready.localization(context);
    var config = ReadyListConfig.of(context);
    return _ReadyListConfigOptionsDefaults(
      placeholdersConfig: options?.placeholdersConfig ??
          config?.placeholdersConfig ??
          PlaceholdersConfig(),
      topLevelFooterSlivers:
          options?.topLevelFooterSlivers ?? config?.topLevelFooterSlivers,
      topLevelHeaderSlivers:
          options?.topLevelHeaderSlivers ?? config?.topLevelHeaderSlivers,
      showNoMoreText: options?.showNoMoreText ?? config?.showNoMoreText ?? true,
      handleNestedScrollViewOverlap: options?.handleNestedScrollViewOverlap ??
          config?.handleNestedScrollViewOverlap ??
          (_) => true,
      allowRefresh: options?.allowRefresh ?? config?.allowRefresh ?? true,
      allowLoadNext: options?.allowLoadNext ?? config?.allowLoadNext ?? true,
      noMoreText: options?.noMoreText ?? config?.noMoreText ?? tr.noMoreItems,
      loadMoreText:
          options?.loadMoreText ?? config?.loadMoreText ?? tr.loadMore,
      padding: options?.padding ?? config?.padding,
      reverse: options?.reverse ?? config?.reverse ?? false,
      shimmerScopeGradient:
          options?.shimmerScopeGradient ?? config?.shimmerScopeGradient,
      shrinkWrap: options?.shrinkWrap ?? config?.shrinkWrap ?? (_) => false,
      axis: options?.axis ?? config?.axis ?? AxisConfig.vertical(),
      physics: options?.physics ?? config?.physics,
      pageSize: options?.pageSize ?? config?.pageSize ?? 20,
      allowFakeItems:
          options?.allowFakeItems ?? config?.allowFakeItems ?? false,
    );
  }
}
