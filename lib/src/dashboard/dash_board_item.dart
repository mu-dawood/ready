part of dashboard;

class DashboardItem {
  final String id;
  final String label;
  final Widget icon;
  final Widget? selectedIcon;
  final Widget Function()? builder;
  final void Function(String? value)? search;
  final AppBarOptions? appBarOptions;
  final List<DashboardItem> subItems;

  /// {@macro flutter.material.appbar.actions}
  ///
  /// This property is used to configure an [AppBar].
  final List<Widget> actions;

  final bool overrideActions;

  DashboardItem({
    required this.label,
    required this.id,
    required this.builder,
    required this.icon,
    this.appBarOptions,
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
        search = null,
        overrideActions = false,
        actions = const [],
        builder = null;
}

class PageInfo extends StatefulWidget {
  final DashboardItem item;
  final List<TextSpan> titleSpanes;
  final Widget child;

  const PageInfo(
      {Key? key,
      required this.item,
      required this.child,
      required this.titleSpanes})
      : super(key: key);
  @override
  _PageInfoState createState() => _PageInfoState();

  static PageInfo? of(BuildContext context) =>
      context.findAncestorStateOfType<_PageInfoState>()?.widget;
}

class _PageInfoState extends State<PageInfo> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
