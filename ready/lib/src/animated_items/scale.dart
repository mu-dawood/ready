part of animated_items;

/// - 🔥 scale all axis of widget
/// - 🔥 [fromX] and [toX] scales the x axis
/// - 🔥 [fromY] and [toY] scales the y axis
/// - 🔥 [fromZ] and [toZ] scales the z axis
class ScaleAnimation extends TransformAnimation {
  final double fromX;
  final double toX;
  final double fromY;
  final double toY;
  final double fromZ;
  final double toZ;
  const ScaleAnimation.scale({
    double from = 0,
    double to = 1,
  })  : fromX = from,
        fromY = from,
        fromZ = 1,
        toX = to,
        toY = to,
        toZ = 1;

  const ScaleAnimation.x({
    double from = 0,
    double to = 1,
  })  : fromX = from,
        fromY = 1,
        fromZ = 1,
        toX = to,
        toY = 1,
        toZ = 1;

  const ScaleAnimation.y({
    double from = 0,
    double to = 1,
  })  : fromX = 1,
        fromY = from,
        fromZ = 1,
        toX = 1,
        toY = to,
        toZ = 1;

  const ScaleAnimation.z({
    double from = 0,
    double to = 1,
  })  : fromX = 1,
        fromY = 1,
        fromZ = from,
        toX = 1,
        toY = 1,
        toZ = to;

  const ScaleAnimation.xyz({
    this.fromY = 0,
    this.toX = 1,
    this.fromX = 0,
    this.toY = 1,
    this.fromZ = 0,
    this.toZ = 1,
  });
  @override
  List<Object?> get props => [fromX, toX, fromY, toY, fromZ, toZ];

  @override
  void handle(Matrix4 transform, double t) {
    var x = Tween(begin: fromX, end: toX).transform(t);
    var y = Tween(begin: fromY, end: toY).transform(t);
    var z = Tween(begin: fromZ, end: toZ).transform(t);
    transform.scale(x, y, z);
  }
}
