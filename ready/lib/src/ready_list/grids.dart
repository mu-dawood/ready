part of ready_list;

class _ExtentGridDelegate {
  final double maxCrossAxisExtent;

  _ExtentGridDelegate(this.maxCrossAxisExtent);

  SliverSimpleGridDelegate call({
    required double width,
    required int? length,
  }) {
    return SliverSimpleGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: maxCrossAxisExtent);
  }
}

class Grids {
  static GridDelegateCallback extent(double maxCrossAxisExtent) =>
      _ExtentGridDelegate(maxCrossAxisExtent).call;

  static SliverSimpleGridDelegate columns_1({
    required double width,
    required int? length,
  }) =>
      const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1);

  static SliverSimpleGridDelegate columns_2({
    required double width,
    required int? length,
  }) =>
      const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2);

  static SliverSimpleGridDelegate columns_3({
    required double width,
    required int? length,
  }) =>
      const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3);

  static SliverSimpleGridDelegate columns_4({
    required double width,
    required int? length,
  }) =>
      const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4);
  static SliverSimpleGridDelegate columns_5({
    required double width,
    required int? length,
  }) =>
      const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5);
  static SliverSimpleGridDelegate columns_6({
    required double width,
    required int? length,
  }) =>
      const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 6);

  static SliverSimpleGridDelegate responsive({
    required double width,
    required int? length,
    SliverSimpleGridDelegate? small,
    SliverSimpleGridDelegate? medium,
    SliverSimpleGridDelegate? large,
    SliverSimpleGridDelegate? extraLarge,
  }) {
    var layout = Utils.detectLayout(width);
    switch (layout) {
      case LayoutType.xSmall:
      case LayoutType.small:
        return Grids.columns_1(width: width, length: length);
      case LayoutType.medium:
        return Grids.columns_2(width: width, length: length);
      case LayoutType.large:
        return Grids.columns_3(width: width, length: length);
      case LayoutType.xLarge:
        return Grids.columns_4(width: width, length: length);
      case LayoutType.xxLarge:
        return Grids.columns_5(width: width, length: length);
    }
  }
}
