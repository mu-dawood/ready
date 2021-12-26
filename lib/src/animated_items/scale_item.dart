part of animated_items;

class ScaleItem extends StatelessWidget {
  final Widget child;
  final Duration duration;

  final double scale;
  final Curve curve;
  const ScaleItem({
    Key? key,
    this.duration = const Duration(milliseconds: 400),
    required this.child,
    this.scale = 0,
    this.curve = Curves.easeInCubic,
  }) : super(key: key);

  static Widget index({
    Key? key,
    Duration duration = const Duration(milliseconds: 400),
    required Widget child,
    required int index,
    final Curve curve = Curves.easeInCubic,
    double scale = 0,
    bool? firstBuild,
  }) =>
      Builder(
        builder: (BuildContext context) {
          return AnimatedItemConfig(
            index: index,
            child: ScaleItem(
              key: key,
              curve: curve,
              duration: duration,
              scale: scale,
              child: child,
            ),
          );
        },
      );
  @override
  Widget build(BuildContext context) {
    return _AnimatedItem(
      scope: AnimatedItemsScope.of(context),
      index: AnimatedItemConfig.of(context)?.index,
      duration: duration,
      curve: curve,
      builder: (t) {
        return Transform.scale(
          scale: scale + (1 - scale) * t,
          child: child,
        );
      },
    );
  }
}
