part of dashboard;

enum _PermissionType { onlyAdmin, allowAnonymous, supervisors }

class Authorization {
  final List<String> _permissions;
  final _PermissionType _type;

  const Authorization.onlyAdmin()
      : _type = _PermissionType.onlyAdmin,
        _permissions = const [];
  const Authorization.allowAnonymous()
      : _type = _PermissionType.allowAnonymous,
        _permissions = const [];

  const Authorization.supervisors(List<String> permissions)
      : _type = _PermissionType.supervisors,
        assert(permissions.length > 0),
        _permissions = permissions;
}

class DashboardItem {
  static Widget _sizedBox(Map<String, dynamic> parameters) => const SizedBox();
  final Authorization authorization;
  final String id;
  final String label;
  final Widget icon;
  final Widget? selectedIcon;
  final Widget Function(Map<String, dynamic> parameters) builder;

  final void Function(BuildContext context, String? value)? search;
  final AppBarOptions? appBarOptions;
  final List<DashboardItem> subItems;

  /// {@macro flutter.material.appBar.actions}
  ///
  /// This property is used to configure an [AppBar].
  final List<Widget> actions;

  final bool overrideActions;
  bool get hasBuilder => subItems.isEmpty;
  DashboardItem._({
    required this.label,
    required this.id,
    required this.builder,
    required this.icon,
    required this.appBarOptions,
    required this.selectedIcon,
    required this.search,
    required this.overrideActions,
    required this.actions,
    required this.authorization,
    required this.subItems,
  });

  /// if authorization not specified permissions will be set as id
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
    Authorization? authorization,
  })  : subItems = [],
        authorization = authorization ?? Authorization.supervisors([id]);

  DashboardItem.items({
    required this.label,
    required this.icon,
    required this.subItems,
    this.authorization = const Authorization.allowAnonymous(),
  })  : selectedIcon = null,
        appBarOptions = null,
        id = '',
        builder = _sizedBox,
        search = null,
        overrideActions = false,
        actions = const [];

  DashboardItem _copyWith({
    Authorization? authorization,
    String? id,
    String? label,
    Widget? icon,
    Widget? selectedIcon,
    Widget Function(Map<String, dynamic> parameters)? builder,
    void Function(BuildContext context, String? value)? search,
    AppBarOptions? appBarOptions,
    List<DashboardItem>? subItems,
    List<Widget>? actions,
    bool? overrideActions,
  }) {
    return DashboardItem._(
      authorization: authorization ?? this.authorization,
      id: id ?? this.id,
      label: label ?? this.label,
      icon: icon ?? this.icon,
      selectedIcon: selectedIcon ?? this.selectedIcon,
      builder: builder ?? this.builder,
      search: search ?? this.search,
      appBarOptions: appBarOptions ?? this.appBarOptions,
      subItems: subItems ?? this.subItems,
      actions: actions ?? this.actions,
      overrideActions: overrideActions ?? this.overrideActions,
    );
  }
}

class PageInfo extends StatefulWidget {
  final DashboardItem? _item;
  final List<TextSpan> titleSpans;
  final Widget? _child;
  final NavigatorOptions? navigator;
  const PageInfo({
    Key? key,
    required DashboardItem item,
    required this.titleSpans,
    required this.navigator,
  })  : _child = null,
        _item = item,
        super(key: key);
  const PageInfo.child({
    Key? key,
    required Widget child,
    required this.titleSpans,
  })  : _child = child,
        _item = null,
        navigator = null,
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
    navigatorKey = widget.navigator?.getNavigatorKey?.call(widget._item!.id);

    super.initState();
  }

  @override
  void dispose() {
    widget.navigator?.dispose?.call(widget._item!.id);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var item = widget._item;
    if (item == null) {
      return widget._child ?? const SizedBox();
    }
    if (widget.navigator != null) {
      return Navigator(
        onPopPage: (route, result) =>
            widget.navigator!.onPopPage?.call(item.id, route, result) ?? true,
        key: navigatorKey,
        pages: [MaterialPage(child: item.builder({}))],
      );
    } else {
      return item.builder({});
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
