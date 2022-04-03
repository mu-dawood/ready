import 'dart:async';

extension TimerExtensions on Timer {
  /// return `T` when timer is still active and not null else return null
  T? onActive<T>(T callback) {
    if (isActive) {
      return callback;
    } else {
      return null;
    }
  }

  /// return `T` when timer is still active or is null else return null
  T? onActiveOrNull<T>(T callback) {
    if (isActive) {
      return callback;
    } else {
      return null;
    }
  }

  /// return `T` when timer is not active or is null else return null
  T? onNotActiveOrNull<T>(T callback) {
    if (!isActive) {
      return callback;
    } else {
      return null;
    }
  }

  /// return `T` when timer is not active and not null else return null
  T? onNotActive<T>(T callback) {
    if (!isActive) {
      return callback;
    } else {
      return null;
    }
  }
}
