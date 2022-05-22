import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class _Dismiss extends StatefulWidget {
  final Widget child;
  final Duration duration;
  const _Dismiss({Key? key, required this.child, required this.duration})
      : super(key: key);
  @override
  __DismissState createState() => __DismissState();
}

class __DismissState extends State<_Dismiss> {
  @override
  void initState() {
    super.initState();
    Future.delayed(widget.duration).then((value) {
      if (mounted && ModalRoute.of(context)?.isCurrent == true) {
        Navigator.of(context).pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: widget.child,
    );
  }
}

class SnackBarObserver extends NavigatorObserver {
  SnackBarObserver._();
  final ValueNotifier<Route?> _currentRoute = ValueNotifier(null);
  bool get isPopupRoute {
    if (_currentRoute.value == null && kDebugMode) {
      if (kDebugMode) {
        print(
            'Please ensure that you added context.snackBarObserver to your material app observer');
      }
    }
    return _currentRoute.value != null && _currentRoute.value is PopupRoute;
  }

  bool get isDialog {
    if (_currentRoute.value == null && kDebugMode) {
      if (kDebugMode) {
        print(
            'Please ensure that you added context.snackBarObserver to your material app observer');
      }
    }
    return _currentRoute.value != null && _currentRoute.value is DialogRoute;
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    _currentRoute.value = previousRoute;
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    _currentRoute.value = route;
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    _currentRoute.value = previousRoute;
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    _currentRoute.value = newRoute;
  }
}

extension SnackBarExtension on BuildContext {
  static final _observer = SnackBarObserver._();
  SnackBarObserver get snackBarObserver => SnackBarExtension._observer;
  Future waitForDialogToClose() {
    if (!snackBarObserver.isDialog || snackBarObserver.navigator == null) {
      return Future.value();
    }
    var completer = Completer();
    late VoidCallback fn;
    fn = () {
      if (!snackBarObserver.isDialog && !completer.isCompleted) {
        completer.complete();
        snackBarObserver._currentRoute.removeListener(fn);
      }
    };
    snackBarObserver._currentRoute.addListener(fn);
    return completer.future;
  }

  Future waitForPopupRouteToClose() {
    if (!snackBarObserver.isPopupRoute || snackBarObserver.navigator == null) {
      return Future.value();
    }
    var completer = Completer();
    late VoidCallback fn;
    fn = () {
      if (!snackBarObserver.isPopupRoute && !completer.isCompleted) {
        completer.complete();
        snackBarObserver._currentRoute.removeListener(fn);
      }
    };
    snackBarObserver._currentRoute.addListener(fn);
    return completer.future;
  }

  Future showSnackBar(
    String message, {
    Color? backgroundColor,
    Color? textColor,
    double? elevation,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    double? width,
    ShapeBorder? shape,
    SnackBarBehavior behavior = SnackBarBehavior.floating,
    SnackBarAction? action,
    Duration duration = const Duration(seconds: 4),
    Animation<double>? animation,
    VoidCallback? onVisible,
    bool waitDialogToPop = true,
    bool waitPopupRouteToPop = false,
  }) async {
    var observer = snackBarObserver;
    var showModalSheet = !waitPopupRouteToPop && observer.isPopupRoute;
    var manager = ScaffoldMessenger.maybeOf(this);
    var snackBarTheme = Theme.of(this).snackBarTheme;
    var navigator = Navigator.of(this);
    if (waitDialogToPop) await waitForDialogToClose();
    if (waitPopupRouteToPop) await waitForPopupRouteToClose();

    if (showModalSheet) {
      var future = showModalBottomSheet(
        context: navigator.context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (ctx) => _Dismiss(
          duration: duration,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Card(
                  color: backgroundColor ?? snackBarTheme.backgroundColor,
                  shape: shape ?? snackBarTheme.shape,
                  elevation: elevation,
                  margin: margin ?? const EdgeInsets.all(15),
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: padding ?? const EdgeInsets.all(15),
                            child: Text(
                              message,
                              style: snackBarTheme.contentTextStyle
                                      ?.copyWith(color: textColor) ??
                                  TextStyle(color: textColor),
                              textAlign: action == null
                                  ? TextAlign.center
                                  : TextAlign.start,
                            ),
                          ),
                        ),
                        if (action != null)
                          TextButton(
                            style: TextButton.styleFrom(
                                primary: action.textColor ??
                                    snackBarTheme.actionTextColor),
                            onPressed: action.onPressed,
                            child: Text(action.label),
                          )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
      if (onVisible != null) onVisible();
      await future;
    } else {
      return manager
          ?.showSnackBar(SnackBar(
            content: Text(
              message,
              style: TextStyle(color: textColor),
              textAlign: action == null ? TextAlign.center : TextAlign.start,
            ),
            backgroundColor: backgroundColor,
            elevation: elevation,
            margin: margin,
            padding: padding,
            width: width,
            shape: shape,
            behavior: behavior,
            action: action,
            duration: duration,
            animation: animation,
            onVisible: onVisible,
          ))
          .closed;
    }
  }

  void errorSnackBar(
    String message, {
    double? elevation,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    double? width,
    ShapeBorder? shape,
    SnackBarBehavior behavior = SnackBarBehavior.floating,
    SnackBarAction? action,
    Duration duration = const Duration(seconds: 4),
    Animation<double>? animation,
    VoidCallback? onVisible,
    bool waitDialogToPop = true,
    bool waitPopupRouteToPop = false,
  }) {
    showSnackBar(
      message,
      backgroundColor: Theme.of(this).colorScheme.error,
      textColor: Theme.of(this).colorScheme.onError,
      elevation: elevation,
      margin: margin,
      padding: padding,
      width: width,
      shape: shape,
      behavior: behavior,
      action: action,
      duration: duration,
      animation: animation,
      onVisible: onVisible,
      waitPopupRouteToPop: waitPopupRouteToPop,
      waitDialogToPop: waitDialogToPop,
    );
  }

  void primarySnackBar(
    String message, {
    double? elevation,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    double? width,
    ShapeBorder? shape,
    SnackBarBehavior behavior = SnackBarBehavior.floating,
    SnackBarAction? action,
    Duration duration = const Duration(seconds: 4),
    Animation<double>? animation,
    VoidCallback? onVisible,
    bool waitDialogToPop = true,
    bool waitPopupRouteToPop = false,
  }) {
    showSnackBar(
      message,
      backgroundColor: Theme.of(this).colorScheme.primary,
      textColor: Theme.of(this).colorScheme.onPrimary,
      elevation: elevation,
      margin: margin,
      padding: padding,
      width: width,
      shape: shape,
      behavior: behavior,
      action: action,
      duration: duration,
      animation: animation,
      onVisible: onVisible,
      waitPopupRouteToPop: waitPopupRouteToPop,
      waitDialogToPop: waitDialogToPop,
    );
  }

  void accentSnackBar(
    String message, {
    double? elevation,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    double? width,
    ShapeBorder? shape,
    SnackBarBehavior behavior = SnackBarBehavior.floating,
    SnackBarAction? action,
    Duration duration = const Duration(seconds: 4),
    Animation<double>? animation,
    VoidCallback? onVisible,
    bool waitDialogToPop = true,
    bool waitPopupRouteToPop = false,
  }) {
    showSnackBar(
      message,
      backgroundColor: Theme.of(this).colorScheme.secondary,
      textColor: Theme.of(this).colorScheme.onSecondary,
      elevation: elevation,
      margin: margin,
      padding: padding,
      width: width,
      shape: shape,
      behavior: behavior,
      action: action,
      duration: duration,
      animation: animation,
      onVisible: onVisible,
      waitPopupRouteToPop: waitPopupRouteToPop,
      waitDialogToPop: waitDialogToPop,
    );
  }
}
