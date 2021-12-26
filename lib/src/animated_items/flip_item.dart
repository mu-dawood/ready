part of animated_items;

class FlipItem extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;
  final FractionalOffset? alignment;
  const FlipItem({
    Key? key,
    this.duration = const Duration(milliseconds: 400),
    required this.child,
    this.curve = Curves.easeInCubic,
    this.alignment,
  }) : super(key: key);
  static const double degrees2Radians = pi / 180;
  static Widget index({
    Key? key,
    Duration duration = const Duration(milliseconds: 400),
    required Widget child,
    required int index,
    Curve curve = Curves.easeInCubic,
    FractionalOffset? alignment,
    bool? firstBuild,
  }) =>
      Builder(
        builder: (BuildContext context) {
          return AnimatedItemConfig(
            index: index,
            child: FlipItem(
              key: key,
              alignment: alignment,
              curve: curve,
              duration: duration,
              child: child,
            ),
          );
        },
      );
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return _AnimatedItem(
          scope: AnimatedItemsScope.of(context),
          index: AnimatedItemConfig.of(context)?.index,
          duration: duration,
          curve: curve,
          builder: (t) {
            return Transform(
              alignment: alignment ?? FractionalOffset.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY((180 - 180 * t) * degrees2Radians),
              child: child,
            );
          },
        );
      },
    );
  }
}
