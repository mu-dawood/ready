part of responsive_data_table;

typedef DataTableActionCallBack<T> = Future Function(BuildContext context, T item);

typedef DataTableActionProperty<T, Type> = Type Function(T item);
typedef DataTableActionPropertyCtx<T, Type> = Type Function(BuildContext context, T item);

class DataTableAction<T> {
  DataTableActionCallBack<T> action;
  DataTableActionProperty<T, bool> enabled = _defEnabled;
  static bool _defEnabled(item) => true;
  DataTableActionProperty<T, IconData> icon;
  DataTableActionProperty<T, Color> color;
  DataTableActionPropertyCtx<T, String> toolTip;
  DataTableAction({
    required this.action,
    required this.icon,
    required this.color,
    required this.toolTip,
    required this.enabled,
  });

  DataTableAction<T> copyWith({
    DataTableActionCallBack<T>? action,
    DataTableActionProperty<T, IconData>? icon,
    DataTableActionProperty<T, Color>? color,
    DataTableActionPropertyCtx<T, String>? toolTip,
    DataTableActionProperty<T, bool>? enabled,
  }) {
    return DataTableAction<T>(
      action: action ?? this.action,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      toolTip: toolTip ?? this.toolTip,
      enabled: enabled ?? this.enabled,
    );
  }

  factory DataTableAction.delete({
    required DataTableActionCallBack<T> action,
    DataTableActionProperty<T, bool>? enabled,
    DataTableActionProperty<T, IconData>? icon,
    DataTableActionProperty<T, Color>? color,
    DataTableActionPropertyCtx<T, String>? toolTip,
  }) {
    return DataTableAction(
      action: action,
      icon: icon ?? (item) => Icons.delete,
      color: color ?? (item) => Colors.redAccent,
      enabled: enabled ?? (item) => true,
      toolTip: toolTip ?? (BuildContext ctx, T item) => Ready.localization(ctx).delete,
    );
  }

  factory DataTableAction.edit({
    required DataTableActionCallBack<T> action,
    DataTableActionProperty<T, bool>? enabled,
    DataTableActionProperty<T, IconData>? icon,
    DataTableActionProperty<T, Color>? color,
    DataTableActionPropertyCtx<T, String>? toolTip,
  }) {
    return DataTableAction(
      action: action,
      icon: icon ?? (item) => Icons.edit,
      color: color ?? (item) => Colors.greenAccent,
      enabled: enabled ?? (item) => true,
      toolTip: toolTip ?? (BuildContext ctx, T item) => Ready.localization(ctx).edit,
    );
  }

  factory DataTableAction.view({
    required DataTableActionCallBack<T> action,
    DataTableActionProperty<T, bool>? enabled,
    DataTableActionProperty<T, IconData>? icon,
    DataTableActionProperty<T, Color>? color,
    DataTableActionPropertyCtx<T, String>? toolTip,
  }) {
    return DataTableAction(
      action: action,
      icon: icon ?? (item) => Icons.remove_red_eye,
      color: color ?? (item) => Colors.blueAccent,
      enabled: enabled ?? (item) => true,
      toolTip: toolTip ?? (BuildContext ctx, T item) => Ready.localization(ctx).show,
    );
  }

  factory DataTableAction.toggle({
    required DataTableActionCallBack<T> action,
    DataTableActionProperty<T, bool>? enabled,
    required DataTableActionProperty<T, bool> isActive,
    DataTableActionProperty<T, IconData>? icon,
    DataTableActionProperty<T, Color>? color,
    DataTableActionPropertyCtx<T, String>? toolTip,
  }) {
    return DataTableAction(
      action: action,
      icon: icon ?? (item) => isActive(item) ? Icons.lock : Icons.lock_open,
      color: color ?? (item) => isActive(item) ? Colors.orange : Colors.indigo,
      enabled: enabled ?? (item) => true,
      toolTip: toolTip ??
          (BuildContext ctx, T item) =>
              isActive(item) ? (Ready.localization(ctx).lock) : (Ready.localization(ctx).unlock),
    );
  }
  factory DataTableAction.lock({
    required DataTableActionCallBack<T> action,
    DataTableActionProperty<T, bool>? enabled,
    DataTableActionProperty<T, IconData>? icon,
    DataTableActionProperty<T, Color>? color,
    DataTableActionPropertyCtx<T, String>? toolTip,
  }) {
    return DataTableAction(
      action: action,
      icon: icon ?? (item) => Icons.lock,
      enabled: enabled ?? (item) => true,
      color: color ?? (item) => Colors.orange,
      toolTip: toolTip ?? (BuildContext ctx, T item) => Ready.localization(ctx).lock,
    );
  }
  factory DataTableAction.unLock({
    required DataTableActionCallBack<T> action,
    DataTableActionProperty<T, bool>? enabled,
    DataTableActionProperty<T, IconData>? icon,
    DataTableActionProperty<T, Color>? color,
    DataTableActionPropertyCtx<T, String>? toolTip,
  }) {
    return DataTableAction(
      action: action,
      icon: icon ?? (item) => Icons.lock_open,
      color: color ?? (item) => Colors.indigo,
      enabled: enabled ?? (item) => true,
      toolTip: toolTip ?? (BuildContext ctx, T item) => Ready.localization(ctx).unlock,
    );
  }
}
