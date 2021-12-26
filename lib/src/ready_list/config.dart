part of ready_list;

typedef ShrinkWrapCallback = bool Function(ReadyListState controller);

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
  bool? get showNoMoreText;
  PlaceholdersConfig? get placeholdersConfig;
  bool? get allowRefresh;
  bool? get allowLoadNext;
  String? get loadFailedText;
  String? get noMoreText;
  String? get loadMoreText;
  EdgeInsetsGeometry? get padding;
  bool? get reverse;
  Widget Function(int index)? get buildShimmer;
  LinearGradient? get shimmergradient;
  ShrinkWrapCallback? get shrinkWrap;
  Axis? get axis;
  ScrollPhysics? get physics;
  List<Widget>? get topLevelFooterSlivers;
  List<Widget>? get topLevelHeaderSlivers;
  int? get pageSize;
}

class ReadyListConfig extends InheritedWidget implements ReadyListConfigOptions {
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

  const ReadyListConfig({
    Key? key,
    required Widget child,
    this.placeholdersConfig,
    this.showNoMoreText,
    this.topLevelFooterSlivers,
    this.topLevelHeaderSlivers,
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
    this.pageSize,
  }) : super(key: key, child: child);

  static ReadyListConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ReadyListConfig>();
  }

  @override
  bool updateShouldNotify(ReadyListConfig oldWidget) {
    return oldWidget.placeholdersConfig != placeholdersConfig ||
        oldWidget.showNoMoreText != showNoMoreText ||
        oldWidget.loadFailedText != loadFailedText ||
        oldWidget.padding != padding ||
        oldWidget.pageSize != pageSize ||
        oldWidget.physics != physics ||
        oldWidget.axis != axis ||
        oldWidget.shrinkWrap != shrinkWrap ||
        oldWidget.shimmergradient != shimmergradient ||
        oldWidget.buildShimmer != buildShimmer ||
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
  final String loadFailedText;
  @override
  final String noMoreText;
  @override
  final String loadMoreText;
  @override
  final EdgeInsetsGeometry? padding;
  @override
  final bool reverse;
  @override
  final Widget Function(int index)? buildShimmer;
  @override
  final LinearGradient? shimmergradient;
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
  final int pageSize;
  const _ReadyListConfigOptionsDefauls({
    required this.placeholdersConfig,
    required this.showNoMoreText,
    required this.topLevelFooterSlivers,
    required this.topLevelHeaderSlivers,
    required this.allowRefresh,
    required this.allowLoadNext,
    required this.loadFailedText,
    required this.noMoreText,
    required this.loadMoreText,
    required this.padding,
    required this.reverse,
    required this.buildShimmer,
    required this.shimmergradient,
    required this.shrinkWrap,
    required this.axis,
    required this.physics,
    required this.pageSize,
  });

  static _ReadyListConfigOptionsDefauls effective(ReadyListConfigOptions? options, BuildContext context) {
    var tr = Ready.localization(context);
    var cofig = ReadyListConfig.of(context);
    return _ReadyListConfigOptionsDefauls(
      placeholdersConfig: options?.placeholdersConfig ?? cofig?.placeholdersConfig ?? PlaceholdersConfig(),
      topLevelFooterSlivers: options?.topLevelFooterSlivers ?? cofig?.topLevelFooterSlivers,
      topLevelHeaderSlivers: options?.topLevelHeaderSlivers ?? cofig?.topLevelHeaderSlivers,
      showNoMoreText: options?.showNoMoreText ?? cofig?.showNoMoreText ?? true,
      allowRefresh: options?.allowRefresh ?? cofig?.allowRefresh ?? true,
      allowLoadNext: options?.allowLoadNext ?? cofig?.allowLoadNext ?? true,
      loadFailedText: options?.loadFailedText ?? cofig?.loadFailedText ?? tr.loadFailed,
      noMoreText: options?.noMoreText ?? cofig?.noMoreText ?? tr.noMoreItems,
      loadMoreText: options?.loadMoreText ?? cofig?.loadMoreText ?? tr.loadMore,
      padding: options?.padding ?? cofig?.padding,
      reverse: options?.reverse ?? cofig?.reverse ?? false,
      buildShimmer: options?.buildShimmer ?? cofig?.buildShimmer,
      shimmergradient: options?.shimmergradient ?? cofig?.shimmergradient,
      shrinkWrap: options?.shrinkWrap ?? cofig?.shrinkWrap ?? (_) => false,
      axis: options?.axis ?? cofig?.axis ?? Axis.vertical,
      physics: options?.physics ?? cofig?.physics,
      pageSize: options?.pageSize ?? cofig?.pageSize ?? 20,
    );
  }
}
