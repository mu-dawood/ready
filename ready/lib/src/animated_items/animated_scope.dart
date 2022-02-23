part of animated_items;

class AnimatedItemsScope extends StatefulWidget {
  final Widget child;
  final Duration? delay;
  const AnimatedItemsScope({
    Key? key,
    required this.child,
    this.delay,
  }) : super(key: key);

  @override
  AnimatedItemsScopeState createState() => AnimatedItemsScopeState();

  static AnimatedItemsScopeState? of(BuildContext context) {
    return context.findAncestorStateOfType<AnimatedItemsScopeState>();
  }
}

class AnimatedItemsScopeState extends State<AnimatedItemsScope> {
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
        var milliseconds =
            last.duration!.inMilliseconds ~/ ((count == 0 ? 0 : count / 4) + 4);
        delay = Duration(milliseconds: milliseconds);
      }

      _current.add(controller);
      fn() {
        if (last.isCompleted) {
          controller.forward().then((value) {
            _current.remove(controller);
          }).catchError((e) {
            _remove(controller);
          });
          last.removeListener(fn);
        } else if (last.lastElapsedDuration != null) {
          if (last.lastElapsedDuration! >= delay!) {
            if (_current.contains(controller)) {
              controller.forward().then((value) {
                _current.remove(controller);
              });
            }
            last.removeListener(fn);
          }
        }
      }

      last.addListener(fn);
    }
  }

  void _remove(AnimationController controller) {
    var index = _current.indexOf(controller);
    if (index < 0) return;
    if (_current.remove(controller)) {
      if (_current.length > index && _current[index].isDismissed) {
        _current[index].forward();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
