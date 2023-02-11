part of dashboard;

class ReadyDashboard extends StatefulWidget {
  final List<DashboardItem> items;
  final int? initialIndex;
  final DrawerOptions Function(bool phone) drawerOptions;
  final AppBarOptions Function(bool phone) appBarOptions;
  final EdgeInsetsGeometry Function(bool phone) padding;
  final bool Function(bool phone) wrapPageWithCard;
  final bool iconsWhenCollapsedInDesktop;
  final ValueChanged<String>? onPageChanged;

  /// if passed will add a navigator around the entire dashboard
  final NavigatorOptions? navigator;

  /// {@macro flutter.material.appBar.actions}
  ///
  /// This property is used to configure an [AppBar].
  final List<Widget> actions;
  ReadyDashboard({
    Key? key,
    required this.items,
    this.drawerOptions = _drawerOptions,
    this.initialIndex,
    this.padding = _padding,
    this.appBarOptions = _appBarOptions,
    this.wrapPageWithCard = _wrapPageWithCard,
    this.iconsWhenCollapsedInDesktop = false,
    this.navigator,
    this.onPageChanged,
    this.actions = const [],
  })  : assert(items.isNotEmpty),
        super(key: key);

  static DrawerOptions _drawerOptions(bool phone) => const DrawerOptions();
  static EdgeInsetsGeometry _padding(bool phone) => EdgeInsets.zero;
  static AppBarOptions _appBarOptions(bool phone) => const AppBarOptions();
  static bool _wrapPageWithCard(bool phone) => false;
  static Widget createPage({
    required BuildContext context,
    required Widget child,
    List<TextSpan> titleSpan = const [],
  }) {
    var dashboard = context.findAncestorStateOfType<_ReadyDashboardState>()!;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return dashboard._buildChild(
            PageInfo.child(
              titleSpans: titleSpan,
              child: child,
            ),
            dashboard._isSmall(constraints.maxWidth));
      },
    );
  }

  @override
  State<ReadyDashboard> createState() => _ReadyDashboardState();

  static ReadyDashboard? of(BuildContext context) =>
      context.findAncestorStateOfType<_ReadyDashboardState>()?.widget;
}

class _ReadyDashboardState extends State<ReadyDashboard>
    with TickerProviderStateMixin {
  late AnimationController expansionController;
  late FocusNode _focusNode;
  @override
  void initState() {
    _focusNode = FocusNode();
    expansionController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
      value: 0.0,
    );
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    expansionController.dispose();
    super.dispose();
  }

  bool _isSmall(double width) {
    var layout = Utils.detectLayout(width);
    late bool small;
    switch (layout) {
      case LayoutType.xSmall:
      case LayoutType.small:
      case LayoutType.medium:
        small = true;
        break;
      case LayoutType.large:
      case LayoutType.xLarge:
      case LayoutType.xxLarge:
        small = false;
        break;
    }
    return small;
  }

  @override
  Widget build(BuildContext context) {
    var widgets = <PageInfo>[
      for (var item in widget.items) ...children(item),
    ];
    return DefaultTabController(
      length: widgets.length,
      initialIndex: widget.initialIndex ?? 0,
      child: TabControllerListener(
        onPageChanged: (int index) {
          widget.onPageChanged?.call(widgets[index]._item!.id);
        },
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            var width = constraints.maxWidth;
            if (width == double.infinity) {
              width = MediaQuery.of(context).size.width;
            }
            var layout = Utils.detectLayout(width);

            var small = _isSmall(width);
            bool iconsWhenCollapsed = widget.iconsWhenCollapsedInDesktop;
            return Scaffold(
              drawer: small
                  ? _DashBoardDrawer(
                      isDesktop: false,
                      controller: expansionController,
                      collapsed: false,
                      options: widget.drawerOptions(small),
                    )
                  : null,
              body: Padding(
                padding: widget.padding(small),
                child: AnimatedBuilder(
                    animation: expansionController,
                    builder: (context, _) {
                      return Stack(
                        children: [
                          PositionedDirectional(
                            top: 0,
                            bottom: 0,
                            start: Tween<double>(
                              begin: small ? 0 : 300,
                              end: iconsWhenCollapsed ? 75 : 0,
                            ).transform(expansionController.value),
                            end: 0,
                            child: NestedScrollView(
                              body: tabView(widgets, small),
                              headerSliverBuilder: (BuildContext context,
                                  bool innerBoxIsScrolled) {
                                return [
                                  SliverOverlapAbsorber(
                                    handle: NestedScrollView
                                        .sliverOverlapAbsorberHandleFor(
                                            context),
                                    sliver: _DashBoardAppBar(
                                      focusNode: _focusNode,
                                      drawerOptions:
                                          widget.drawerOptions(small),
                                      appBarOptions:
                                          widget.appBarOptions(small),
                                      mergeActions:
                                          layout == LayoutType.small ||
                                              layout == LayoutType.xSmall,
                                      drawerIcon: (expansionController.value ==
                                                      1 &&
                                                  !iconsWhenCollapsed) ||
                                              small
                                          ? _DrawerIcon(
                                              expansion: expansionController)
                                          : null,
                                      innerBoxIsScrolled: innerBoxIsScrolled,
                                    ),
                                  )
                                ];
                              },
                            ),
                          ),
                          if (!small)
                            PositionedDirectional(
                              top: 0,
                              bottom: 0,
                              width: Tween(
                                begin: 300.0,
                                end: !iconsWhenCollapsed ? 300.0 : 75.0,
                              ).transform(expansionController.value),
                              start: Tween(
                                begin: 0.0,
                                end: !iconsWhenCollapsed ? -300.0 : 0.0,
                              ).transform(expansionController.value),
                              child: Material(
                                child: _DashBoardDrawer(
                                  controller: expansionController,
                                  isDesktop: true,
                                  options: widget.drawerOptions(small),
                                  collapsed: iconsWhenCollapsed
                                      ? (expansionController.value == 1.0 ||
                                          expansionController.status ==
                                              AnimationStatus.forward)
                                      : false,
                                ),
                              ),
                            ),
                        ],
                      );
                    }),
              ),
            );
          },
        ),
      ),
    );
  }

  bool checkSelected(String base, String fragment) {
    return base == fragment;
  }

  List<PageInfo> children(DashboardItem e, [TextSpan? parent]) {
    if (e.hasBuilder) {
      return [
        PageInfo(
          item: e,
          navigator: widget.navigator,
          titleSpans: [
            if (parent != null) ...[
              parent,
              TextSpan(
                  text: ' / ',
                  style: TextStyle(color: Theme.of(context).disabledColor)),
            ],
            TextSpan(text: e.label),
          ],
        ),
      ];
    } else {
      return e.subItems
          .map((p) => children(p, TextSpan(text: e.label)))
          .expand((element) => element)
          .toList();
    }
  }

  Widget _buildChild(Widget child, bool small) {
    if (small || !widget.wrapPageWithCard(small)) return child;

    return Card(
      margin: const EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: child,
      ),
    );
  }

  Widget tabView(List<Widget> widgets, bool small) {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      children: widgets.map<Widget>((e) => _buildChild(e, small)).toList(),
    );
  }
}

class NavigatorOptions {
  final bool reportsRouteUpdateToEngine;
  final List<NavigatorObserver> observers;
  final GlobalKey<NavigatorState> Function(String id)? getNavigatorKey;
  final bool Function(String id, Route<dynamic>, dynamic)? onPopPage;
  final Function(String id)? dispose;

  NavigatorOptions({
    this.reportsRouteUpdateToEngine = false,
    this.observers = const [],
    this.getNavigatorKey,
    this.onPopPage,
    this.dispose,
  });
}
