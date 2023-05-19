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
  bool get isLoading => _key.currentState?.loading == true;
}

// class ProgressButton extends StatefulWidget {
//   final Future Function()? onPressed;

//   final Widget child;

//   /// loading indicator for progress button
//   final Widget? loadingIndicator;

//   /// progress animation duration default is 300 ms
//   final Duration? duration;

//   /// clipBehavior
//   final Clip? clipBehavior;

//   /// style for the button
//   final ButtonStyle? style;

//   /// default button type default is elevated
//   final ButtonType? type;

//   /// whether or not to submit parent form
//   final bool? autoSubmitForm;

//   /// title for the  cancel dialog
//   final Widget? cancelRequestTitle;

//   /// content for the  cancel dialog
//   final Widget? cancelRequestContent;

//   /// disable taping and editing form fields while submitting defaults to [false]
//   final bool? disableEditingOnSubmit;

//   /// override yes button
//   final Widget? yes;

//   /// override no button
//   final Widget? no;

//   /// if specified will show a dialog when user try to pop and the form is [submitting]
//   final VoidCallback? onCancelRequest;
//   ProgressButton({
//     ProgressButtonKey? key,
//     this.onPressed,
//     required this.child,
//     this.duration = const Duration(milliseconds: 400),
//     this.clipBehavior,
//     this.onCancelRequest,
//     this.cancelRequestTitle,
//     this.cancelRequestContent,
//     this.disableEditingOnSubmit,
//     this.yes,
//     this.no,
//     this.style,
//     this.autoSubmitForm,
//     this.type,
//     this.loadingIndicator,
//   }) : super(key: key?._key);

//   @override
//   State<ProgressButton> createState() => _ProgressButtonState();
// }

// class _ProgressButtonState extends State<ProgressButton> {
//   bool _loading = false;
//   final GlobalKey _buttonKey = GlobalKey();
//   Size? nextSize;
//   ButtonStyle style(BuildContext context) {
//     var style = widget.style ??
//         ProgressButtonConfig.of(context)?.style ??
//         const ButtonStyle();
//     var bgColor = Theme.of(context).progressIndicatorTheme.circularTrackColor;

//     return style.copyWith(
//       animationDuration: duration(context),
//       backgroundColor: _loading.onTrue(MaterialStateProperty.all(bgColor)),
//       // minimumSize: _loading.onTrue(MaterialStateProperty.all(Size.zero)),
//       padding:
//           _loading.onTrue(MaterialStateProperty.all(const EdgeInsets.all(5))),
//       shape: _loading.onTrue(
//         MaterialStateProperty.all(
//           RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(50),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   Duration duration(BuildContext context) {
//     ProgressButtonConfig? config = ProgressButtonConfig.of(context);
//     return widget.duration ??
//         config?.duration ??
//         const Duration(milliseconds: 300);
//   }

//   ButtonType type(ProgressButtonConfig? config) {
//     return widget.type ?? config?.type ?? ButtonType.elevated;
//   }

//   Widget loadingIndicator() {
//     return Builder(
//       builder: (BuildContext context) {
//         var color = DefaultTextStyle.of(context).style.color;
//         ProgressButtonConfig? config = ProgressButtonConfig.of(context);
//         return ProgressIndicatorTheme(
//           data: ProgressIndicatorTheme.of(context).copyWith(
//             circularTrackColor: color,
//             linearTrackColor: color,
//           ),
//           child: widget.loadingIndicator ??
//               config?.loadingIndicator ??
//               const CircularProgressIndicator(),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     var config = ProgressButtonConfig.of(context);
//     return WillPopScope(
//       onWillPop: () async {
//         if (_loading || widget.onCancelRequest == null) {
//           return true;
//         }
//         var res = await showDialog(
//           context: context,
//           builder: (ctx) {
//             return CancelDialog(
//               cancelRequestContent: widget.cancelRequestContent,
//               cancelRequestTitle: widget.cancelRequestTitle,
//               yes: widget.yes,
//               no: widget.no,
//               config: ReadyFormConfig.of(context),
//               onCancelRequest: widget.onCancelRequest!,
//             );
//           },
//         );
//         return res == "yes";
//       },
//       child: _build(context, config),
//     );
//   }

//   Widget _buildChild() {
//     return Builder(
//       builder: (BuildContext context) {
//         if (_loading) {
//           return AspectRatio(
//             aspectRatio: 1,
//             child: loadingIndicator(),
//           );
//         }
//         //  key: _buttonKey,
//         //     width: buttonSize,
//         //     height: buttonSize,
// // print(context.w)
//         return SizedBox(
//           child: widget.child,
//         );
//       },
//     );
//   }

//   Widget _child() {
//     var d = duration(context);
//     return AnimatedSize(
//       duration: d,
//       child: _buildChild(),
//     );
//   }

//   Widget _build(BuildContext context, ProgressButtonConfig? config) {
//     var type = this.type(config);
//     Size? size = (_loading ? nextSize : null);
//     var buttonSize = size == null ? null : min(size.width, size.height);
//     if (type == ButtonType.outlined) {
//       return OutlinedButton(
//         onPressed: _getCallBack(config),
//         clipBehavior: widget.clipBehavior ?? config?.clipBehavior ?? Clip.none,
//         style: style(context),
//         child: _child(),
//       );
//     } else if (type == ButtonType.text) {
//       return TextButton(
//         onPressed: _getCallBack(config),
//         clipBehavior: widget.clipBehavior ?? config?.clipBehavior ?? Clip.none,
//         style: style(context),
//         child: _child(),
//       );
//     } else {
//       return ElevatedButton(
//         onPressed: _getCallBack(config),
//         clipBehavior: widget.clipBehavior ?? config?.clipBehavior ?? Clip.none,
//         style: style(context),
//         child: _child(),
//       );
//     }
//   }
// }

// extension _BoolExt on bool {
//   T? onTrue<T>(T item) {
//     if (this) {
//       return item;
//     }
//     return null;
//   }
// }

class ProgressButton extends StatelessWidget {
  final Future Function()? onPressed;

  final Widget child;

  /// loading indicator for progress button
  final Widget? loadingIndicator;

  /// default button type default is elevated
  final ButtonType? type;

  /// disable taping and editing form fields while submitting defaults to [false]
  final bool? disableEditingOnSubmit;

  /// override yes button
  final Widget? yes;

  /// override no button
  final Widget? no;

  /// title for the  cancel dialog
  final Widget? cancelRequestTitle;

  /// content for the  cancel dialog
  final Widget? cancelRequestContent;

  /// if specified will show a dialog when user try to pop and the form is [submitting]
  final VoidCallback? onCancelRequest;

  /// whether or not to submit parent form
  final bool? autoSubmitForm;

  /// progress animation duration default is 300 ms
  final Duration? duration;

  //----   Button properties

  /// Called when a pointer enters or exits the button response area.
  ///
  /// The value passed to the callback is true if a pointer has entered this
  /// part of the material and false if a pointer has exited this part of the
  /// material.
  final ValueChanged<bool>? onHover;

  /// Handler called when the focus changes.
  ///
  /// Called with true if this widget's node gains focus, and false if it loses
  /// focus.
  final ValueChanged<bool>? onFocusChange;

  /// Customizes this button's appearance.
  ///
  /// Non-null properties of this style override the corresponding
  /// properties in [themeStyleOf] and [defaultStyleOf]. [MaterialStateProperty]s
  /// that resolve to non-null values will similarly override the corresponding
  /// [MaterialStateProperty]s in [themeStyleOf] and [defaultStyleOf].
  ///
  /// Null by default.
  final ButtonStyle? style;

  /// {@macro flutter.material.Material.clipBehavior}
  ///
  /// Defaults to [Clip.none], and must not be null.
  final Clip clipBehavior;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// {@macro flutter.material.inkwell.statesController}
  final MaterialStatesController? statesController;

  ProgressButton({
    ProgressButtonKey? key,
    this.onPressed,
    required this.child,
    this.duration = const Duration(milliseconds: 400),
    this.clipBehavior = Clip.none,
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
    this.onHover,
    this.onFocusChange,
    this.focusNode,
    this.autofocus = true,
    this.statesController,
  }) : super(key: key?._key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return _ProgressButton(
          autoSubmitForm: autoSubmitForm,
          onPressed: onPressed,
          duration: duration,
          key: key,
          builder: ({
            required BuildContext context,
            required Animation<double> loading,
            required void Function()? onPressed,
          }) {
            if (constraints.maxWidth == constraints.minWidth) {
              return Center(
                child: _animated(
                    loading, onPressed, Size.fromWidth(constraints.maxWidth)),
              );
            }
            return _animated(loading, onPressed, null);
          },
          cancelRequestContent: cancelRequestContent,
          cancelRequestTitle: cancelRequestTitle,
          no: no,
          onCancelRequest: onCancelRequest,
          yes: yes,
        );
      },
    );
  }

  AnimatedBuilder _animated(
      Animation<double> loading, void Function()? onPressed, Size? size) {
    return AnimatedBuilder(
        animation: loading,
        builder: (context, _) {
          var buttontype = type ??
              ProgressButtonConfig.of(context)?.type ??
              ButtonType.elevated;
          switch (buttontype) {
            case ButtonType.elevated:
              return _ElevatedButton(
                onPressed: onPressed,
                loading: loading.value,
                sizeFrom: size,
                autofocus: autofocus,
                clipBehavior: clipBehavior,
                focusNode: focusNode,
                onFocusChange: onFocusChange,
                onHover: onHover,
                statesController: statesController,
                style: style,
                child: AnimatedSize(
                  duration: const Duration(seconds: 1),
                  child: _child(context, loading.value),
                ),
              );
            case ButtonType.outlined:
              return _OutlinedButton(
                onPressed: onPressed,
                loading: loading.value,
                autofocus: autofocus,
                clipBehavior: clipBehavior,
                sizeFrom: size,
                focusNode: focusNode,
                onFocusChange: onFocusChange,
                onHover: onHover,
                statesController: statesController,
                style: style,
                child: AnimatedSize(
                  duration: const Duration(seconds: 1),
                  child: _child(context, loading.value),
                ),
              );
            case ButtonType.text:
              return _TextButton(
                onPressed: onPressed,
                loading: loading.value,
                autofocus: autofocus,
                clipBehavior: clipBehavior,
                sizeFrom: size,
                focusNode: focusNode,
                onFocusChange: onFocusChange,
                onHover: onHover,
                statesController: statesController,
                style: style,
                child: AnimatedSize(
                  duration: const Duration(seconds: 1),
                  child: _child(context, loading.value),
                ),
              );
          }
        });
  }

  Duration _duration(BuildContext context) {
    ProgressButtonConfig? config = ProgressButtonConfig.of(context);
    return duration ?? config?.duration ?? const Duration(milliseconds: 300);
  }

  Widget _child(BuildContext context, double loading) {
    late Widget res;
    if (loading > 0) {
      res = Builder(
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: AspectRatio(
              aspectRatio: 1,
              child: CircularProgressIndicator(
                color: DefaultTextStyle.of(context).style.color,
              ),
            ),
          );
        },
      );
    } else {
      res = child;
    }
    return AnimatedSwitcher(
      duration: _duration(context),
      child: res,
    );
  }
}

class _ElevatedButton extends ElevatedButton with _ButtonStyleButtonMixin {
  @override
  final double loading;
  @override
  final Size? sizeFrom;
  const _ElevatedButton({
    required this.loading,
    required super.onPressed,
    required super.onHover,
    required super.onFocusChange,
    required super.style,
    required super.focusNode,
    required super.autofocus,
    required super.clipBehavior,
    required super.statesController,
    required super.child,
    required this.sizeFrom,
  });
}

class _TextButton extends TextButton with _ButtonStyleButtonMixin {
  @override
  final double loading;
  @override
  final Size? sizeFrom;
  const _TextButton({
    required this.loading,
    required super.onPressed,
    required super.onHover,
    required super.onFocusChange,
    required super.style,
    required super.focusNode,
    required super.autofocus,
    required super.clipBehavior,
    required super.statesController,
    required super.child,
    required this.sizeFrom,
  });
}

class _OutlinedButton extends OutlinedButton with _ButtonStyleButtonMixin {
  @override
  final double loading;
  @override
  final Size? sizeFrom;

  const _OutlinedButton({
    required this.loading,
    required super.onPressed,
    required super.onHover,
    required super.onFocusChange,
    required super.style,
    required super.focusNode,
    required super.autofocus,
    required super.clipBehavior,
    required super.statesController,
    required super.child,
    required this.sizeFrom,
  });
}

mixin _ButtonStyleButtonMixin on ButtonStyleButton {
  double get loading;
  Size? get sizeFrom;
  MaterialStateProperty<Size?> minimumSize(ButtonStyle style,
      [Size Function(Size value)? resolve]) {
    return MaterialStateProperty.resolveWith((states) {
      var intial = style.minimumSize?.resolve(states);
      if (resolve == null) return intial;
      return resolve(intial ?? Size.zero);
    });
  }

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    var style = super.defaultStyleOf(context);
    var sizeTo = MaterialStateProperty.resolveWith((states) {
      var intial = style.minimumSize?.resolve(states) ?? Size.zero;
      var minOf = min(intial.width, intial.height);
      return Size(minOf, minOf);
    });

    return style.copyWith(
      minimumSize: MaterialStateProperty.resolveWith((states) {
        var minSize = style.minimumSize?.resolve(states) ?? Size.zero;
        if (sizeFrom != null) {
          minSize = Size(sizeFrom!.width, minSize.height);
        }
        return SizeTween(
          begin: minSize,
          end: sizeTo.resolve(states),
        ).transform(loading);
      }),
      maximumSize: MaterialStateProperty.resolveWith((states) {
        var maximumSize = style.maximumSize?.resolve(states);
        if (maximumSize == null || maximumSize.width == double.infinity) {
          var intialSize = context
              .findAncestorStateOfType<_ProgressButtonState>()
              ?.intialSize;
          if (intialSize != null) {
            maximumSize = Size(intialSize.width, intialSize.height);
          }
        }

        return SizeTween(
          begin: loading > 0 ? maximumSize : style.maximumSize?.resolve(states),
          end: sizeTo.resolve(states),
        ).transform(loading);
      }),
      padding: MaterialStateProperty.resolveWith((states) {
        var initial = style.padding?.resolve(states);
        var resolved = initial?.resolve(TextDirection.ltr);
        return EdgeInsetsGeometryTween(
          begin: initial,
          end: resolved?.copyWith(left: 0, right: 0),
        ).transform(loading);
      }),
      shape: MaterialStateProperty.resolveWith((states) {
        var intialShape = style.shape?.resolve({});
        return OutlinedBorderTween(
          begin: intialShape,
          end: intialShape == null
              ? null
              : RoundedRectangleBorder(
                  side: intialShape.side,
                  borderRadius: BorderRadius.circular(50)),
        ).transform(loading);
      }),
    );
  }
}

class OutlinedBorderTween extends Tween<OutlinedBorder?> {
  OutlinedBorderTween({super.begin, super.end});

  /// Returns the value this tween has at the given animation clock value.
  @override
  OutlinedBorder? lerp(double t) {
    return OutlinedBorder.lerp(begin, end, t);
  }
}

class _ProgressButton extends StatefulWidget {
  final Widget Function({
    required BuildContext context,
    required VoidCallback? onPressed,
    required Animation<double> loading,
  }) builder;

  final Future Function()? onPressed;
  final Widget? yes;
  final Widget? no;
  final Widget? cancelRequestTitle;
  final Widget? cancelRequestContent;
  final VoidCallback? onCancelRequest;
  final bool? autoSubmitForm;
  final Duration? duration;
  const _ProgressButton({
    super.key,
    required this.builder,
    required this.onPressed,
    required this.autoSubmitForm,
    required this.duration,
    required this.yes,
    required this.no,
    required this.cancelRequestTitle,
    required this.cancelRequestContent,
    required this.onCancelRequest,
  });

  @override
  State<_ProgressButton> createState() => _ProgressButtonState();
}

class _ProgressButtonState extends State<_ProgressButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Size? intialSize;
  bool get loading =>
      _controller.status == AnimationStatus.completed ||
      _controller.status == AnimationStatus.forward;
  Duration duration(BuildContext context) {
    ProgressButtonConfig? config = ProgressButtonConfig.of(context);
    return widget.duration ??
        config?.duration ??
        const Duration(milliseconds: 300);
  }

  @override
  void didChangeDependencies() {
    _controller = AnimationController(vsync: this, duration: duration(context));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      intialSize = context.size;
    });
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant _ProgressButton oldWidget) {
    if (oldWidget.duration != widget.duration) {
      _controller.duration = widget.duration;
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _completeAction(
      Future<dynamic> Function() callBack, ProgressButtonConfig? config) {
    _controller.forward();
    callBack().then((d) async {
      if (mounted) {
        _controller.reverse();
      }
    }).catchError((c) async {
      if (mounted) {
        _controller.reverse();
      }
    });
  }

  void _onCallBack(
      Future<dynamic> Function() callBack, ProgressButtonConfig? config) {
    switch (_controller.status) {
      case AnimationStatus.dismissed:
      case AnimationStatus.reverse:
        _completeAction(callBack, config);
        break;
      default:
        break;
    }
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (loading || widget.onCancelRequest == null) {
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
      child: widget.builder(
        context: context,
        onPressed: _getCallBack(ProgressButtonConfig.of(context)),
        loading: _controller,
      ),
    );
  }
}
