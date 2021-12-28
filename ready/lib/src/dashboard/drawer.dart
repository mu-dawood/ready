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

  const DrawerOptions({
    this.headers = const [],
    this.footer,
    this.backgroundColor,
    this.image,
    this.gradient,
    this.logo,
  });
}

class _DrawerIcon extends StatelessWidget {
  final AnimationController expansion;
  const _DrawerIcon({Key? key, required this.expansion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hasDrawer = Scaffold.maybeOf(context)?.hasDrawer == true;

    return IconButton(
      onPressed: () {
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
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress:
            Tween(begin: hasDrawer ? 1.0 : 0.0, end: hasDrawer ? 0.0 : 1.0)
                .animate(expansion),
      ),
    );
  }
}

class _DashBoardDrawer extends StatefulWidget {
  final Widget drawerIcon;
  const _DashBoardDrawer({
    Key? key,
    required this.drawerIcon,
  }) : super(key: key);

  @override
  State<_DashBoardDrawer> createState() => _DashBoardDrawerState();
}

class _DashBoardDrawerState extends State<_DashBoardDrawer> {
  @override
  Widget build(BuildContext context) {
    return _listView(context);
  }

  List<DashboardItem> expaded(List<DashboardItem> items) {
    return items
        .expand((element) =>
            element.subItems.isEmpty ? [element] : expaded(element.subItems))
        .toList();
  }

  Widget buildTile(BuildContext context, DashboardItem item,
      DashboardItem selected, List<DashboardItem> expanded) {
    if (item.builder != null) {
      var child = ListTile(
        onTap: () {
          DefaultTabController.of(context)?.index = expanded.indexOf(item);
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
      return child;
    } else {
      var inner = expaded(item.subItems);
      return ExpansionTile(
        title: Text(item.label),
        maintainState: true,
        initiallyExpanded: inner.any((element) => element == selected),
        leading: item.icon,
        children: [
          for (var sub in item.subItems)
            buildTile(context, sub, selected, expanded),
        ],
      );
    }
  }

  Widget _tilelistView(
      BuildContext context, List<DashboardItem> items, DrawerOptions options) {
    var expanded = expaded(items);
    return TabControllerLisner(
      builder: (int index) {
        var selectedItem = expanded[index];
        return Drawer(
          backgroundColor: options.backgroundColor,
          child: Container(
            decoration: BoxDecoration(
              color: options.backgroundColor,
              image: options.image,
              gradient: options.gradient,
            ),
            child: CustomScrollView(
              // padding: const EdgeInsets.only(bottom: 15),
              slivers: [
                SliverPersistentHeader(
                  delegate: _DrawerHeader(
                    logo: options.logo,
                    statusBar: MediaQuery.of(context).padding.top,
                    drawerIcon: widget.drawerIcon,
                  ),
                ),
                const SliverToBoxAdapter(child: Divider()),
                SliverList(
                    delegate: SliverChildListDelegate([
                  ...options.headers,
                  for (var item in items)
                    buildTile(context, item, selectedItem, expanded),
                ])),
                if (options.footer != null)
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: options.footer,
                  )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _listView(BuildContext context) {
    var dashboard = ReadyDashboard.of(context)!;
    var items = dashboard.items;
    assert(items.isNotEmpty);
    return _tilelistView(context, items, dashboard.drawerOptions);
  }
}

class _DrawerHeader extends SliverPersistentHeaderDelegate {
  final Widget? logo;
  final Widget drawerIcon;
  final double statusBar;

  _DrawerHeader({
    this.logo,
    required this.drawerIcon,
    required this.statusBar,
  });
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: logo,
            ),
          ),
          const SizedBox(width: 10),
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
    return false;
  }
}
