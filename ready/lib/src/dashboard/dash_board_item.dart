part of dashboard;

enum UserType {
  anonymous,
  user,
  supervisor,
  admin,
}

class Authorization extends Equatable {
  /// if true it will inherit all types of the parent item if exists
  final bool inherit;
  final List<AccessType> types;
  const Authorization({this.inherit = true, required this.types});

  @override
  List<Object?> get props => [inherit, types];
}

class AccessType extends Equatable {
  final List<String> permissions;
  final UserType type;
  const AccessType.any()
      : type = UserType.anonymous,
        permissions = const [];

  const AccessType.user()
      : type = UserType.user,
        permissions = const [];

  const AccessType.admin()
      : type = UserType.admin,
        permissions = const [];

  const AccessType.supervisor(this.permissions)
      : type = UserType.supervisor,
        assert(permissions.length > 0);

  @override
  List<Object?> get props => [permissions, type];
}

class DashboardItem {
  static Widget _sizedBox(Map<String, dynamic> parameters) => const SizedBox();
  final Authorization authorization;
  final String id;
  final String label;
  final Widget icon;
  final Widget? selectedIcon;
  final Widget Function(Map<String, dynamic> parameters) builder;

  final SearchArgs? search;
  final AppBarOptions? appBarOptions;
  final List<DashboardItem> subItems;

  /// {@macro flutter.material.appBar.actions}
  ///
  /// This property is used to configure an [AppBar].
  final List<Widget> actions;

  final bool overrideActions;
  final GlobalKey<NavigatorState>? navigatorKey;
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
    required this.navigatorKey,
  });

  const DashboardItem({
    required this.label,
    required this.id,
    required this.builder,
    required this.icon,
    this.appBarOptions,
    this.selectedIcon,
    this.search,
    this.overrideActions = false,
    this.actions = const [],
    this.authorization = const Authorization(types: [AccessType.admin()]),
    this.navigatorKey,
  }) : subItems = const [];

  const DashboardItem.items({
    required this.label,
    required this.icon,
    required this.subItems,
    this.authorization = const Authorization(types: [AccessType.admin()]),
  })  : selectedIcon = null,
        appBarOptions = null,
        id = '',
        navigatorKey = null,
        builder = _sizedBox,
        search = null,
        overrideActions = false,
        actions = const [];

  DashboardItem copyWithAuthorization(Authorization authorization) {
    return _copyWith(authorization: authorization);
  }

  DashboardItem copyWithIcon(Widget icon) {
    return _copyWith(icon: icon);
  }

  DashboardItem copyWithLabel(String label) {
    return _copyWith(label: label);
  }

  DashboardItem _copyWith({
    Authorization? authorization,
    String? id,
    String? label,
    Widget? icon,
    Widget? selectedIcon,
    Widget Function(Map<String, dynamic> parameters)? builder,
    SearchArgs? search,
    AppBarOptions? appBarOptions,
    List<DashboardItem>? subItems,
    List<Widget>? actions,
    bool? overrideActions,
    GlobalKey<NavigatorState>? navigatorKey,
  }) {
    return DashboardItem._(
      authorization: authorization ?? this.authorization,
      navigatorKey: navigatorKey ?? this.navigatorKey,
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

class SearchArgs extends Equatable {
  final void Function(BuildContext context, String? value)? onChanged;
  final void Function(BuildContext context, String? value)? onSubmitted;
  final String? initialValue;
  final bool loading;

  const SearchArgs({
    this.onChanged,
    this.onSubmitted,
    this.initialValue,
    this.loading = false,
  });

  @override
  List<Object?> get props => [
        onChanged,
        onSubmitted,
        initialValue,
        loading,
      ];
}
