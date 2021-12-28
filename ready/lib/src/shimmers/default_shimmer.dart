part of shimmers;

/// Specify the scope for [Shimmer]
/// This will paint the shimmer gradient on all [Shimmer] childs in its tree
class ShimmerScope extends StatelessWidget {
  final Widget child;

  /// Get the gradiant of the shimmer effect
  /// if [gradient] is null the it will use this
  /// its important to use [transform] passed in the callback
  /// ```
  /// LinearGradient(
  ///   colors: [
  ///     Theme.of(context).cardColor,
  ///     Theme.of(context).backgroundColor,
  ///     Theme.of(context).cardColor,
  ///   ],
  ///   stops: const [0.1, 0.3, 0.4],
  ///   begin: const Alignment(-1.0, -0.3),
  ///   end: const Alignment(1.0, 0.3),
  ///   tileMode: TileMode.clamp,
  ///   transform: transform,
  /// )
  /// ```
  final GradientGetterCallback? gradient;
  const ShimmerScope({Key? key, required this.child, this.gradient})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _ShimmerScope(
      gradient: gradient ??
          (transform) => LinearGradient(
                colors: [
                  Theme.of(context).cardColor,
                  Theme.of(context).backgroundColor,
                  Theme.of(context).cardColor,
                ],
                stops: const [0.1, 0.3, 0.4],
                begin: const Alignment(-1.0, -0.3),
                end: const Alignment(1.0, 0.3),
                tileMode: TileMode.clamp,
                transform: transform,
              ),
      child: child,
    );
  }
}
