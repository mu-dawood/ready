import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'config.dart';
import 'ready_form/ready_form.dart';

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
  bool get isLoading => _key.currentState?._loading == true;
}

class ProgressButton extends StatefulWidget {
  final Future Function()? onPressed;

  final Widget child;

  /// loading indicator for progress button
  final Widget? loadingIndicator;

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
    this.duration = const Duration(milliseconds: 400),
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
  State<ProgressButton> createState() => _ProgressButtonState();
}

class _ProgressButtonState extends State<ProgressButton> {
  bool _loading = false;
  final GlobalKey _childKey = GlobalKey();
  double? _nextSize;
  ButtonStyle style(BuildContext context) {
    var style = widget.style ??
        ProgressButtonConfig.of(context)?.style ??
        const ButtonStyle();
    var bgColor = Theme.of(context).progressIndicatorTheme.circularTrackColor;
    return style.copyWith(
      animationDuration: duration(context),
      backgroundColor: _loading.onTrue(MaterialStateProperty.all(bgColor)),
      side: _loading.onTrue(MaterialStateProperty.all(BorderSide.none)),
      fixedSize: _loading.onTrue(MaterialStateProperty.all(null)),
      minimumSize: _loading.onTrue(MaterialStateProperty.all(Size.zero)),
      shape: _loading.onTrue(
        MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Duration duration(BuildContext context) {
    ProgressButtonConfig? config = ProgressButtonConfig.of(context);
    return widget.duration ??
        config?.duration ??
        const Duration(milliseconds: 300);
  }

  ButtonType type(ProgressButtonConfig? config) {
    return widget.type ?? config?.type ?? ButtonType.elevated;
  }

  Widget loadingIndicator() {
    return Builder(
      builder: (BuildContext context) {
        var color = DefaultTextStyle.of(context).style.color;
        ProgressButtonConfig? config = ProgressButtonConfig.of(context);
        return ProgressIndicatorTheme(
          data: ProgressIndicatorTheme.of(context).copyWith(
            circularTrackColor: color,
            linearTrackColor: color,
          ),
          child: widget.loadingIndicator ??
              config?.loadingIndicator ??
              const CircularProgressIndicator(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var config = ProgressButtonConfig.of(context);
    return WillPopScope(
      onWillPop: () async {
        if (_loading || widget.onCancelRequest == null) {
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
    var callBack =
        widget.onPressed ?? (auto ? ReadyForm.of(context)?.onSubmit : null);
    if (callBack != null) return () => _onCallBack(callBack, config);
    return null;
  }

  Widget _buildChild() {
    if (_loading) {
      if (_nextSize != null) {
        return SizedBox(
          width: _nextSize!,
          height: _nextSize!,
          child: Transform.scale(
            scale: 1.3,
            child: loadingIndicator(),
          ),
        );
      }
      return SizedBox(
        width: 30,
        height: 30,
        child: loadingIndicator(),
      );
    }
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(duration(context));
      var childSize = _childKey.currentContext?.size;
      if (childSize != null) {
        _nextSize = min(childSize.width, childSize.height);
      }
    });
    return SizedBox(
      key: _childKey,
      child: widget.child,
    );
  }

  Widget _child() {
    var d = duration(context);
    return AnimatedSize(
      duration: d,
      child: _buildChild(),
    );
  }

  Widget _build(BuildContext context, ProgressButtonConfig? config) {
    var type = this.type(config);
    late Widget child;
    if (type == ButtonType.outlined) {
      child = OutlinedButton(
        onPressed: _getCallBack(config),
        clipBehavior: widget.clipBehavior ?? config?.clipBehavior ?? Clip.none,
        style: style(context),
        child: _child(),
      );
    } else if (type == ButtonType.text) {
      child = TextButton(
        onPressed: _getCallBack(config),
        clipBehavior: widget.clipBehavior ?? config?.clipBehavior ?? Clip.none,
        style: style(context),
        child: _child(),
      );
    } else {
      child = ElevatedButton(
        onPressed: _getCallBack(config),
        clipBehavior: widget.clipBehavior ?? config?.clipBehavior ?? Clip.none,
        style: style(context),
        child: _child(),
      );
    }

    return child;
  }

  void _completeAction(
      Future<dynamic> Function() callBack, ProgressButtonConfig? config) {
    setState(() {
      _loading = true;
    });
    callBack().then((d) async {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }).catchError((c) async {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    });
  }

  void _onCallBack(
      Future<dynamic> Function() callBack, ProgressButtonConfig? config) {
    if (!_loading) {
      _completeAction(callBack, config);
    }
  }
}

extension _BoolExt on bool {
  T? onTrue<T>(T item) {
    if (this) {
      return item;
    }
    return null;
  }
}
