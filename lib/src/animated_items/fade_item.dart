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

  @override
  Widget build(BuildContext context) {
    return _AnimatedItem(
      scope: AnimatedItemsScope.of(context),
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
