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
  final ValueNotifier<List<Widget>> _actions = ValueNotifier<List<Widget>>([]);
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
        return _createPage(
          state: state,
          titleSpans: titleSpans,
          builder: builder,
        );
      },
    ));
    return result;
  }

  LayoutBuilder _createPage({
    required NavigatorState state,
    required List<TextSpan> titleSpans,
    required WidgetBuilder builder,
  }) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return layout._buildChild(
            PageInfo._(
              observer: _routeObserver,
              item: widget.item,
              titleSpans: [
                ...widget.titleSpans,
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

  void setAppBarActions(List<Widget> actions) {
    if (SchedulerBinding.instance.schedulerPhase != SchedulerPhase.idle) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _actions.value = actions.map((e) => e).toList();
      });
    } else {
      _actions.value = actions.map((e) => e).toList();
    }
  }

  void clearActions() {
    if (SchedulerBinding.instance.schedulerPhase != SchedulerPhase.idle) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _actions.value = [];
      });
    } else {
      _actions.value = [];
    }
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
}

class PageInfoState extends State<PageInfo> with RouteAware {
  List<Widget> get actions => child?.getAppBarActions() ?? [];
  late __PageInfoState _state;
  PageInfoAware? child;
  @override
  void didPopNext() {
    _state.setAppBarActions(actions);
  }

  @override
  void didPushNext() {
    _state.setAppBarActions([]);
  }

  void clearActions() {
    _state.clearActions();
  }

  void setAwareWidget(PageInfoAware child) {
    if (child != this.child) {
      this.child = child;
      _state.setAppBarActions(actions);
    }
  }

  void removeAwareWidget(PageInfoAware child) {
    if (child == this.child) {
      this.child = null;
    }
  }

  Future<T?> pushNewPage<T>({
    required WidgetBuilder builder,
    required List<TextSpan> titleSpans,
  }) async {
    return context
        .findAncestorStateOfType<__PageInfoState>()!
        .pushNewPage(builder: builder, titleSpans: titleSpans);
  }

  @override
  void didChangeDependencies() {
    _state = context.findAncestorStateOfType<__PageInfoState>()!;
    widget.observer.subscribe(this, ModalRoute.of(context)!);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}

mixin PageInfoAware<T extends StatefulWidget> on State<T> {
  PageInfoState? pagInfoState;
  List<Widget> getAppBarActions();

  @override
  void didChangeDependencies() {
    pagInfoState = PageInfo.mayBeOf(context);
    pagInfoState?.setAwareWidget(this);
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant oldWidget) {
    pagInfoState = PageInfo.mayBeOf(context);
    pagInfoState?.setAwareWidget(this);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    pagInfoState?.removeAwareWidget(this);
    super.dispose();
  }
}
