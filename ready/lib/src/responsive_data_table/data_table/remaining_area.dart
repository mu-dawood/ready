part of responsive_data_table;

class SliverRemainingArea extends StatelessWidget {
  const SliverRemainingArea({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return _SliverRemainingAreaAndOverScroll(child: child);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<Widget>(
        'child',
        child,
      ),
    );
    properties.add(IterableProperty<String>('mode', <String>['nonscrollable']));
  }
}

class _SliverRemainingAreaAndOverScroll extends SingleChildRenderObjectWidget {
  const _SliverRemainingAreaAndOverScroll({
    super.child,
  });

  @override
  RenderSliverRemainingAreaAndOverScroll createRenderObject(
          BuildContext context) =>
      RenderSliverRemainingAreaAndOverScroll();
}

class RenderSliverRemainingAreaAndOverScroll
    extends RenderSliverSingleBoxAdapter {
  RenderSliverRemainingAreaAndOverScroll({super.child});

  @override
  void performLayout() {
    final SliverConstraints constraints = this.constraints;
    final double extent =
        constraints.remainingPaintExtent + constraints.overlap - 56;
    if (child != null) {
      child!.layout(constraints.asBoxConstraints(
        minExtent: extent,
        maxExtent: extent,
      ));
    }

    final double paintedChildSize =
        calculatePaintOffset(constraints, from: 0.0, to: extent);
    assert(paintedChildSize.isFinite);
    assert(paintedChildSize >= 0.0);
    geometry = SliverGeometry(
      scrollExtent: constraints.viewportMainAxisExtent,
      paintExtent: paintedChildSize,
      maxPaintExtent: paintedChildSize,
      hasVisualOverflow: extent > constraints.remainingPaintExtent ||
          constraints.scrollOffset > 0.0,
    );
    if (child != null) {
      setChildParentData(child!, constraints, geometry!);
    }
  }
}
