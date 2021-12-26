part of animated_items;

class FadeItem extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;
  const FadeItem({
    Key? key,
    this.duration = const Duration(milliseconds: 400),
    required this.child,
    this.curve = Curves.easeInCubic,
  }) : super(key: key);

  static Widget index({
    Key? key,
    duration = const Duration(milliseconds: 400),
    required Widget child,
    required int index,
    Curve curve = Curves.easeInCubic,
    bool? firstBuild,
  }) =>
      Builder(
        builder: (BuildContext context) {
          return AnimatedItemConfig(
            index: index,
            child: FadeItem(
              key: key,
              curve: curve,
              duration: duration,
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
        return Opacity(
          opacity: t,
          child: child,
        );
      },
    );
  }
}
