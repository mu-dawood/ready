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
  final GlobalKey _buttonKey = GlobalKey();
  Size? nextSize;
  ButtonStyle style(BuildContext context) {
    var style = widget.style ??
        ProgressButtonConfig.of(context)?.style ??
        const ButtonStyle();
    var bgColor = Theme.of(context).progressIndicatorTheme.circularTrackColor;

    return style.copyWith(
      animationDuration: duration(context),
      backgroundColor: _loading.onTrue(MaterialStateProperty.all(bgColor)),
      // minimumSize: _loading.onTrue(MaterialStateProperty.all(Size.zero)),
      padding:
          _loading.onTrue(MaterialStateProperty.all(const EdgeInsets.all(5))),
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
    if (widget.onPressed != null) {
      return () => _onCallBack(widget.onPressed!, config);
    }
    var auto = widget.autoSubmitForm ?? config?.autoSubmitForm ?? true;
    if (auto && ReadyForm.of(context) != null) {
      return () => _onCallBack(ReadyForm.of(context)!.onSubmit, config);
    }
    return null;
  }

  Widget _buildChild() {
    return Builder(
      builder: (BuildContext context) {
        if (_loading) {
          return AspectRatio(
            aspectRatio: 1,
            child: loadingIndicator(),
          );
        }
        //  key: _buttonKey,
        //     width: buttonSize,
        //     height: buttonSize,
print(context.w)
        return SizedBox(
          child: widget.child,
        );
      },
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
    Size? size = (_loading ? nextSize : null);
    var buttonSize = size == null ? null : min(size.width, size.height);
    if (type == ButtonType.outlined) {
      return OutlinedButton(
        onPressed: _getCallBack(config),
        clipBehavior: widget.clipBehavior ?? config?.clipBehavior ?? Clip.none,
        style: style(context),
        child: _child(),
      );
    } else if (type == ButtonType.text) {
      return TextButton(
        onPressed: _getCallBack(config),
        clipBehavior: widget.clipBehavior ?? config?.clipBehavior ?? Clip.none,
        style: style(context),
        child: _child(),
      );
    } else {
      return ElevatedButton(
        onPressed: _getCallBack(config),
        clipBehavior: widget.clipBehavior ?? config?.clipBehavior ?? Clip.none,
        style: style(context),
        child: _child(),
      );
    }
  }

  void _completeAction(
      Future<dynamic> Function() callBack, ProgressButtonConfig? config) {
    setState(() {
      nextSize = _buttonKey.currentContext?.size;
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
