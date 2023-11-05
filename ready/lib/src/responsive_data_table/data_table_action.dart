part of responsive_data_table;

/// action that used to handle row actions

abstract class Action<T, S extends BaseReadyListState<T>,
    TController extends ReadyListController<T, S>> {
  /// action callback
  DataTableActionCallBack<T, S, TController> get action;

  /// whether if action enabled or not
  DataTableActionProperty<T, bool> get enabled;

  /// whether if action enabled or not
  DataTableActionProperty<T, bool> get visible;

  Widget build(BuildContext context, TController controller, T item, int index,
      bool menuBar);
}

class IconAction<T, S extends BaseReadyListState<T>,
        TController extends ReadyListController<T, S>>
    extends Action<T, S, TController> {
  static bool _defEnabled(item) => true;

  /// icon of the action
  final DataTableActionProperty<T, IconData> icon;

  /// color of icon
  final DataTableActionProperty<T, Color> color;

  /// action toolTip
  final DataTableActionPropertyCtx<T, String> toolTip;

  @override
  final DataTableActionCallBack<T, S, TController> action;
  @override
  final DataTableActionProperty<T, bool> enabled;
  @override
  final DataTableActionProperty<T, bool> visible;
  IconAction({
    required this.action,
    required this.icon,
    required this.color,
    required this.toolTip,
    required this.visible,
    this.enabled = _defEnabled,
  });

  /// copy action properties and return new instate
  IconAction<T, S, TController> copyWith({
    DataTableActionCallBack<T, S, TController>? action,
    DataTableActionProperty<T, IconData>? icon,
    DataTableActionProperty<T, Color>? color,
    DataTableActionPropertyCtx<T, String>? toolTip,
    DataTableActionProperty<T, bool>? enabled,
    DataTableActionProperty<T, bool>? visible,
  }) {
    return IconAction<T, S, TController>(
      action: action ?? this.action,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      visible: visible ?? (item) => true,
      toolTip: toolTip ?? this.toolTip,
      enabled: enabled ?? this.enabled,
    );
  }

  /// action for delete
  factory IconAction.delete({
    required DataTableActionCallBack<T, S, TController> action,
    DataTableActionProperty<T, bool>? enabled,
    DataTableActionProperty<T, IconData>? icon,
    DataTableActionProperty<T, Color>? color,
    DataTableActionPropertyCtx<T, String>? toolTip,
    DataTableActionProperty<T, bool>? visible,
  }) {
    return IconAction(
      action: action,
      icon: icon ?? (item) => Icons.delete,
      color: color ?? (item) => Colors.redAccent,
      enabled: enabled ?? (item) => true,
      visible: visible ?? (item) => true,
      toolTip: toolTip ??
          (BuildContext ctx, T item) => Ready.localization(ctx).delete,
    );
  }

  /// action for edit

  factory IconAction.edit({
    required DataTableActionCallBack<T, S, TController> action,
    DataTableActionProperty<T, bool>? enabled,
    DataTableActionProperty<T, IconData>? icon,
    DataTableActionProperty<T, Color>? color,
    DataTableActionPropertyCtx<T, String>? toolTip,
    DataTableActionProperty<T, bool>? visible,
  }) {
    return IconAction(
      action: action,
      icon: icon ?? (item) => Icons.edit,
      color: color ?? (item) => Colors.greenAccent,
      enabled: enabled ?? (item) => true,
      visible: visible ?? (item) => true,
      toolTip:
          toolTip ?? (BuildContext ctx, T item) => Ready.localization(ctx).edit,
    );
  }

  /// action for view
  factory IconAction.view({
    required DataTableActionCallBack<T, S, TController> action,
    DataTableActionProperty<T, bool>? enabled,
    DataTableActionProperty<T, IconData>? icon,
    DataTableActionProperty<T, Color>? color,
    DataTableActionPropertyCtx<T, String>? toolTip,
    DataTableActionProperty<T, bool>? visible,
  }) {
    return IconAction(
      action: action,
      icon: icon ?? (item) => Icons.remove_red_eye,
      color: color ?? (item) => Colors.blueAccent,
      enabled: enabled ?? (item) => true,
      visible: visible ?? (item) => true,
      toolTip:
          toolTip ?? (BuildContext ctx, T item) => Ready.localization(ctx).show,
    );
  }

  /// action for toggle
  factory IconAction.toggle({
    required DataTableActionCallBack<T, S, TController> action,
    DataTableActionProperty<T, bool>? enabled,
    required DataTableActionProperty<T, bool> isActive,
    DataTableActionProperty<T, IconData>? icon,
    DataTableActionProperty<T, Color>? color,
    DataTableActionPropertyCtx<T, String>? toolTip,
    DataTableActionProperty<T, bool>? visible,
  }) {
    return IconAction(
      action: action,
      icon: icon ?? (item) => isActive(item) ? Icons.lock : Icons.lock_open,
      color: color ?? (item) => isActive(item) ? Colors.orange : Colors.indigo,
      enabled: enabled ?? (item) => true,
      visible: visible ?? (item) => true,
      toolTip: toolTip ??
          (BuildContext ctx, T item) => isActive(item)
              ? (Ready.localization(ctx).deactivate)
              : (Ready.localization(ctx).activate),
    );
  }

  /// action for lock
  factory IconAction.deactivate({
    required DataTableActionCallBack<T, S, TController> action,
    DataTableActionProperty<T, bool>? enabled,
    DataTableActionProperty<T, IconData>? icon,
    DataTableActionProperty<T, Color>? color,
    DataTableActionPropertyCtx<T, String>? toolTip,
    DataTableActionProperty<T, bool>? visible,
  }) {
    return IconAction(
      action: action,
      icon: icon ?? (item) => Icons.lock,
      enabled: enabled ?? (item) => true,
      color: color ?? (item) => Colors.orange,
      visible: visible ?? (item) => true,
      toolTip: toolTip ??
          (BuildContext ctx, T item) => Ready.localization(ctx).deactivate,
    );
  }

  /// action for unlock
  factory IconAction.activate({
    required DataTableActionCallBack<T, S, TController> action,
    DataTableActionProperty<T, bool>? enabled,
    DataTableActionProperty<T, IconData>? icon,
    DataTableActionProperty<T, Color>? color,
    DataTableActionPropertyCtx<T, String>? toolTip,
    DataTableActionProperty<T, bool>? visible,
  }) {
    return IconAction(
      action: action,
      icon: icon ?? (item) => Icons.lock_open,
      color: color ?? (item) => Colors.indigo,
      enabled: enabled ?? (item) => true,
      visible: visible ?? (item) => true,
      toolTip: toolTip ??
          (BuildContext ctx, T item) => Ready.localization(ctx).activate,
    );
  }

  @override
  Widget build(BuildContext context, TController controller, T item, int index,
      bool menuBar) {
    if (!visible(item)) {
      return const SizedBox();
    }
    return LoadingButton(
      menuBar: menuBar,
      tooltip: toolTip(context, item),
      enabled: (loading) => enabled(item) && !loading,
      load: () async {
        await action(context, controller, item);
      },
      icon: Icon(
        icon(item),
        color: enabled(item) ? color(item) : null,
      ),
    );
  }
}
