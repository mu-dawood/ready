part of animated_items;

class SlideItem extends StatelessWidget {
  final Widget child;
  final Duration duration;

  final Offset Function(BoxConstraints constraints)? offset;
  final Curve curve;
  const SlideItem({
    Key? key,
    this.duration = const Duration(milliseconds: 400),
    required this.child,
    this.offset,
    this.curve = Curves.easeInCubic,
  }) : super(key: key);

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
            return Transform.translate(
              offset: Offset(_offset.dx * (1 - t), _offset.dy * (1 - t)),
              child: child,
            );
          },
        );
      },
    );
  }
}
