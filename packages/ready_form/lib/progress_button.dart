import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'config.dart';
import 'ready_form.dart';

enum _ButtonState { initial, loading }

class ProgressButtonKey extends GlobalKey<_ProgressButtonState> {
  final String id;
  const ProgressButtonKey(this.id) : super.constructor();
  @override
  int get hashCode => identityHashCode(id);

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is ProgressButtonKey && identical(other.id, id);
  }

  void onPressed() => currentState == null
      ? () {}
      : currentState
          ?._getCallBack(ProgressButtonConfig.of(currentContext!))
          ?.call();
  bool get isLoading => currentState?.state == _ButtonState.loading;
}

class ProgressButton extends StatefulWidget {
  final Future Function()? onPressed;

  final Widget child;

  /// loading indicator for progress button
  final Widget? loadingIndicator;

  /// button  alignment
  final AlignmentGeometry? alignment;

  /// progress animation duration default is 300 ms
  final Duration? duration;

  /// clipBehavior
  final Clip? clipBehavior;

  /// style for the button
  final ButtonStyle? style;

  /// default button type default is elevated
  final ButtonType? type;

  /// whether or not to submit parent form
  final bool? autoSubmitForm;
  const ProgressButton({
    ProgressButtonKey? key,
    this.onPressed,
    required this.child,
    this.alignment,
    this.duration,
    this.clipBehavior,
    this.style,
    this.autoSubmitForm,
    this.type,
    this.loadingIndicator,
  }) : super(key: key);

  @override
  _ProgressButtonState createState() => _ProgressButtonState();
}

class _ProgressButtonState extends State<ProgressButton>
    with TickerProviderStateMixin {
  _ButtonState state = _ButtonState.initial;
  GlobalKey _buttonKey = GlobalKey();
  final GlobalKey _innerKey = GlobalKey();
  Size? _buttonSize;
  Size? _innerSize;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _buttonKey = GlobalKey();
    SchedulerBinding.instance?.addPostFrameCallback(postFrameCallback);
  }

  void postFrameCallback(_) {
    if (state == _ButtonState.initial) {
      var btnContext = _buttonKey.currentContext;
      var innerContext = _innerKey.currentContext;
      var config = ProgressButtonConfig.of(context);
      var type = widget.type ?? config?.type ?? ButtonType.elevated;
      if (innerContext != null) {
        var _size = innerContext.size;
        if (type == ButtonType.text && _size != null) {
          _innerSize = _size;
        } else if (_size != null) {
          var _min = min(_size.width, _size.height);
          _innerSize = Size(_min, _min);
        }
      }
      if (btnContext != null) {
        var _size = btnContext.size;
        if (type == ButtonType.text && _size != null) {
          _buttonSize = _size;
        } else if (_size != null) {
          var _min = min(_size.width, _size.height);
          _buttonSize = Size(_min, _min);
        }
      }
    }
  }

  AlignmentGeometry alignment(ProgressButtonConfig? config) {
    return widget.alignment ?? config?.alignment ?? Alignment.center;
  }

  Duration duration(ProgressButtonConfig? config) {
    return widget.duration ??
        config?.duration ??
        const Duration(milliseconds: 300);
  }

  ButtonType type(ProgressButtonConfig? config) {
    return widget.type ?? config?.type ?? ButtonType.elevated;
  }

  ButtonStyle? style(ProgressButtonConfig? config) {
    return widget.style ?? config?.style;
  }

  Widget loadingIndicator(ProgressButtonConfig? config) {
    return widget.loadingIndicator ??
        config?.loadingIndicator ??
        const CircularProgressIndicator();
  }

  @override
  Widget build(BuildContext context) {
    var config = ProgressButtonConfig.of(context);
    var alignment = widget.alignment ?? config?.alignment;
    if (alignment == null) return _build(context, config);
    return Align(
      alignment: alignment,
      child: _build(context, config),
    );
  }

  T? effectiveValue<T>(ProgressButtonConfig? config,
      T? Function(ButtonStyle? style) getProperty) {
    final widgetStyle = style(config);
    ButtonStyle? themeStyle;
    ButtonStyle defaultStyle;
    switch (type(config)) {
      case ButtonType.text:
        themeStyle = TextButton(onPressed: () {}, child: const Text(''))
            .themeStyleOf(context);
        defaultStyle = TextButton(onPressed: () {}, child: const Text(''))
            .defaultStyleOf(context);
        break;
      case ButtonType.outlined:
        themeStyle = OutlinedButton(onPressed: () {}, child: const Text(''))
            .themeStyleOf(context);
        defaultStyle = OutlinedButton(onPressed: () {}, child: const Text(''))
            .defaultStyleOf(context);
        break;
      default:
        themeStyle = ElevatedButton(onPressed: () {}, child: const Text(''))
            .themeStyleOf(context);
        defaultStyle = ElevatedButton(onPressed: () {}, child: const Text(''))
            .defaultStyleOf(context);
    }
    final widgetValue = getProperty(widgetStyle);
    final themeValue = getProperty(themeStyle);
    final defaultValue = getProperty(defaultStyle);
    return widgetValue ?? themeValue ?? defaultValue;
  }

  T? resolve<T>(ProgressButtonConfig? config,
      MaterialStateProperty<T?>? Function(ButtonStyle? style) getProperty) {
    return effectiveValue(
      config,
      (ButtonStyle? style) => getProperty(style)?.resolve({}),
    );
  }

  EdgeInsetsGeometry getDefaultPadding(ProgressButtonConfig? config) {
    final resolvedPadding =
        resolve(config, (ButtonStyle? style) => style?.padding);
    final resolvedVisualDensity =
        effectiveValue(config, (ButtonStyle? style) => style?.visualDensity);

    final densityAdjustment = resolvedVisualDensity?.baseSizeAdjustment;
    return resolvedPadding
            ?.add(
              EdgeInsets.only(
                left: densityAdjustment?.dx ?? 0,
                top: densityAdjustment?.dy ?? 0,
                right: densityAdjustment?.dx ?? 0,
                bottom: densityAdjustment?.dy ?? 0,
              ),
            )
            .clamp(EdgeInsets.zero, EdgeInsetsGeometry.infinity) ??
        EdgeInsets.zero;
  }

  VoidCallback? _getCallBack(ProgressButtonConfig? config) {
    var auto = widget.autoSubmitForm ?? config?.autoSubmitForm ?? true;
    var _callBack =
        widget.onPressed ?? (auto ? ReadyForm.of(context)?.onSubmit : null);
    if (_callBack != null) return () => _onCallBack(_callBack, config);
    return null;
  }

  Widget _build(BuildContext context, ProgressButtonConfig? config) {
    var padding = state == _ButtonState.initial
        ? getDefaultPadding(config)
        : const EdgeInsets.all(3);
    Widget buttonChild = AnimatedSize(
      alignment: alignment(config),
      duration: duration(config),
      child: SizedBox(
        key: _innerKey,
        width: state == _ButtonState.initial ? null : _innerSize?.width,
        height: state == _ButtonState.initial ? null : _innerSize?.height,
        child: Padding(
          padding: padding,
          child: _buildChild(config),
        ),
      ),
    );

    var style = (this.style(config) ?? const ButtonStyle()).copyWith(
      padding: MaterialStateProperty.all(EdgeInsets.zero),
      minimumSize: state == _ButtonState.initial
          ? null
          : MaterialStateProperty.all(_buttonSize),
      shape: state == _ButtonState.initial
          ? null
          : MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                _buttonSize?.height ?? 50,
              ),
            )),
    );
    var type = this.type(config);

    if (type == ButtonType.outlined) {
      return OutlinedButton(
        key: _buttonKey,
        onPressed: _getCallBack(config),
        clipBehavior:
            widget.clipBehavior ?? config?.clipBehavior ?? Clip.antiAlias,
        style: style,
        child: buttonChild,
      );
    }
    if (type == ButtonType.text) {
      return TextButton(
        key: _buttonKey,
        onPressed: _getCallBack(config),
        clipBehavior:
            widget.clipBehavior ?? config?.clipBehavior ?? Clip.antiAlias,
        style: style,
        child: buttonChild,
      );
    } else {
      return ElevatedButton(
        key: _buttonKey,
        onPressed: _getCallBack(config),
        clipBehavior:
            widget.clipBehavior ?? config?.clipBehavior ?? Clip.antiAlias,
        style: style,
        child: buttonChild,
      );
    }
  }

  void _setButtonState(_ButtonState _state) {
    if (_state == state) return;

    if (mounted == true) {
      setState(() {
        state = _state;
      });
    } else {
      state = _state;
    }
  }

  void _onCallBack(
      Future<dynamic> Function() callBack, ProgressButtonConfig? config) {
    if (state != _ButtonState.initial) return;
    _setButtonState(_ButtonState.loading);
    callBack().then((d) {
      _setButtonState(_ButtonState.initial);
    }).catchError((c) {
      _setButtonState(_ButtonState.initial);
    });
  }

  Widget _buildChild(ProgressButtonConfig? config) {
    return LayoutBuilder(
      builder: (ctx, constrains) {
        return ProgressIndicatorTheme(
          data: ProgressIndicatorTheme.of(context).copyWith(
            circularTrackColor: DefaultTextStyle.of(context).style.color,
          ),
          child: ((widget.alignment ?? config?.alignment) == null ||
                  state != _ButtonState.initial)
              ? _buildInnerChild(ctx, constrains)
              : Center(child: _buildInnerChild(ctx, constrains)),
        );
      },
    );
  }

  Widget _buildInnerChild(BuildContext ctx, BoxConstraints constrain) {
    var config = ProgressButtonConfig.of(context);
    var circularLoader = loadingIndicator(config);

    if (state == _ButtonState.loading) {
      return circularLoader;
    }

    return widget.child;
  }
}
