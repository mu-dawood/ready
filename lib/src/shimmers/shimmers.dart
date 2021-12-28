library shimmers;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

part 'default_shimmer.dart';
part 'shimmer_loading.dart';

typedef GradientGetterCallback = Gradient Function(GradientTransform transform);

class _ShimmerScope extends StatefulWidget {
  static _ShimmerScopeState? of(BuildContext context) {
    return context.findAncestorStateOfType<_ShimmerScopeState>();
  }

  const _ShimmerScope({
    Key? key,
    required this.gradient,
    this.child,
  }) : super(key: key);

  final GradientGetterCallback gradient;
  final Widget? child;

  @override
  _ShimmerScopeState createState() => _ShimmerScopeState();
}

class _ShimmerScopeState extends State<_ShimmerScope>
    with SingleTickerProviderStateMixin {
  late AnimationController _shimmerScopeController;
  Size? _size;
  Size get size => _size!;

  @override
  void initState() {
    super.initState();
    _shimmerScopeController = AnimationController.unbounded(vsync: this)
      ..repeat(min: -0.5, max: 1.5, period: const Duration(milliseconds: 1000));

    SchedulerBinding.instance!.addPostFrameCallback((_) {
      var box = context.findRenderObject();
      if (box != null && box is RenderBox) {
        if (_size != box.size) {
          setState(() {
            _size = box.size;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _shimmerScopeController.dispose();
    super.dispose();
  }

  Gradient get gradient => widget.gradient(
      _SlidingGradientTransform(slidePercent: _shimmerScopeController.value));

  Offset getDescendantOffset(
      {required RenderBox descendant, Offset offset = Offset.zero}) {
    final shimmerBox = context.findRenderObject();
    return descendant.localToGlobal(offset, ancestor: shimmerBox);
  }

  Listenable get shimmerChanges => _shimmerScopeController;

  @override
  Widget build(BuildContext context) {
    if (_size == null) return const SizedBox();
    return widget.child ?? const SizedBox();
  }
}

class _SlidingGradientTransform extends GradientTransform {
  const _SlidingGradientTransform({
    required this.slidePercent,
  });

  final double slidePercent;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * slidePercent, 0.0, 0.0);
  }
}
