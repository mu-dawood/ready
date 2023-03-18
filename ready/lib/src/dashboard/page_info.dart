part of dashboard;

class _PageInfo extends StatefulWidget {
  final int index;
  final DashboardItem item;
  final List<TextSpan> titleSpans;
  final NavigatorOptions navigator;

  const _PageInfo({
    Key? key,
    required this.index,
    required this.item,
    required this.titleSpans,
    required this.navigator,
  }) : super(key: key);

  @override
  State<_PageInfo> createState() => __PageInfoState();
}

class __PageInfoState extends State<_PageInfo> {
  final RouteObserver<ModalRoute> _routeObserver = RouteObserver<ModalRoute>();
  late ReadyDashboardState layout;
  late TabController tabController;
  GlobalKey<NavigatorState>? _navKey;
  GlobalKey<NavigatorState> get _navigatorKey =>
      _navKey ??= GlobalKey<NavigatorState>();
  NavigatorState? get _navigator => _navigatorKey.currentState;

  bool get canPop => _navigator?.canPop() ?? false;
  Future<bool> mayBePop() {
    var state = _navigator ?? Navigator.of(context);
    return state.maybePop();
  }

  Future<T?> pushNewPage<T>({
    required WidgetBuilder builder,
    required List<TextSpan> titleSpans,
  }) async {
    var state = _navigator ?? Navigator.of(context);
    var result = await state.push<T>(MaterialPageRoute(
      builder: (context) {
        return PageInfo._createPage(
          state: state,
          titleSpans: titleSpans,
          builder: builder,
          observer: _routeObserver,
          layout: layout,
          info: widget,
        );
      },
    ));
    return result;
  }

  void _onPageChanged() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted &&
          layout._currentPage.value != this &&
          tabController.index == widget.index) {
        layout._currentPage.value = this;
      }
    });
  }

  @override
  void didChangeDependencies() {
    layout = ReadyDashboard.of(context);
    tabController = DefaultTabController.of(context);

    _navKey = widget.item.navigatorKey;
    tabController.addListener(_onPageChanged);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var item = widget.item;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && tabController.index == widget.index) {
        layout._currentPage.value = this;
      }
    });

    var child = PageInfo._(
      item: item,
      observer: _routeObserver,
      titleSpans: widget.titleSpans,
      builder: (BuildContext context) => item.builder({}),
    );
    return RepaintBoundary(
      child: Navigator(
        reportsRouteUpdateToEngine: widget.navigator.reportsRouteUpdateToEngine,
        observers: [_routeObserver, ...widget.navigator.observers],
        key: _navigatorKey,
        onPopPage: widget.navigator.onPopPage,
        pages: [
          MaterialPage(child: child),
        ],
      ),
    );
  }
}

class PageInfo extends StatefulWidget {
  final DashboardItem item;
  final List<TextSpan> titleSpans;
  final WidgetBuilder builder;
  final RouteObserver<ModalRoute> observer;
  const PageInfo._({
    required this.item,
    required this.titleSpans,
    required this.builder,
    required this.observer,
  });

  @override
  State<PageInfo> createState() => PageInfoState();

  static PageInfoState? mayBeOf(BuildContext context) =>
      context.findAncestorStateOfType<PageInfoState>();
  static PageInfoState of(BuildContext context) =>
      context.findAncestorStateOfType<PageInfoState>()!;

  static Widget insureValid(
    BuildContext context,
    WidgetBuilder builder,
  ) {
    var parent = mayBeOf(context);
    if (parent != null) return builder(context);
    var info = context.findAncestorStateOfType<__PageInfoState>();
    if (info == null) return builder(context);
    var state = info._navigator ?? Navigator.of(context);

    return _createPage(
      layout: info.layout,
      observer: info._routeObserver,
      info: info.widget,
      state: state,
      titleSpans: [],
      builder: builder,
    );
  }

  static LayoutBuilder _createPage({
    required ReadyDashboardState layout,
    required RouteObserver<ModalRoute<dynamic>> observer,
    required _PageInfo info,
    required NavigatorState state,
    required List<TextSpan> titleSpans,
    required WidgetBuilder builder,
  }) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return layout._buildChild(
            PageInfo._(
              observer: observer,
              item: info.item,
              titleSpans: [
                ...info.titleSpans,
                for (var item in titleSpans) ...[
                  TextSpan(
                      text: ' / ',
                      style: TextStyle(color: Theme.of(context).disabledColor)),
                  item
                ]
              ],
              builder: builder,
            ),
            layout._isSmall(constraints.maxWidth));
      },
    );
  }
}

class PageInfoState extends State<PageInfo> {
  Future<T?> pushNewPage<T>({
    required WidgetBuilder builder,
    required List<TextSpan> titleSpans,
  }) async {
    return context
        .findAncestorStateOfType<__PageInfoState>()!
        .pushNewPage(builder: builder, titleSpans: titleSpans);
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}
