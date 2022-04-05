part of '../context_extension.dart';

extension NumberValidationExtension<T> on FieldValidator<T, num> {
  /// check if the value is less than [max]
  FieldValidator<T, num> lessThan(num max, [MessageCallBack<num>? message]) {
    return next((messages, value) {
      if (value >= max) {
        return message?.call(value) ?? messages.lessThan(false, value, max);
      }
      return null;
    });
  }

  /// check if the value is greater than  [min]
  FieldValidator<T, num> greaterThan(num min, [MessageCallBack<num>? message]) {
    return next((messages, value) {
      if (value <= min) {
        return message?.call(value) ?? messages.greaterThan(false, value, min);
      }
      return null;
    });
  }

  /// check if the value is between [min] and [max]
  FieldValidator<T, num> isBetween(num min, num max,
      [MessageCallBack<num>? message]) {
    return next((messages, value) {
      if (value <= min || value >= max) {
        return message?.call(value) ??
            messages.isBetween(false, value, min, max);
      }
      return null;
    });
  }

  /// check if the value is greater than or equal [max]
  FieldValidator<T, num> lessThanOrEqual(num max,
      [MessageCallBack<num>? message]) {
    return next((messages, value) {
      if (value > max) {
        return message?.call(value) ?? messages.lessThan(true, value, max);
      }
      return null;
    });
  }

  /// check if the value is less than or equal [min]
  FieldValidator<T, num> greaterThanOrEqual(num min,
      [MessageCallBack<num>? message]) {
    return next((messages, value) {
      if (value < min) {
        return message?.call(value) ?? messages.greaterThan(true, value, min);
      }
      return null;
    });
  }

  /// check if the value is between [min] and [max] and equal them
  FieldValidator<T, num> isBetweenOrEqual(num min, num max,
      [MessageCallBack<num>? message]) {
    return next((messages, value) {
      if (value < min || value > max) {
        return message?.call(value) ??
            messages.isBetween(true, value, min, max);
      }
      return null;
    });
  }

  /// check if the value is divisible by [other]
  FieldValidator<T, num> isDivisibleBy(num other,
      [MessageCallBack<num>? message]) {
    return next((messages, value) {
      if (value % other != 0) {
        return message?.call(value) ?? messages.isDivisibleBy(value, other);
      }
      return null;
    });
  }

  /// check if the value is negative
  FieldValidator<T, num> isNegative([MessageCallBack<num>? message]) {
    return next((messages, value) {
      if (!value.isNegative) {
        return message?.call(value) ?? messages.isNegative(value);
      }
      return null;
    });
  }

  /// check if the value is positive
  FieldValidator<T, num> isPositive([MessageCallBack<num>? message]) {
    return next((messages, value) {
      if (value.isNegative) {
        return message?.call(value) ?? messages.isPositive(value);
      }
      return null;
    });
  }
}

extension IntegerValidationExtension<T> on FieldValidator<T, int> {
  /// check if the value is even number
  FieldValidator<T, int> isEven([MessageCallBack<int>? message]) {
    return next((messages, value) {
      if (!value.isEven) {
        return message?.call(value) ?? messages.isEven(value);
      }
      return null;
    });
  }

  /// check if the value is even number
  FieldValidator<T, int> isOdd([MessageCallBack<int>? message]) {
    return next((messages, value) {
      if (!value.isOdd) {
        return message?.call(value) ?? messages.isOdd(value);
      }
      return null;
    });
  }
}
