import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'config.dart';
import 'ready_form/ready_form.dart';

enum _ButtonState { initial, loading }

class ProgressButtonKey {
  final GlobalKey<_ProgressButtonState> _key;
  const ProgressButtonKey._(this._key);
  factory ProgressButtonKey({String? debugLabel}) => ProgressButtonKey._(
      GlobalKey<_ProgressButtonState>(debugLabel: debugLabel));

  void onPressed() => _key.currentState == null
      ? () {}
      : _key.currentState
          ?._getCallBack(ProgressButtonConfig.of(_key.currentContext!))
          ?.call();
  bool get isLoading => _key.currentState?.state == _ButtonState.loading;
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

  /// title for the  cancel dialog
  final Widget? cancelRequestTitle;

  /// content for the  cancel dialog
  final Widget? cancelRequestContent;

  /// disable taping and editing form fields while submitting defaults to [false]
  final bool? disableEditingOnSubmit;

  /// override yes button
  final Widget? yes;

  /// override no button
  final Widget? no;

  /// if specified will show a dialog when user try to pop and the form is [submitting]
  final VoidCallback? onCancelRequest;
  ProgressButton({
    ProgressButtonKey? key,
    this.onPressed,
    required this.child,
    this.alignment,
    this.duration,
    this.clipBehavior,
    this.onCancelRequest,
    this.cancelRequestTitle,
    this.cancelRequestContent,
    this.disableEditingOnSubmit,
    this.yes,
    this.no,
    this.style,
    this.autoSubmitForm,
    this.type,
    this.loadingIndicator,
  }) : super(key: key?._key);

  @override
  _ProgressButtonState createState() => _ProgressButtonState();
}

class _ProgressButtonState extends State<ProgressButton>
    with TickerProviderStateMixin {
  GlobalKey<State<ButtonStyleButton>> key =
      GlobalKey<State<ButtonStyleButton>>();
  _ButtonState state = _ButtonState.initial;
  late AnimationController _controller;
  Animation<Size?>? _sizeAnimation;
  Animation<MaterialStateProperty<EdgeInsetsGeometry?>?>? _paddingAnimation;
  Animation<MaterialStateProperty<OutlinedBorder?>?>? _shapeAnimation;
  Animation<VisualDensity?>? _visualDensityAnimation;
  @override
  void didChangeDependencies() {
    _controller = AnimationController(
      vsync: this,
      duration: duration(ProgressButtonConfig.of(context)),
    );
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _afterFirstFrame(_);
      setState(() {});
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ProgressButton oldWidget) {
    if (oldWidget.duration != widget.duration) {
      _controller.duration = duration(ProgressButtonConfig.of(context));
    }
    if (oldWidget.child != widget.child) {
      WidgetsBinding.instance!.addPostFrameCallback(_afterFirstFrame);
    }
    super.didUpdateWidget(oldWidget);
  }

  void _afterFirstFrame(Duration timeStamp) {
    var size = key.currentContext?.size;
    var curve = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInCirc,
    );
    if (size != null) {
      var _size = min(size.width, size.height);
      _sizeAnimation = SizeTween(
        begin: size,
        end: Size(_size, _size),
      ).animate(curve);

      final ButtonStyle? widgetStyle = key.currentState?.widget.style;
      final ButtonStyle? themeStyle =
          // ignore: invalid_use_of_protected_member
          key.currentState?.widget.themeStyleOf(context);
      final ButtonStyle? defaultStyle =
          // ignore: invalid_use_of_protected_member
          key.currentState?.widget.defaultStyleOf(context);

      T? effectiveValue<T>(T? Function(ButtonStyle? style) getProperty) {
        final T? widgetValue = getProperty(widgetStyle);
        final T? themeValue = getProperty(themeStyle);
        final T? defaultValue = getProperty(defaultStyle);
        return widgetValue ?? themeValue ?? defaultValue;
      }

      var _padding = effectiveValue((style) => style?.padding);
      var _shape = effectiveValue((style) => style?.shape);
      var _visualDensity = effectiveValue((style) => style?.visualDensity);
      _paddingAnimation = _MaterialStatePropertyTween<EdgeInsetsGeometry?>(
        tween: (states) {
          return EdgeInsetsGeometryTween(
            begin: _padding?.resolve(states),
            end: const EdgeInsets.all(5),
          );
        },
      ).animate(curve);
      _shapeAnimation = _MaterialStatePropertyTween<OutlinedBorder?>(
        tween: (states) {
          return OutlinedBorderTween(
            begin: _shape?.resolve(states),
            end: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_size),
            ),
          );
        },
      ).animate(curve);
      _visualDensityAnimation = _VisualDestinyTween(
        begin: _visualDensity,
        end: const VisualDensity(
          horizontal: VisualDensity.minimumDensity,
          vertical: VisualDensity.minimumDensity,
        ),
      ).animate(curve);
    }
  }

  Duration duration(ProgressButtonConfig? config) {
    return widget.duration ??
        config?.duration ??
        const Duration(milliseconds: 300);
  }

  ButtonType type(ProgressButtonConfig? config) {
    return widget.type ?? config?.type ?? ButtonType.elevated;
  }

  ButtonStyle style(ProgressButtonConfig? config) {
    return widget.style ?? config?.style ?? const ButtonStyle();
  }

  Widget loadingIndicator(ProgressButtonConfig? config) {
    return widget.loadingIndicator ??
        config?.loadingIndicator ??
        const CircularProgressIndicator();
  }

  @override
  Widget build(BuildContext context) {
    var config = ProgressButtonConfig.of(context);
    return WillPopScope(
      onWillPop: () async {
        if (state != _ButtonState.loading || widget.onCancelRequest == null) {
          return true;
        }
        var res = await showDialog(
          context: context,
          builder: (ctx) {
            return CancelDialog(
              cancelRequestContent: widget.cancelRequestContent,
              cancelRequestTitle: widget.cancelRequestTitle,
              yes: widget.yes,
              no: widget.no,
              config: ReadyFormConfig.of(context),
              onCancelRequest: widget.onCancelRequest!,
            );
          },
        );
        return res == "yes";
      },
      child: _build(context, config),
    );
  }

  VoidCallback? _getCallBack(ProgressButtonConfig? config) {
    var auto = widget.autoSubmitForm ?? config?.autoSubmitForm ?? true;
    var _callBack =
        widget.onPressed ?? (auto ? ReadyForm.of(context)?.onSubmit : null);
    if (_callBack != null) return () => _onCallBack(_callBack, config);
    return null;
  }

  Widget _build(BuildContext context, ProgressButtonConfig? config) {
    Widget buttonChild = _buildChild(config);

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        var _style = style(config).copyWith(
          visualDensity: _visualDensityAnimation?.value,
          padding: _paddingAnimation?.value,
          fixedSize: MaterialStateProperty.all(_sizeAnimation?.value),
          shape: _shapeAnimation?.value,
        );
        var type = this.type(config);
        late Widget child;
        if (type == ButtonType.outlined) {
          child = OutlinedButton(
            key: key,
            onPressed: _getCallBack(config),
            clipBehavior:
                widget.clipBehavior ?? config?.clipBehavior ?? Clip.antiAlias,
            style: _style,
            child: buttonChild,
          );
        } else if (type == ButtonType.text) {
          child = TextButton(
            key: key,
            onPressed: _getCallBack(config),
            clipBehavior:
                widget.clipBehavior ?? config?.clipBehavior ?? Clip.antiAlias,
            style: _style,
            child: buttonChild,
          );
        } else {
          child = ElevatedButton(
            key: key,
            onPressed: _getCallBack(config),
            clipBehavior:
                widget.clipBehavior ?? config?.clipBehavior ?? Clip.antiAlias,
            style: _style,
            child: buttonChild,
          );
        }
        return child;
      },
    );
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
    if (state != _ButtonState.initial) {
      _controller.animateTo(0.0);
      return;
    }
    _controller.forward();
    _setButtonState(_ButtonState.loading);
    callBack().then((d) {
      _setButtonState(_ButtonState.initial);
      _controller.animateTo(0.0);
    }).catchError((c) {
      _setButtonState(_ButtonState.initial);
      _controller.animateTo(0.0);
    });
  }

  Widget _buildChild(ProgressButtonConfig? config) {
    return Builder(
      builder: (ctx) {
        var style = DefaultTextStyle.of(ctx).style;
        return ProgressIndicatorTheme(
          data: ProgressIndicatorTheme.of(context).copyWith(
            circularTrackColor: style.color,
          ),
          child: state == _ButtonState.initial
              ? _buildInnerChild(config)
              : Center(child: loadingIndicator(config)),
        );
      },
    );
  }

  Widget _buildInnerChild(ProgressButtonConfig? config) {
    var circularLoader = loadingIndicator(config);

    if (state == _ButtonState.loading) {
      return circularLoader;
    }

    return widget.child;
  }
}

class _MaterialStatePropertyTween<T> extends Tween<MaterialStateProperty<T>?> {
  final Tween<T> Function(Set<MaterialState> states) tween;
  _MaterialStatePropertyTween({required this.tween}) : super();

  @override
  MaterialStateProperty<T>? lerp(double t) {
    return MaterialStateProperty.resolveWith((states) {
      return tween(states).transform(t);
    });
  }

  @override
  MaterialStateProperty<T>? transform(double t) {
    return lerp(t);
  }
}

class _VisualDestinyTween extends Tween<VisualDensity?> {
  _VisualDestinyTween({
    VisualDensity? end,
    VisualDensity? begin,
  }) : super(begin: begin, end: end);

  @override
  VisualDensity? lerp(double t) {
    if (begin == null) return end;
    if (end == null) return begin;
    return VisualDensity.lerp(begin!, end!, t);
  }
}

class OutlinedBorderTween extends Tween<OutlinedBorder?> {
  OutlinedBorderTween({
    OutlinedBorder? end,
    OutlinedBorder? begin,
  }) : super(begin: begin, end: end);

  @override
  OutlinedBorder? lerp(double t) {
    var res = ShapeBorder.lerp(begin, end, t);
    if (res is OutlinedBorder) {
      return res;
    }
    return begin ?? end;
  }
}
