import 'dart:math';

import 'package:flutter/material.dart';

typedef OnCreateRevealChild = Widget Function(
    CircularRevealController controller);

abstract class CircularRevealController {
  Future reveal();
  Future unReveal();
}

class CircularReveal extends StatefulWidget {
  final OnCreateRevealChild build;
  final Color? revealColor;
  const CircularReveal({Key? key, required this.build, this.revealColor})
      : super(key: key);
  @override
  State<CircularReveal> createState() => _CircularRevealState();
}

class _CircularRevealState extends State<CircularReveal>
    with TickerProviderStateMixin
    implements CircularRevealController {
  late Animation _animation;
  late AnimationController ctrl;
  double _fraction = 0.0;
  @override
  void dispose() {
    ctrl.dispose();
    super.dispose();
  }

  @override
  void initState() {
    ctrl = AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(ctrl)
      ..addListener(() {
        setState(() {
          _fraction = _animation.value;
        });
      });

    super.initState();
  }

  @override
  Future reveal() async {
    try {
      await ctrl.forward();
      // ignore: empty_catches
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: CircularRevealPainter(
          widget.revealColor ?? Theme.of(context).colorScheme.secondary,
          _fraction,
          MediaQuery.of(context).size),
      child: widget.build(this),
    );
  }

  @override
  Future unReveal([Duration? delay = const Duration(milliseconds: 200)]) async {
    if (delay != null) await Future.delayed(delay);
    ctrl.reset();
  }
}

class CircularRevealPainter extends CustomPainter {
  final Color color;
  final double fraction;
  final Size screen;
  CircularRevealPainter(this.color, this.fraction, this.screen);
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    var radius = sqrt(
          pow(screen.width / 2, 2) + pow(screen.height / 2, 2),
        ) *
        fraction;
    radius += radius;
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), radius, paint);
  }

  @override
  bool shouldRepaint(CircularRevealPainter oldDelegate) {
    return oldDelegate.fraction != fraction;
  }
}
