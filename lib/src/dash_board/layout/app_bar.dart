part of web_admin_layout;

class AppBarOptions {
  /// Theme to be applied to app bar
  final AppBarTheme? theme;

  /// decoration of search box
  final InputDecoration? inputDecoration;

  /// {@macro flutter.material.appbar.flexibleSpace}
  ///
  /// This property is used to configure an [AppBar].
  final Widget? flexibleSpace;

  /// {@macro flutter.material.appbar.bottom}
  ///
  /// This property is used to configure an [AppBar].
  final PreferredSizeWidget? bottom;

  /// {@macro flutter.material.appbar.primary}
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

  /// The offset of overscroll required to activate [onStretchTrigger].
  ///
  /// This defaults to 100.0.
  final double? stretchTriggerOffset;

  /// The callback function to be executed when a user over-scrolls to the
  /// offset specified by [stretchTriggerOffset].
  final AsyncCallback? onStretchTrigger;

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
  });

  AppBarOptions _copyWith(AppBarOptions? other) {
    return AppBarOptions(
      flexibleSpace: other?.flexibleSpace ?? flexibleSpace,
      bottom: other?.bottom ?? bottom,
      theme: theme == null ? other?.theme : _copyTheme(theme!, other?.theme),
      primary: other?.primary ?? primary,
      collapsedHeight: other?.collapsedHeight ?? collapsedHeight,
      expandedHeight: other?.expandedHeight ?? expandedHeight,
      floating: other?.floating ?? floating,
      pinned: other?.pinned ?? pinned,
      snap: other?.snap ?? snap,
      stretch: other?.stretch ?? stretch,
      stretchTriggerOffset: other?.stretchTriggerOffset ?? stretchTriggerOffset,
      onStretchTrigger: other?.onStretchTrigger ?? onStretchTrigger,
    );
  }

  static AppBarTheme _copyTheme(AppBarTheme current, AppBarTheme? _new) {
    return current.copyWith(
      foregroundColor: _new?.foregroundColor,
      elevation: _new?.elevation,
      shadowColor: _new?.shadowColor,
      shape: _new?.shape,
      iconTheme: _new?.iconTheme,
      actionsIconTheme: _new?.actionsIconTheme,
      backgroundColor: _new?.backgroundColor,
      centerTitle: _new?.centerTitle,
      titleSpacing: _new?.titleSpacing,
      toolbarHeight: _new?.toolbarHeight,
      toolbarTextStyle: _new?.toolbarTextStyle,
      titleTextStyle: _new?.titleTextStyle,
      systemOverlayStyle: _new?.systemOverlayStyle,
    );
  }
}

class _DashBoardAppBar extends StatelessWidget {
  final Widget? drawerIcon;
  final bool innerBoxIsScrolled;
  final FocusNode focusNode;
  const _DashBoardAppBar({
    Key? key,
    required this.drawerIcon,
    required this.innerBoxIsScrolled,
    required this.focusNode,
  }) : super(key: key);

  List<DashboardItem> items(DashboardItem e) {
    if (e.builder != null) {
      return [e];
    } else {
      return e.subItems.map((e) => items(e)).expand((element) => element).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    var options = ReadyDashboard.of(context)!;

    return TabControllerLisner(
      builder: (int index) {
        var _items = [
          for (var item in options.items) ...items(item),
        ];
        var selected = _items[index];
        var appBar = options.appBarOptions._copyWith(selected.appBarOptions);
        var theme = Theme.of(context);
        var appBarTheme = AppBarOptions._copyTheme(
          theme.appBarTheme,
          appBar.theme ??
              AppBarTheme(
                backgroundColor: Colors.transparent,
                foregroundColor: DefaultTextStyle.of(context).style.color,
                elevation: 0,
              ),
        );
        var drawerTheme = theme.drawerTheme;
        var border = OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(width: 0, color: Colors.transparent),
        );
        var actions = [
          ...selected.actions,
          if (!selected.overrideActions) ...options.actions,
        ];
        return Theme(
          data: theme.copyWith(
            appBarTheme: appBarTheme,
            inputDecorationTheme: InputDecorationTheme(
              fillColor: options.drawerOptions.backgroundColor ?? drawerTheme.backgroundColor,
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
              ...actions,
              const SizedBox(),
              const SizedBox(),
            ],
            bottom: appBar.bottom,
            primary: appBar.primary ?? true,
            collapsedHeight: appBar.collapsedHeight,
            expandedHeight: appBar.expandedHeight,
            floating: appBar.floating ?? false,
            pinned: appBar.pinned ?? false,
            snap: appBar.snap ?? false,
            stretch: appBar.stretch ?? false,
            stretchTriggerOffset: appBar.stretchTriggerOffset ?? 100,
            onStretchTrigger: appBar.onStretchTrigger,
            forceElevated: innerBoxIsScrolled,
            leading: drawerIcon ?? const SizedBox(),
            leadingWidth: drawerIcon == null ? 0 : null,
            title: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Container(
                constraints: const BoxConstraints(maxWidth: 500),
                child: selected.search == null
                    ? Text(selected.label)
                    : TextField(
                        key: Key(selected.id),
                        focusNode: focusNode,
                        onChanged: selected.search,
                        decoration: appBar.inputDecoration ??
                            InputDecoration(
                              hintText: Ready.localization(context).search,
                              prefixIcon: const Icon(Icons.search),
                            ),
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}
