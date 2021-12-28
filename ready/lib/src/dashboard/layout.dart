part of dashboard;

class ReadyDashboard extends StatefulWidget {
  final List<DashboardItem> items;
  final int? initialIndex;
  final DrawerOptions drawerOptions;
  final AppBarOptions appBarOptions;

  /// {@macro flutter.material.appbar.actions}
  ///
  /// This property is used to configure an [AppBar].
  final List<Widget> actions;
  ReadyDashboard({
    Key? key,
    required this.items,
    this.drawerOptions = const DrawerOptions(),
    this.initialIndex,
    this.appBarOptions = const AppBarOptions(),
    this.actions = const [],
  })  : assert(items.isNotEmpty),
        super(key: key);

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
        vsync: this, duration: const Duration(milliseconds: 250), value: 1.0);
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
            case LayoutType.xsmall:
            case LayoutType.small:
            case LayoutType.medium:
              small = true;
              break;
            case LayoutType.large:
            case LayoutType.xlarge:
            case LayoutType.xxlarge:
              small = false;
              break;
          }

          return Scaffold(
            drawer: small
                ? const _DashBoardDrawer(
                    drawerIcon: SizedBox(),
                  )
                : null,
            body: AnimatedBuilder(
                animation: expansionController,
                builder: (context, _) {
                  return Stack(
                    children: [
                      PositionedDirectional(
                        top: 0,
                        bottom: 0,
                        start: small ? 0 : 304 * expansionController.value,
                        end: 0,
                        child: NestedScrollView(
                          body: tabView(widgets),
                          headerSliverBuilder:
                              (BuildContext context, bool innerBoxIsScrolled) {
                            return [
                              SliverOverlapAbsorber(
                                handle: NestedScrollView
                                    .sliverOverlapAbsorberHandleFor(context),
                                sliver: _DashBoardAppBar(
                                  focusNode: _focusNode,
                                  mergeActions: layout == LayoutType.small ||
                                      layout == LayoutType.xsmall,
                                  drawerIcon:
                                      expansionController.value == 0 || small
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
                          start: 304 * expansionController.value - 304,
                          child: Material(
                            child: _DashBoardDrawer(
                              drawerIcon:
                                  _DrawerIcon(expansion: expansionController),
                            ),
                          ),
                        ),
                    ],
                  );
                }),
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
          titleSpanes: [
            if (parent != null) ...[
              parent,
              TextSpan(
                  text: ' / ',
                  style: TextStyle(color: Theme.of(context).disabledColor)),
            ],
            TextSpan(text: e.label),
          ],
          // titleSpanes[]: parentTitle == null ? e.label : '$parentTitle / ${e.label}',
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

  Widget tabView(List<Widget> widgets) {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      children: widgets,
    );
  }
}
