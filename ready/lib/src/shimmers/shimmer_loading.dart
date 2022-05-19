part of shimmers;

/// use this to wrap every element you want to add shimmer effect to it
/// if [enabled] is `false` then  there is no effect
/// You must use this in the child tree of [ShimmerScope]
class Shimmer extends StatefulWidget {
  const Shimmer({
    Key? key,
    this.enabled = true,
    required this.child,
  }) : super(key: key);

  /// specify if shimmer effect is enabled
  final bool enabled;
  final Widget child;

  @override
  _ShimmerState createState() => _ShimmerState();
}

class _ShimmerState extends State<Shimmer> {
  Listenable? _shimmerChanges;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_shimmerChanges != null) {
      _shimmerChanges!.removeListener(_onShimmerChange);
    }
    _shimmerChanges = _ShimmerScope.of(context)?.shimmerChanges;
    if (_shimmerChanges != null) {
      _shimmerChanges!.addListener(_onShimmerChange);
    }
  }

  @override
  void dispose() {
    _shimmerChanges?.removeListener(_onShimmerChange);
    super.dispose();
  }

  void _onShimmerChange() {
    if (widget.enabled) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return _build(context);
  }

  Widget _build(BuildContext context) {
    if (!widget.enabled) {
      return widget.child;
    }

    // Collect ancestor shimmer info.
    final shimmer = _ShimmerScope.of(context);
    if (shimmer == null) {
      return widget.child;
    }
    final shimmerSize = shimmer.size;
    if (shimmerSize == null) {
      return Opacity(
        opacity: 0,
        child: widget.child,
      );
    }

    var box = context.findRenderObject() as RenderBox?;

    if (box == null || !box.hasSize) {
      return Opacity(
        opacity: 0,
        child: widget.child,
      );
    }
    final gradient = shimmer.gradient;
    final offsetWithinShimmer = shimmer.getDescendantOffset(descendant: box);

    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) {
        return gradient.createShader(
          Rect.fromLTWH(
            -offsetWithinShimmer.dx,
            -offsetWithinShimmer.dy,
            shimmerSize.width,
            shimmerSize.height,
          ),
        );
      },
      child: Opacity(
        opacity: 1,
        child: widget.child,
      ),
    );
  }
}
