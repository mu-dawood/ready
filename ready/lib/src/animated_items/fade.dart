part of animated_items;

/// 🔥 change opacity from [from] to [to]
class FadeAnimation extends Equatable {
  final double from;
  final double to;
  const FadeAnimation({
    this.from = 0,
    this.to = 1,
  });
  @override
  List<Object?> get props => [from, to];
}
