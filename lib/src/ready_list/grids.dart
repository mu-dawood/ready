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

  static SliverStaggeredGridDelegate columns_1(int? length) => fit(length, 1, 1);
  static SliverStaggeredGridDelegate columns_2(int? length) => fit(length, 2, 1);
  static SliverStaggeredGridDelegate columns_3(int? length) => fit(length, 3, 1);
  static SliverStaggeredGridDelegate columns_4(int? length) => fit(length, 4, 1);
  static SliverStaggeredGridDelegate columns_5(int? length) => fit(length, 5, 1);
  static SliverStaggeredGridDelegate columns_6(int? length) => fit(length, 6, 1);

  static SliverStaggeredGridDelegate responsive({
    required BuildContext context,
    required int? length,
    SliverStaggeredGridDelegate? small,
    SliverStaggeredGridDelegate? medium,
    SliverStaggeredGridDelegate? large,
    SliverStaggeredGridDelegate? extraLarge,
  }) {
    var width = MediaQuery.of(context).size.width;
    if (width <= 600) {
      return small ?? medium ?? large ?? extraLarge ?? Grids.columns_1(length);
    } else if (width <= 768) {
      return medium ?? large ?? small ?? extraLarge ?? Grids.columns_2(length);
    } else if (width <= 992) {
      return large ?? extraLarge ?? medium ?? small ?? Grids.columns_3(length);
    } else {
      return extraLarge ?? large ?? medium ?? small ?? Grids.columns_4(length);
    }
  }
}
