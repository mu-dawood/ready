part of dashboard;

class ReadyDashboard extends StatefulWidget {
  final List<DashboardItem> items;
  final int? initialIndex;
  final DrawerOptions Function(bool phone) drawerOptions;
  final AppBarOptions Function(bool phone) appBarOptions;
  final EdgeInsetsGeometry Function(bool phone) padding;
  final bool Function(bool phone) wrapPageWithCard;
  final bool iconsWhenCollapsedInDesktop;

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
    this.actions = const [],
  })  : assert(items.isNotEmpty),
        super(key: key);

  static DrawerOptions _drawerOptions(bool phone) => const DrawerOptions();
  static EdgeInsetsGeometry _padding(bool phone) => EdgeInsets.zero;
  static AppBarOptions _appBarOptions(bool phone) => const AppBarOptions();
  static bool _wrapPageWithCard(bool phone) => false;
  @override
  _ReadyDashboardState createState() => _ReadyDashboardState();

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

  @override
  Widget build(BuildContext context) {
    var widgets = <Widget>[
      for (var item in widget.items) ...children(item),
    ];
    return DefaultTabController(
      length: widgets.length,
      initialIndex: widget.initialIndex ?? 0,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          var width = constraints.maxWidth;
          if (width == double.infinity) {
            width = MediaQuery.of(context).size.width;
          }
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
                                      .sliverOverlapAbsorberHandleFor(context),
                                  sliver: _DashBoardAppBar(
                                    focusNode: _focusNode,
                                    drawerOptions: widget.drawerOptions(small),
                                    appBarOptions: widget.appBarOptions(small),
                                    mergeActions: layout == LayoutType.small ||
                                        layout == LayoutType.xSmall,
                                    drawerIcon:
                                        (expansionController.value == 0 &&
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
    );
  }

  bool checkSelected(String base, String fragment) {
    return base == fragment;
  }

  List<Widget> children(DashboardItem e, [TextSpan? parent]) {
    if (e.builder != null) {
      return [
        PageInfo(
          item: e,
          titleSpans: [
            if (parent != null) ...[
              parent,
              TextSpan(
                  text: ' / ',
                  style: TextStyle(color: Theme.of(context).disabledColor)),
            ],
            TextSpan(text: e.label),
          ],
          // titleSpans[]: parentTitle == null ? e.label : '$parentTitle / ${e.label}',
          child: e.builder!(),
        ),
      ];
    } else {
      return e.subItems
          .map((p) => children(p, TextSpan(text: e.label)))
          .expand((element) => element)
          .toList();
    }
  }

  Widget tabView(List<Widget> widgets, bool small) {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      children: small || !widget.wrapPageWithCard(small)
          ? widgets
          : widgets
              .map((e) => Card(
                    margin: const EdgeInsets.only(top: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: e,
                    ),
                  ))
              .toList(),
    );
  }
}
