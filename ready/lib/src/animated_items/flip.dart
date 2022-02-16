part of animated_items;

enum FlipType {
  x,
  y,
  z,
  negativeX,
  negativeY,
  negativeZ,
}

/// - 🔥  flip widget  according to type
/// - 🔥  [FlipType.x] rotate x from (180) t (0)
/// - 🔥  [FlipType.y] rotate y from (180) t (0)
/// - 🔥  [FlipType.z] rotate y from (180) t (0)
/// - 🔥  [FlipType.negativeY] rotate y from (-180) t (0)
/// - 🔥  [FlipType.negativeX] rotate x from (-180) t (0)
/// - 🔥  [FlipType.negativeZ] rotate y from (-180) t (0)

class FlipAnimation extends TransformAnimation {
  double get degrees2Radians => pi / 180;
  final FlipType type;
  const FlipAnimation(this.type) : super();
  @override
  List<Object?> get props => [type];

  @override
  void handle(Matrix4 transform, double t) {
    switch (type) {
      case FlipType.x:
        transform.rotateX((180 - 180 * t) * degrees2Radians);
        return;
      case FlipType.y:
        transform.rotateY((180 - 180 * t) * degrees2Radians);
        return;
      case FlipType.z:
        transform.rotateZ((180 - 180 * t) * degrees2Radians);
        return;

      case FlipType.negativeX:
        transform.rotateX((-180 + 180 * t) * degrees2Radians);
        return;
      case FlipType.negativeY:
        transform.rotateY((-180 + 180 * t) * degrees2Radians);
        return;
      case FlipType.negativeZ:
        transform.rotateZ((-180 + 180 * t) * degrees2Radians);
        return;
    }
  }
}
