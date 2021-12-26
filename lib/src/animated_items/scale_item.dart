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

  @override
  Widget build(BuildContext context) {
    return _AnimatedItem(
      scope: AnimatedItemsScope.of(context),
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
