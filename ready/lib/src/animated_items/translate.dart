part of animated_items;

/// 🔥 [fromX] and [toX] translate  the x axis
/// 🔥 [fromY] and [toY] translate  the y axis
/// 🔥 [fromZ] and [toZ] translate  the z axis

class TranslateAnimation extends TransformAnimation {
  final double fromX;
  final double toX;
  final double fromY;
  final double toY;
  final double fromZ;
  final double toZ;
  const TranslateAnimation.xy(
    double from, [
    double to = 0,
  ])  : fromX = from,
        fromY = from,
        fromZ = 0,
        toX = to,
        toY = to,
        toZ = 0;

  const TranslateAnimation.x(
    double from, [
    double to = 0,
  ])  : fromX = from,
        fromY = 0,
        fromZ = 0,
        toX = to,
        toY = 0,
        toZ = 0;

  const TranslateAnimation.y(
    double from, [
    double to = 0,
  ])  : fromX = 0,
        fromY = from,
        fromZ = 0,
        toX = 0,
        toY = to,
        toZ = 0;

  const TranslateAnimation.z(
    double from, [
    double to = 0,
  ])  : fromX = 0,
        fromY = 0,
        fromZ = from,
        toX = 0,
        toY = 0,
        toZ = to;

  const TranslateAnimation.xyz({
    required this.fromY,
    this.toX = 0,
    required this.fromX,
    this.toY = 0,
    required this.fromZ,
    this.toZ = 0,
  });
  @override
  List<Object?> get props => [fromX, toX, fromY, toY, fromZ, toZ];

  @override
  void handle(Matrix4 transform, double t) {
    var x = Tween(begin: fromX, end: toX).transform(t);
    var y = Tween(begin: fromY, end: toY).transform(t);
    var z = Tween(begin: fromZ, end: toZ).transform(t);
    transform.translate(x, y, z);
  }
}
