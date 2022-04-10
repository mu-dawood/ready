import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'config.dart';
import 'ready_form.dart';

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
  ProgressButton({
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
  }) : super(key: key?._key);

  @override
  _ProgressButtonState createState() => _ProgressButtonState();
}

class _ProgressButtonState extends State<ProgressButton>
    with TickerProviderStateMixin {
  GlobalKey key = GlobalKey();
  _ButtonState state = _ButtonState.initial;
  Size? size;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void _afterFirstFrame(Duration timeStamp) {
    size = key.currentContext?.size;
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
    return _build(context, config);
  }

  VoidCallback? _getCallBack(ProgressButtonConfig? config) {
    var auto = widget.autoSubmitForm ?? config?.autoSubmitForm ?? true;
    var _callBack =
        widget.onPressed ?? (auto ? ReadyForm.of(context)?.onSubmit : null);
    if (_callBack != null) return () => _onCallBack(_callBack, config);
    return null;
  }

  Widget _build(BuildContext context, ProgressButtonConfig? config) {
    if (state == _ButtonState.initial) {
      WidgetsBinding.instance!.addPostFrameCallback(_afterFirstFrame);
    }
    Widget buttonChild = AnimatedSize(
      alignment: Alignment.center,
      duration: duration(config),
      child: _buildChild(config),
    );

    var style = (this.style(config) ?? const ButtonStyle()).copyWith(
      padding: state == _ButtonState.initial
          ? null
          : MaterialStateProperty.all(const EdgeInsets.all(5)),
      minimumSize: state == _ButtonState.initial
          ? null
          : MaterialStateProperty.all(Size.zero),
      shape: state == _ButtonState.initial
          ? null
          : MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            )),
    );
    var type = this.type(config);

    if (type == ButtonType.outlined) {
      return AnimatedSize(
        duration: duration(config),
        child: OutlinedButton(
          onPressed: _getCallBack(config),
          clipBehavior:
              widget.clipBehavior ?? config?.clipBehavior ?? Clip.antiAlias,
          style: style,
          child: buttonChild,
        ),
      );
    }
    if (type == ButtonType.text) {
      return AnimatedSize(
        duration: duration(config),
        child: TextButton(
          onPressed: _getCallBack(config),
          clipBehavior:
              widget.clipBehavior ?? config?.clipBehavior ?? Clip.antiAlias,
          style: style,
          child: buttonChild,
        ),
      );
    } else {
      return AnimatedSize(
        duration: duration(config),
        child: ElevatedButton(
          onPressed: _getCallBack(config),
          clipBehavior:
              widget.clipBehavior ?? config?.clipBehavior ?? Clip.antiAlias,
          style: style,
          child: buttonChild,
        ),
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
    var _size = size == null ? null : min(size!.width, size!.height);
    return Builder(
      key: key,
      builder: (ctx) {
        return ProgressIndicatorTheme(
          data: ProgressIndicatorTheme.of(context).copyWith(
            circularTrackColor: DefaultTextStyle.of(ctx).style.color,
          ),
          child: state == _ButtonState.initial
              ? _buildInnerChild(config)
              : SizedBox(
                  width: _size,
                  height: _size,
                  child: _buildInnerChild(config),
                ),
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
