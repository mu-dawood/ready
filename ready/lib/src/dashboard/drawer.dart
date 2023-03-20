part of dashboard;

class DrawerOptions {
  /// The color to fill in the background of the box.
  ///
  /// The color is filled into the [shape] of the box (e.g., either a rectangle,
  /// potentially with a [borderRadius], or a circle).
  ///
  /// This is ignored if [gradient] is non-null.
  ///
  /// The [backgroundColor] is drawn under the [image].
  final Color? backgroundColor;

  /// An image to paint above the background [color] or [gradient].
  ///
  /// If [shape] is [BoxShape.circle] then the image is clipped to the circle's
  /// boundary; if [borderRadius] is non-null then the image is clipped to the
  /// given radii.
  final DecorationImage? image;

  /// A gradient to use when filling the box.
  ///
  /// If this is specified, [color] has no effect.
  ///
  /// The [gradient] is drawn under the [image].
  final Gradient? gradient;

  /// drawer top header widgets
  final List<Widget> Function(AnimationController expansion)? headers;

  /// drawer footer widgets
  final List<Widget> Function(AnimationController expansion)? footer;

  /// override the default drawer icon
  final SliverPersistentHeaderDelegate Function(
      VoidCallback toggle, AnimationController expansion)? buildDrawer;

  final Widget Function(Widget child, bool collapsed)? buildDesktop;
  final Widget Function(Widget child)? buildMobile;
  const DrawerOptions({
    this.headers,
    this.footer,
    this.backgroundColor,
    this.image,
    this.gradient,
    this.buildDrawer,
    this.buildDesktop,
    this.buildMobile,
  });
}

class _DrawerIcon extends StatelessWidget {
  final AnimationController expansion;
  const _DrawerIcon({Key? key, required this.expansion}) : super(key: key);
  static void toggle(BuildContext context, AnimationController expansion) {
    var hasDrawer = Scaffold.maybeOf(context)?.hasDrawer == true;

    if (hasDrawer) {
      var isDrawerOpen = Scaffold.of(context).isDrawerOpen;
      if (!isDrawerOpen) {
        Scaffold.of(context).openDrawer();
      } else {
        Navigator.of(context).pop();
      }
    } else {
      if (expansion.value == 0 || expansion.value == 1) {
        if (expansion.value == 0) {
          expansion.animateTo(1.0);
        } else {
          expansion.animateTo(0.0);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var hasDrawer = Scaffold.maybeOf(context)?.hasDrawer == true;
    Widget child = Center(
      child: IconButton(
        onPressed: () => toggle(context, expansion),
        icon: AnimatedIcon(
          icon: hasDrawer ? AnimatedIcons.menu_close : AnimatedIcons.list_view,
          progress:
              Tween(begin: !hasDrawer ? 1.0 : 0.0, end: !hasDrawer ? 0.0 : 1.0)
                  .animate(expansion),
        ),
      ),
    );
    if (hasDrawer) return child;
    return CustomPaint(painter: _IconPaint(expansion, context), child: child);
  }
}

class _DashBoardDrawer extends StatefulWidget {
  final bool isDesktop;
  final bool collapsed;
  final DrawerOptions options;
  final AnimationController controller;
  const _DashBoardDrawer({
    Key? key,
    required this.isDesktop,
    required this.collapsed,
    required this.controller,
    required this.options,
  }) : super(key: key);

  @override
  State<_DashBoardDrawer> createState() => _DashBoardDrawerState();
}

class _DashBoardDrawerState extends State<_DashBoardDrawer> {
  @override
  Widget build(BuildContext context) {
    return _listView(context);
  }

  List<DashboardItem> expanded(List<DashboardItem> items) {
    return items
        .expand((element) =>
            element.subItems.isEmpty ? [element] : expanded(element.subItems))
        .toList();
  }

  Widget iconButton(BuildContext context, DashboardItem item,
      DashboardItem selected, List<DashboardItem> expanded) {
    var sel = item == selected;
    return Align(
      alignment: AlignmentGeometryTween(
        begin: AlignmentDirectional.centerStart,
        end: AlignmentDirectional.center,
      ).transform(widget.controller.value)!,
      child: IconButton(
        color: sel ? Theme.of(context).colorScheme.secondary : null,
        onPressed: () {
          DefaultTabController.maybeOf(context)?.index = expanded.indexOf(item);
          var hasDrawer = Scaffold.maybeOf(context)?.hasDrawer == true;
          var isDrawerOpen = hasDrawer && Scaffold.of(context).isDrawerOpen;
          if (isDrawerOpen) {
            Navigator.of(context).pop();
          }
        },
        icon: selected == item ? (item.selectedIcon ?? item.icon) : item.icon,
      ),
    );
  }

  Widget buildTile(
    DrawerOptions options,
    BuildContext context,
    DashboardItem item,
    DashboardItem selected,
    List<DashboardItem> exp,
  ) {
    if (item.hasBuilder) {
      return ListTile(
        onTap: () {
          DefaultTabController.maybeOf(context)?.index = exp.indexOf(item);
          var hasDrawer = Scaffold.maybeOf(context)?.hasDrawer == true;
          var isDrawerOpen = hasDrawer && Scaffold.of(context).isDrawerOpen;
          if (isDrawerOpen) {
            Navigator.of(context).pop();
          }
        },
        selected: item == selected,
        title: Text(item.label),
        leading:
            selected == item ? (item.selectedIcon ?? item.icon) : item.icon,
      );
    } else {
      var inner = expanded(item.subItems);
      return ExpansionTile(
        title: Text(item.label),
        maintainState: true,
        initiallyExpanded: inner.any((element) => element == selected),
        leading: item.icon,
        children: [
          for (var sub in item.subItems)
            buildTile(options, context, sub, selected, exp),
        ],
      );
    }
  }

  Widget _tileListView(
      BuildContext context, List<DashboardItem> items, DrawerOptions options) {
    var exp = expanded(items);
    return TabControllerBuilder(
      builder: (int index) {
        var selectedItem = exp[index];
        if (options.buildDesktop != null && widget.isDesktop) {
          return options.buildDesktop!(
              _buildScroll(options, context, exp, selectedItem, items),
              widget.collapsed);
        }
        if (options.buildMobile != null && !widget.isDesktop) {
          return options.buildMobile!(
              _buildScroll(options, context, exp, selectedItem, items));
        }
        return Drawer(
          backgroundColor: options.backgroundColor,
          child: Container(
            decoration: BoxDecoration(
              color: options.backgroundColor,
              image: options.image,
              gradient: options.gradient,
            ),
            child: _buildScroll(options, context, exp, selectedItem, items),
          ),
        );
      },
    );
  }

  CustomScrollView _buildScroll(
    DrawerOptions options,
    BuildContext context,
    List<DashboardItem> expanded,
    DashboardItem selectedItem,
    List<DashboardItem> items,
  ) {
    return CustomScrollView(
      slivers: [
        SliverSafeArea(
          bottom: false,
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                if (options.headers != null)
                  ...options.headers!(widget.controller),
                if (widget.collapsed)
                  for (var item in expanded)
                    iconButton(context, item, selectedItem, expanded)
                else
                  for (var item in items)
                    buildTile(options, context, item, selectedItem, expanded),
              ],
            ),
          ),
        ),
        if (options.footer != null)
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: options.footer!(widget.controller),
            ),
          )
      ],
    );
  }

  Widget _listView(BuildContext context) {
    var dashboard = ReadyDashboard.of(context);
    var items = dashboard.widget.items;
    assert(items.isNotEmpty);
    return _tileListView(context, items, widget.options);
  }
}

class _IconPaint extends CustomPainter {
  final AnimationController expansion;
  final BuildContext context;
  _IconPaint(this.expansion, this.context) : super(repaint: expansion);
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();

    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width / 2, size.height);

    path.arcToPoint(
      Offset(size.width / 2, 0),
      radius: Radius.circular(size.width / 2),
      largeArc: true,
      clockwise: true,
    );
    path.close();
    var isRtl = Directionality.of(context) == TextDirection.rtl;
    if (!isRtl) {
      canvas.scale(-1, 1);
      canvas.translate(-size.width, 0);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
