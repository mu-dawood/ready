part of animated_items;

class FlipSlideFadeItem extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final Offset Function(BoxConstraints constraints)? offset;
  final Curve curve;
  final FractionalOffset? alignment;
  const FlipSlideFadeItem({
    Key? key,
    this.duration = const Duration(milliseconds: 400),
    required this.child,
    this.curve = Curves.easeInCubic,
    this.offset,
    this.alignment,
  }) : super(key: key);
  double get degrees2Radians => pi / 180;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var width =
            (constraints.maxWidth == double.infinity ? MediaQuery.of(context).size.width : constraints.maxWidth);
        var _offset = offset == null ? Offset(width, 0) : offset!(constraints);

        return _AnimatedItem(
          scope: AnimatedItemsScope.of(context),
          duration: duration,
          curve: curve,
          builder: (t) {
            return Opacity(
              opacity: 1,
              child: Transform(
                alignment: alignment ?? FractionalOffset.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..translate(
                    _offset.dx * (1 - t),
                    _offset.dy * (1 - t),
                  )
                  ..rotateY((180 - 180 * t) * degrees2Radians),
                child: child,
              ),
            );
          },
        );
      },
    );
  }
}
