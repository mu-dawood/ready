extension BooleanExtensions on bool? {
  /// When true this will return call back
  /// When false or null this will return other
  T? onTrue<T>(T callback, [T? otherCallBack]) {
    if (this == true) {
      return callback;
    } else {
      return otherCallBack;
    }
  }

  /// When true or null this will return call back
  /// When false this will return other
  T? onTrueOrNull<T>(T callback, [T? otherCallBack]) {
    if (this != false) {
      return callback;
    } else {
      return otherCallBack;
    }
  }

  /// When false or null this will return call back
  /// When true this will return other
  T? onFalseOrNull<T>(T callback, [T? otherCallBack]) {
    if (this != true) {
      return callback;
    } else {
      return otherCallBack;
    }
  }

  /// When false this will return call back
  /// When true or null this will return other
  T? onFalse<T>(T callback, [T? otherCallBack]) {
    if (this == false) {
      return callback;
    } else {
      return otherCallBack;
    }
  }

  /// convert `bool` to int with value `0` or `1` based on `boolean value`
  int get toInt => this! ? 1 : 0;
}
