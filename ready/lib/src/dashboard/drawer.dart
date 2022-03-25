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
  final List<Widget> headers;

  /// drawer footer widgets
  final Widget? footer;

  /// The logo at the top
  final Widget? logo;

  /// override the default drawer icon
  final Widget Function(VoidCallback toggle, AnimationController expansion)?
      buildDrawerIcon;

  final bool showDivider;

  /// override the default drawer icon
  final SliverPersistentHeaderDelegate Function(
      VoidCallback toggle, AnimationController expansion)? buildHeader;

  /// override the default drawer icon
  final SliverPersistentHeaderDelegate Function(
      VoidCallback toggle, AnimationController expansion)? buildDrawer;

  final Widget Function(Widget child, bool collapsed)? buildDesktop;
  final Widget Function(Widget child)? buildMobile;
  const DrawerOptions({
    this.headers = const [],
    this.footer,
    this.backgroundColor,
    this.image,
    this.gradient,
    this.logo,
    this.buildDrawerIcon,
    this.buildHeader,
    this.showDivider = true,
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

    return IconButton(
      onPressed: () => toggle(context, expansion),
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_close,
        progress:
            Tween(begin: !hasDrawer ? 1.0 : 0.0, end: !hasDrawer ? 0.0 : 1.0)
                .animate(expansion),
      ),
    );
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
      DashboardItem selected, List<DashboardItem> _expanded) {
    var _selected = item == selected;
    return Align(
      alignment: AlignmentGeometryTween(
        begin: AlignmentDirectional.centerStart,
        end: AlignmentDirectional.center,
      ).transform(widget.controller.value)!,
      child: IconButton(
        color: _selected ? Theme.of(context).colorScheme.secondary : null,
        onPressed: () {
          DefaultTabController.of(context)?.index = _expanded.indexOf(item);
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
      List<DashboardItem> _expanded) {
    if (item.builder != null) {
      return ListTile(
        onTap: () {
          DefaultTabController.of(context)?.index = _expanded.indexOf(item);
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
            buildTile(options, context, sub, selected, _expanded),
        ],
      );
    }
  }

  Widget _tileListView(
      BuildContext context, List<DashboardItem> items, DrawerOptions options) {
    var _expanded = expanded(items);
    return TabControllerListener(
      builder: (int index) {
        var selectedItem = _expanded[index];
        if (options.buildDesktop != null && widget.isDesktop) {
          return options.buildDesktop!(
              _buildScroll(options, context, _expanded, selectedItem, items),
              widget.collapsed);
        }
        if (options.buildMobile != null && !widget.isDesktop) {
          return options.buildMobile!(
              _buildScroll(options, context, _expanded, selectedItem, items));
        }
        return Drawer(
          backgroundColor: options.backgroundColor,
          child: Container(
            decoration: BoxDecoration(
              color: options.backgroundColor,
              image: options.image,
              gradient: options.gradient,
            ),
            child:
                _buildScroll(options, context, _expanded, selectedItem, items),
          ),
        );
      },
    );
  }

  CustomScrollView _buildScroll(
      DrawerOptions options,
      BuildContext context,
      List<DashboardItem> _expanded,
      DashboardItem selectedItem,
      List<DashboardItem> items) {
    return CustomScrollView(
      // padding: const EdgeInsets.only(bottom: 15),
      slivers: [
        SliverPersistentHeader(
          delegate: options.buildHeader?.call(() {
                _DrawerIcon.toggle(context, widget.controller);
              }, widget.controller) ??
              _DrawerHeader(
                logo: options.logo,
                duration: widget.controller.duration!,
                collapsed: widget.collapsed,
                statusBar: MediaQuery.of(context).padding.top,
                drawerIcon: !widget.isDesktop
                    ? const SizedBox()
                    : options.buildDrawerIcon?.call(() {
                          _DrawerIcon.toggle(context, widget.controller);
                        }, widget.controller) ??
                        _DrawerIcon(expansion: widget.controller),
              ),
        ),
        if (options.showDivider) const SliverToBoxAdapter(child: Divider()),
        SliverList(
            delegate: SliverChildListDelegate([
          ...options.headers,
          if (widget.collapsed)
            for (var item in _expanded)
              iconButton(context, item, selectedItem, _expanded)
          else
            for (var item in items)
              buildTile(options, context, item, selectedItem, _expanded),
        ])),
        if (options.footer != null)
          SliverFillRemaining(
            hasScrollBody: false,
            child: options.footer,
          )
      ],
    );
  }

  Widget _listView(BuildContext context) {
    var dashboard = ReadyDashboard.of(context)!;
    var items = dashboard.items;
    assert(items.isNotEmpty);
    return _tileListView(context, items, widget.options);
  }
}

class _DrawerHeader extends SliverPersistentHeaderDelegate {
  final Widget? logo;
  final Widget drawerIcon;
  final double statusBar;
  final bool collapsed;
  final Duration duration;

  _DrawerHeader({
    this.logo,
    required this.drawerIcon,
    required this.statusBar,
    required this.collapsed,
    required this.duration,
  });
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (!collapsed) ...[
            Expanded(
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: logo,
              ),
            ),
            const SizedBox(width: 10),
          ],
          drawerIcon,
        ],
      ),
    );
  }

  @override
  double get maxExtent => kToolbarHeight + statusBar;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
