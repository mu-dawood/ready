library animated_items;

import 'dart:math';

import 'package:flutter/material.dart';

part 'fade_item.dart';
part 'flip_item.dart';
part 'flip_slide_fade_item.dart';
part 'flip_slide_item.dart';
part 'scale_item.dart';
part 'slide_fade_item.dart';
part 'slide_item.dart';

class _AnimatedItem extends StatefulWidget {
  final Widget Function(double t) builder;
  final Duration duration;
  final Curve curve;
  final _AnimatedItemsScopeState? scope;
  final int? index;
  const _AnimatedItem({
    Key? key,
    required this.builder,
    required this.duration,
    required this.curve,
    required this.scope,
    required this.index,
  }) : super(key: key);
  @override
  __AnimatedItemState createState() => __AnimatedItemState();
}

class __AnimatedItemState extends State<_AnimatedItem> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    var _duration = widget.duration;
    _controller = AnimationController(
      vsync: this,
      duration: _duration,
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: widget.curve));

    var scope = widget.scope;
    if (scope != null) {
      scope._add(_controller);
    } else {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    var scope = widget.scope;
    scope?._remove(_controller);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animation,
        builder: (context, snapshot) {
          return widget.builder(_animation.value);
        });
  }
}

class AnimatedItemConfig extends InheritedWidget {
  final int index;
  const AnimatedItemConfig({
    Key? key,
    required Widget child,
    required this.index,
  }) : super(key: key, child: child);

  static AnimatedItemConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AnimatedItemConfig>();
  }

  @override
  bool updateShouldNotify(AnimatedItemConfig oldWidget) {
    return index != index;
  }
}

class AnimatedItemsScope extends StatefulWidget {
  final Widget child;
  final Duration? delay;
  const AnimatedItemsScope({
    Key? key,
    required this.child,
    this.delay,
  }) : super(key: key);

  @override
  _AnimatedItemsScopeState createState() => _AnimatedItemsScopeState();

  static _AnimatedItemsScopeState? of(BuildContext context) {
    return context.findAncestorStateOfType<_AnimatedItemsScopeState>();
  }
}

class _AnimatedItemsScopeState extends State<AnimatedItemsScope> {
  final List<AnimationController> _current = [];
  void _add(AnimationController controller) {
    if (_current.isEmpty) {
      _current.add(controller);
      controller.forward().then((value) {
        _current.remove(controller);
      });
    } else {
      var last = _current.last;

      var delay = widget.delay;
      if (delay == null) {
        var count = _current.where((element) => element.isDismissed).length;
        var milliseconds = last.duration!.inMilliseconds ~/ ((count == 0 ? 0 : count / 4) + 4);
        delay = Duration(milliseconds: milliseconds);
      }

      _current.add(controller);
      fn() {
        if (last.isCompleted) {
          controller.forward().then((value) {
            _current.remove(controller);
          });
          last.removeListener(fn);
        } else if (last.lastElapsedDuration != null) {
          if (last.lastElapsedDuration! >= delay!) {
            controller.forward().then((value) {
              _current.remove(controller);
            });
            last.removeListener(fn);
          }
        }
      }

      last.addListener(fn);
    }
  }

  void _remove(AnimationController controller) {
    var index = _current.indexOf(controller);
    if (_current.remove(controller)) {
      if (_current[index].isDismissed) {
        _current[index].forward();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
