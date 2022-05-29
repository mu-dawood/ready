part of dashboard;

class DashboardItem {
  static Widget _sizedBox() => const SizedBox();

  final String id;
  final String label;
  final Widget icon;
  final Widget? selectedIcon;
  final Widget Function() builder;

  final void Function(String? value)? search;
  final AppBarOptions? appBarOptions;
  final List<DashboardItem> subItems;
  final NavigatorOptions? navigator;

  /// {@macro flutter.material.appBar.actions}
  ///
  /// This property is used to configure an [AppBar].
  final List<Widget> actions;

  final bool overrideActions;
  bool get hasBuilder => subItems.isEmpty;
  DashboardItem({
    required this.label,
    required this.id,
    required this.builder,
    required this.icon,
    this.appBarOptions,
    this.navigator,
    this.selectedIcon,
    this.search,
    this.overrideActions = false,
    this.actions = const [],
  }) : subItems = [];

  DashboardItem.items({
    required this.label,
    required this.icon,
    required this.subItems,
  })  : selectedIcon = null,
        appBarOptions = null,
        id = '',
        builder = _sizedBox,
        search = null,
        navigator = null,
        overrideActions = false,
        actions = const [];
}

class PageInfo extends StatefulWidget {
  final DashboardItem? _item;
  final List<TextSpan> titleSpans;
  final Widget? _child;
  const PageInfo({
    Key? key,
    required DashboardItem item,
    required this.titleSpans,
  })  : _child = null,
        _item = item,
        super(key: key);
  const PageInfo.child({
    Key? key,
    required Widget child,
    required this.titleSpans,
  })  : _child = child,
        _item = null,
        super(key: key);
  @override
  State<PageInfo> createState() => _PageInfoState();

  static PageInfo? of(BuildContext context) =>
      context.findAncestorStateOfType<_PageInfoState>()?.widget;
}

class _PageInfoState extends State<PageInfo> {
  GlobalKey<NavigatorState>? navigatorKey;
  @override
  void initState() {
    navigatorKey = widget._item?.navigator?.initState?.call();

    super.initState();
  }

  @override
  void dispose() {
    widget._item?.navigator?.dispose?.call();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var item = widget._item;
    if (item == null) {
      return widget._child ?? const SizedBox();
    }
    if (item.navigator != null) {
      return Navigator(
        onPopPage: item.navigator!.onPopPage ?? (route, result) => false,
        key: navigatorKey,
        pages: [
          MaterialPage(child: item.builder()),
          ...item.navigator!.pages,
        ],
      );
    } else {
      return item.builder();
    }
  }
}

class NavigatorItem {
  final String name;
  final Widget child;
  NavigatorItem({
    required this.name,
    required this.child,
  });
}
