part of ready_list;

class Grids {
  static SliverStaggeredGridDelegate fit(
    int? length,
    int crossAxisCount,
    int fit,
  ) =>
      SliverStaggeredGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        staggeredTileCount: length,
        staggeredTileBuilder: (int index) => StaggeredTile.fit(fit),
      );

  static SliverStaggeredGridDelegate columns_2({
    required double width,
    required int? length,
  }) =>
      fit(length, 2, 1);
  static SliverStaggeredGridDelegate columns_1({
    required double width,
    required int? length,
  }) =>
      fit(length, 1, 1);
  static SliverStaggeredGridDelegate columns_3({
    required double width,
    required int? length,
  }) =>
      fit(length, 3, 1);
  static SliverStaggeredGridDelegate columns_4({
    required double width,
    required int? length,
  }) =>
      fit(length, 4, 1);
  static SliverStaggeredGridDelegate columns_5({
    required double width,
    required int? length,
  }) =>
      fit(length, 5, 1);
  static SliverStaggeredGridDelegate columns_6({
    required double width,
    required int? length,
  }) =>
      fit(length, 6, 1);

  static SliverStaggeredGridDelegate responsive({
    required double width,
    required int? length,
    SliverStaggeredGridDelegate? small,
    SliverStaggeredGridDelegate? medium,
    SliverStaggeredGridDelegate? large,
    SliverStaggeredGridDelegate? extraLarge,
  }) {
    var layout = Utils.detectLayout(width);
    switch (layout) {
      case LayoutType.xsmall:
      case LayoutType.small:
        return Grids.columns_1(width: width, length: length);
      case LayoutType.medium:
        return Grids.columns_2(width: width, length: length);
      case LayoutType.large:
        return Grids.columns_3(width: width, length: length);
      case LayoutType.xlarge:
        return Grids.columns_4(width: width, length: length);
      case LayoutType.xxlarge:
        return Grids.columns_5(width: width, length: length);
    }
  }
}
