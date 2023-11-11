library animated_items;

import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

part 'animated_scope.dart';
part 'fade.dart';
part 'flip.dart';
part 'scale.dart';
part 'translate.dart';

class _DefaultWidgetBuilder {
  final Widget child;

  const _DefaultWidgetBuilder(this.child);

  Widget call(double v) {
    return child;
  }
}

abstract class TransformAnimation extends Equatable {
  const TransformAnimation();
  void handle(Matrix4 transform, double t);
}

class Animated extends StatefulWidget {
  final Duration duration;
  final Curve curve;
  final List<TransformAnimation> transforms;
  final FadeAnimation? fade;
  final FractionalOffset alignment;
  final Widget Function(double value) builder;
  factory Animated({
    Key? key,
    Duration duration = const Duration(milliseconds: 400),
    Curve curve = Curves.easeInOutCirc,
    FadeAnimation? fade,
    List<TransformAnimation> transforms = const [],
    FractionalOffset alignment = FractionalOffset.center,
    required Widget child,
  }) =>
      Animated.builder(
        builder: _DefaultWidgetBuilder(child),
        key: key,
        duration: duration,
        curve: curve,
        transforms: transforms,
        fade: fade,
        alignment: alignment,
      );

  const Animated.builder({
    Key? key,
    this.duration = const Duration(milliseconds: 400),
    this.curve = Curves.easeInOutCirc,
    this.transforms = const [],
    this.fade,
    this.alignment = FractionalOffset.center,
    required this.builder,
  }) : super(key: key);

  @override
  State<Animated> createState() => _AnimatedState();
}

class _AnimatedState extends State<Animated> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  AnimatedItemsScopeState? _scope;
  void _setAnimation() {
    _animation = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: widget.curve));
  }

  @override
  void didUpdateWidget(covariant Animated oldWidget) {
    super.didUpdateWidget(oldWidget);
    var oldTransforms = oldWidget.transforms;
    var transforms = widget.transforms;

    var oldFade = oldWidget.fade;
    var fade = widget.fade;

    var oldDuration = oldWidget.duration;
    var duration = widget.duration;

    var oldAlign = oldWidget.alignment;
    var align = widget.alignment;
    if (oldAlign != align ||
        oldDuration != duration ||
        oldFade != fade ||
        !listEquals(oldTransforms, transforms)) {
      _controller.duration = widget.duration;
      _setAnimation();
      _controller.value = 0.0;
      _scope?._remove(_controller);
      _scope?._add(this);
    }
  }

  @override
  void didChangeDependencies() {
    _scope = AnimatedItemsScope.of(context);
    var duration = widget.duration;
    _controller = AnimationController(
      vsync: this,
      duration: duration,
      reverseDuration: duration,
    );
    _setAnimation();
    if (_scope != null) {
      _scope!._add(this);
    } else {
      _controller.forward();
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _scope?._remove(_controller);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, snapshot) {
        var t = _animation.value;
        var transform = Matrix4.identity();
        transform.setEntry(3, 2, 0.001);
        for (var tr in widget.transforms) {
          tr.handle(transform, t);
        }
        return Opacity(
          opacity: widget.fade == null
              ? 1
              : Tween(begin: widget.fade!.from, end: widget.fade!.to)
                  .transform(t),
          child: Transform(
            transform: transform,
            alignment: widget.alignment,
            child: widget.builder(t),
          ),
        );
      },
    );
  }
}
