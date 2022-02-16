import 'enums.dart';

/// helper utils fro this package
/// not exportable
class Utils {
  /// detect layout according to passed [width]
  static LayoutType detectLayout(double width) {
    if (width <= 320) {
      return LayoutType.xSmall;
    } else if (width <= 640) {
      return LayoutType.small;
    } else if (width <= 960) {
      return LayoutType.medium;
    } else if (width <= 1024) {
      return LayoutType.large;
    } else if (width <= 1366) {
      return LayoutType.xLarge;
    } else {
      return LayoutType.xxLarge;
    }
  }
}
