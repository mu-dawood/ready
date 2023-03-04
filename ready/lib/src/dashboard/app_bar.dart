part of dashboard;

class AppBarOptions {
  /// Theme to be applied to app bar
  final AppBarTheme? theme;

  /// decoration of search box
  final InputDecoration Function(bool loading)? inputDecoration;

  /// {@macro flutter.material.appBar.flexibleSpace}
  ///
  /// This property is used to configure an [AppBar].
  final Widget? flexibleSpace;

  /// {@macro flutter.material.appBar.bottom}
  ///
  /// This property is used to configure an [AppBar].
  final PreferredSizeWidget? bottom;

  /// {@macro flutter.material.appBar.primary}
  ///
  /// This property is used to configure an [AppBar].
  final bool? primary;

  /// Defines the height of the app bar when it is collapsed.
  ///
  /// By default, the collapsed height is [toolbarHeight]. If [bottom] widget is
  /// specified, then its height from [PreferredSizeWidget.preferredSize] is
  /// added to the height. If [primary] is true, then the [MediaQuery] top
  /// padding, [EdgeInsets.top] of [MediaQueryData.padding], is added as well.
  ///
  /// If [pinned] and [floating] are true, with [bottom] set, the default
  /// collapsed height is only the height of [PreferredSizeWidget.preferredSize]
  /// with the [MediaQuery] top padding.
  final double? collapsedHeight;

  /// The size of the app bar when it is fully expanded.
  ///
  /// By default, the total height of the toolbar and the bottom widget (if
  /// any). If a [flexibleSpace] widget is specified this height should be big
  /// enough to accommodate whatever that widget contains.
  ///
  /// This does not include the status bar height (which will be automatically
  /// included if [primary] is true).
  final double? expandedHeight;

  /// Whether the app bar should become visible as soon as the user scrolls
  /// towards the app bar.
  ///
  /// Otherwise, the user will need to scroll near the top of the scroll view to
  /// reveal the app bar.
  ///
  /// If [snap] is true then a scroll that exposes the app bar will trigger an
  /// animation that slides the entire app bar into view. Similarly if a scroll
  /// dismisses the app bar, the animation will slide it completely out of view.
  ///
  /// ## Animated Examples
  ///
  /// The following animations show how the app bar changes its scrolling
  /// behavior based on the value of this property.
  ///
  /// * App bar with [floating] set to false:
  ///   {@animation 476 400 https://flutter.github.io/assets-for-api-docs/assets/material/app_bar.mp4}
  /// * App bar with [floating] set to true:
  ///   {@animation 476 400 https://flutter.github.io/assets-for-api-docs/assets/material/app_bar_floating.mp4}
  ///
  /// See also:
  ///
  ///  * [SliverAppBar] for more animated examples of how this property changes the
  ///    behavior of the app bar in combination with [pinned] and [snap].
  final bool? floating;

  /// Whether the app bar should remain visible at the start of the scroll view.
  ///
  /// The app bar can still expand and contract as the user scrolls, but it will
  /// remain visible rather than being scrolled out of view.
  ///
  /// ## Animated Examples
  ///
  /// The following animations show how the app bar changes its scrolling
  /// behavior based on the value of this property.
  ///
  /// * App bar with [pinned] set to false:
  ///   {@animation 476 400 https://flutter.github.io/assets-for-api-docs/assets/material/app_bar.mp4}
  /// * App bar with [pinned] set to true:
  ///   {@animation 476 400 https://flutter.github.io/assets-for-api-docs/assets/material/app_bar_pinned.mp4}
  ///
  /// See also:
  ///
  ///  * [SliverAppBar] for more animated examples of how this property changes the
  ///    behavior of the app bar in combination with [floating].
  final bool? pinned;

  /// If [snap] and [floating] are true then the floating app bar will "snap"
  /// into view.
  ///
  /// If [snap] is true then a scroll that exposes the floating app bar will
  /// trigger an animation that slides the entire app bar into view. Similarly
  /// if a scroll dismisses the app bar, the animation will slide the app bar
  /// completely out of view. Additionally, setting [snap] to true will fully
  /// expand the floating app bar when the framework tries to reveal the
  /// contents of the app bar by calling [RenderObject.showOnScreen]. For
  /// example, when a [TextField] in the floating app bar gains focus, if [snap]
  /// is true, the framework will always fully expand the floating app bar, in
  /// order to reveal the focused [TextField].
  ///
  /// Snapping only applies when the app bar is floating, not when the app bar
  /// appears at the top of its scroll view.
  ///
  /// ## Animated Examples
  ///
  /// The following animations show how the app bar changes its scrolling
  /// behavior based on the value of this property.
  ///
  /// * App bar with [snap] set to false:
  ///   {@animation 476 400 https://flutter.github.io/assets-for-api-docs/assets/material/app_bar_floating.mp4}
  /// * App bar with [snap] set to true:
  ///   {@animation 476 400 https://flutter.github.io/assets-for-api-docs/assets/material/app_bar_floating_snap.mp4}
  ///
  /// See also:
  ///
  ///  * [SliverAppBar] for more animated examples of how this property changes the
  ///    behavior of the app bar in combination with [pinned] and [floating].
  final bool? snap;

  /// Whether the app bar should stretch to fill the over-scroll area.
  ///
  /// The app bar can still expand and contract as the user scrolls, but it will
  /// also stretch when the user over-scrolls.
  final bool? stretch;

  /// The offset of overScroll required to activate [onStretchTrigger].
  ///
  /// This defaults to 100.0.
  final double? stretchTriggerOffset;

  /// The callback function to be executed when a user over-scrolls to the
  /// offset specified by [stretchTriggerOffset].
  final AsyncCallback? onStretchTrigger;

  /// override the default drawer icon
  final Widget Function(VoidCallback toggle, AnimationController expansion)?
      buildDrawerIcon;

  const AppBarOptions({
    this.flexibleSpace,
    this.bottom,
    this.primary,
    this.theme,
    this.collapsedHeight,
    this.expandedHeight,
    this.floating,
    this.pinned,
    this.snap,
    this.stretch,
    this.stretchTriggerOffset,
    this.onStretchTrigger,
    this.inputDecoration,
    this.buildDrawerIcon,
  });

  AppBarOptions _copyWith(AppBarOptions? other) {
    return AppBarOptions(
      flexibleSpace: other?.flexibleSpace ?? flexibleSpace,
      bottom: other?.bottom ?? bottom,
      theme: other?.theme ?? theme,
      primary: other?.primary ?? primary,
      collapsedHeight: other?.collapsedHeight ?? collapsedHeight,
      expandedHeight: other?.expandedHeight ?? expandedHeight,
      floating: other?.floating ?? floating,
      pinned: other?.pinned ?? pinned,
      snap: other?.snap ?? snap,
      stretch: other?.stretch ?? stretch,
      stretchTriggerOffset: other?.stretchTriggerOffset ?? stretchTriggerOffset,
      onStretchTrigger: other?.onStretchTrigger ?? onStretchTrigger,
      buildDrawerIcon: other?.buildDrawerIcon ?? buildDrawerIcon,
    );
  }

  AppBarOptions copyWith({
    AppBarTheme? theme,
    InputDecoration Function(bool loading)? inputDecoration,
    Widget? flexibleSpace,
    PreferredSizeWidget? bottom,
    bool? primary,
    double? collapsedHeight,
    double? expandedHeight,
    bool? floating,
    bool? pinned,
    bool? snap,
    bool? stretch,
    double? stretchTriggerOffset,
    AsyncCallback? onStretchTrigger,
    Widget Function(VoidCallback toggle, AnimationController expansion)?
        buildDrawerIcon,
  }) {
    return AppBarOptions(
      theme: theme ?? this.theme,
      inputDecoration: inputDecoration ?? this.inputDecoration,
      flexibleSpace: flexibleSpace ?? this.flexibleSpace,
      bottom: bottom ?? this.bottom,
      primary: primary ?? this.primary,
      collapsedHeight: collapsedHeight ?? this.collapsedHeight,
      expandedHeight: expandedHeight ?? this.expandedHeight,
      floating: floating ?? this.floating,
      pinned: pinned ?? this.pinned,
      snap: snap ?? this.snap,
      stretch: stretch ?? this.stretch,
      stretchTriggerOffset: stretchTriggerOffset ?? this.stretchTriggerOffset,
      onStretchTrigger: onStretchTrigger ?? this.onStretchTrigger,
      buildDrawerIcon: this.buildDrawerIcon ?? buildDrawerIcon,
    );
  }
}

class _DashBoardAppBar extends StatelessWidget {
  final bool innerBoxIsScrolled;
  final bool mergeActions;
  final FocusNode focusNode;
  final DrawerOptions drawerOptions;
  final AppBarOptions appBarOptions;
  final AnimationController expansion;
  const _DashBoardAppBar({
    Key? key,
    required this.innerBoxIsScrolled,
    required this.focusNode,
    required this.mergeActions,
    required this.drawerOptions,
    required this.appBarOptions,
    required this.expansion,
  }) : super(key: key);

  List<DashboardItem> items(DashboardItem e) {
    if (e.hasBuilder) {
      return [e];
    } else {
      return e.subItems
          .map((e) => items(e))
          .expand((element) => element)
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    var layout = ReadyDashboard.of(context)!;
    var options = layout.widget;

    return TabControllerBuilder(
      builder: (int index) {
        var val = [
          for (var item in options.items) ...items(item),
        ];
        var selected = val[index];
        var appBar = appBarOptions._copyWith(selected.appBarOptions);
        var theme = Theme.of(context);
        var appBarTheme = appBar.theme ??
            theme.appBarTheme.copyWith(
              backgroundColor: Colors.transparent,
              foregroundColor: DefaultTextStyle.of(context).style.color,
              elevation: 0,
            );
        var border = OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(width: 0, color: Colors.transparent),
        );
        List<Widget> actions = layout._appBarActions[index]?.call() ?? [];
        actions = actions
            .map<Widget>((e) => Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: e,
                ))
            .toList();
        if (selected.overrideActions) {
          actions.addAll(selected.actions);
        } else {
          actions.addAll(selected.actions);
          actions.addAll(options.actions);
        }
        return Theme(
          data: theme.copyWith(
            appBarTheme: appBarTheme,
            inputDecorationTheme: InputDecorationTheme(
              fillColor:
                  theme.inputDecorationTheme.fillColor ?? Colors.transparent,
              border: border,
              isDense: true,
              filled: true,
              enabledBorder: border,
              focusedBorder: border,
            ),
          ),
          child: SliverAppBar(
            flexibleSpace: appBar.flexibleSpace,
            actions: [
              if (mergeActions && actions.length > 1)
                _MoreMenu(children: actions)
              else ...[
                ...actions,
                const SizedBox(),
                const SizedBox(),
              ]
            ],
            bottom: appBar.bottom,
            primary: appBar.primary ?? true,
            collapsedHeight: appBar.collapsedHeight,
            expandedHeight: appBar.expandedHeight,
            floating: appBar.floating ?? false,
            pinned: appBar.pinned ?? !Scaffold.of(context).hasDrawer,
            snap: appBar.snap ?? false,
            stretch: appBar.stretch ?? false,
            stretchTriggerOffset: appBar.stretchTriggerOffset ?? 100,
            onStretchTrigger: appBar.onStretchTrigger,
            forceElevated: innerBoxIsScrolled,
            leading: leading(context, appBar),
            title: title(context, selected, appBar),
          ),
        );
      },
    );
  }

  Widget leading(BuildContext context, AppBarOptions appBar) {
    return appBar.buildDrawerIcon?.call(() {
          _DrawerIcon.toggle(context, expansion);
        }, expansion) ??
        _DrawerIcon(expansion: expansion);
  }

  Widget? title(
    BuildContext context,
    DashboardItem selected,
    AppBarOptions appBar,
  ) {
    if (selected.search == null) return Text(selected.label);
    var decoration = appBar.inputDecoration?.call(selected.search!.loading) ??
        InputDecoration(
          isCollapsed: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          hintText: Ready.localization(context).search,
          suffixIcon: selected.search!.loading
              ? const CircularProgressIndicator.adaptive()
              : const Icon(Icons.search),
        );

    return Container(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: TextField(
          key: Key(selected.id),
          focusNode: focusNode,
          onChanged: (v) => selected.search!.onChanged?.call(context, v),
          onSubmitted: (v) => selected.search!.onSubmitted?.call(context, v),
          decoration: decoration,
        ),
      ),
    );
  }
}

class _MoreMenu extends StatelessWidget {
  final List<Widget> children;
  const _MoreMenu({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        final NavigatorState navigator = Navigator.of(context);
        navigator.push(_MoreMenuRoute(
          children: children,
          barrierLabel:
              MaterialLocalizations.of(context).modalBarrierDismissLabel,
        ));
      },
      icon: const Icon(Icons.more_vert_rounded),
    );
  }
}

class _MoreMenuRoute extends PopupRoute {
  _MoreMenuRoute({
    required this.children,
    required this.barrierLabel,
  });
  final List<Widget> children;
  @override
  Animation<double> createAnimation() {
    return CurvedAnimation(
      parent: super.createAnimation(),
      curve: Curves.linear,
      reverseCurve: const Interval(0.0, 2.0 / 3.0),
    );
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  bool get barrierDismissible => true;

  @override
  Color? get barrierColor => Colors.black26;

  @override
  final String barrierLabel;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return SafeArea(
      child: Align(
        alignment: AlignmentDirectional.topEnd,
        child: Card(
          margin: const EdgeInsetsDirectional.only(
              top: kToolbarHeight, start: 10, end: 10),
          child: Wrap(
            alignment: WrapAlignment.start,
            children: children,
          ),
        ),
      ),
    );
  }
}
