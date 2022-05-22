part of '../context_extension.dart';

extension NumberValidationExtension<T> on FieldValidator<T, num> {
  /// check if the value is less than [max]
  FieldValidator<T, num> lessThanFn(ValueGetter<num> max,
      [MessageCallBack<num>? message]) {
    return next((messages, value) {
      var maximum = max();
      if (value >= maximum) {
        return message?.call(messages, value) ??
            messages.lessThan(value, maximum);
      }
      return null;
    });
  }

  /// check if the value is less than [max]
  FieldValidator<T, num> lessThan(num max, [MessageCallBack<num>? message]) =>
      lessThanFn(() => max, message);

  /// check if the value is greater than  [min]
  FieldValidator<T, num> greaterThanFn(ValueGetter<num> min,
      [MessageCallBack<num>? message]) {
    return next((messages, value) {
      var minimum = min();
      if (value <= minimum) {
        return message?.call(messages, value) ??
            messages.greaterThan(value, minimum);
      }
      return null;
    });
  }

  /// check if the value is greater than  [min]
  FieldValidator<T, num> greaterThan(num min,
          [MessageCallBack<num>? message]) =>
      greaterThanFn(() => min, message);

  /// check if the value is between [min] and [max]
  FieldValidator<T, num> isBetweenFn(ValueGetter<num> min, ValueGetter<num> max,
      [MessageCallBack<num>? message]) {
    return next((messages, value) {
      var maximum = max();
      var minimum = min();
      if (value <= minimum || value >= maximum) {
        return message?.call(messages, value) ??
            messages.isBetween(value, minimum, maximum);
      }
      return null;
    });
  }

  /// check if the value is between [min] and [max]
  FieldValidator<T, num> isBetween(num min, num max,
          [MessageCallBack<num>? message]) =>
      isBetweenFn(() => min, () => max, message);

  /// check if the value is greater than or equal [max]
  FieldValidator<T, num> lessThanOrEqualFn(ValueGetter<num> max,
      [MessageCallBack<num>? message]) {
    return next((messages, value) {
      var maximum = max();
      if (value > maximum) {
        return message?.call(messages, value) ??
            messages.lessThanOrEqual(value, maximum);
      }
      return null;
    });
  }

  /// check if the value is greater than or equal [max]
  FieldValidator<T, num> lessThanOrEqual(num max,
          [MessageCallBack<num>? message]) =>
      lessThanOrEqualFn(() => max, message);

  /// check if the value is less than or equal [min]
  FieldValidator<T, num> greaterThanOrEqualFn(ValueGetter<num> min,
      [MessageCallBack<num>? message]) {
    return next((messages, value) {
      var minimum = min();
      if (value < minimum) {
        return message?.call(messages, value) ??
            messages.greaterThanOrEqual(value, minimum);
      }
      return null;
    });
  }

  /// check if the value is less than or equal [min]
  FieldValidator<T, num> greaterThanOrEqual(num min,
          [MessageCallBack<num>? message]) =>
      greaterThanOrEqualFn(() => min, message);

  /// check if the value is between [min] and [max] and equal them
  FieldValidator<T, num> isBetweenOrEqualFn(
      ValueGetter<num> min, ValueGetter<num> max,
      [MessageCallBack<num>? message]) {
    return next((messages, value) {
      var maximum = max();
      var minimum = min();
      if (value < minimum || value > maximum) {
        return message?.call(messages, value) ??
            messages.isBetweenOrEqual(value, minimum, maximum);
      }
      return null;
    });
  }

  /// check if the value is between [min] and [max] and equal them
  FieldValidator<T, num> isBetweenOrEqual(num min, num max,
          [MessageCallBack<num>? message]) =>
      isBetweenOrEqualFn(() => min, () => max, message);

  /// check if the value is divisible by [other]
  FieldValidator<T, num> isDivisibleByFn(ValueGetter<num> other,
      [MessageCallBack<num>? message]) {
    return next((messages, value) {
      var oth = other();
      if (value % oth != 0) {
        return message?.call(messages, value) ??
            messages.isDivisibleBy(value, oth);
      }
      return null;
    });
  }

  /// check if the value is divisible by [other]
  FieldValidator<T, num> isDivisibleBy(num other,
          [MessageCallBack<num>? message]) =>
      isDivisibleByFn(() => other, message);

  /// check if the value is negative
  FieldValidator<T, num> isNegative([MessageCallBack<num>? message]) {
    return next((messages, value) {
      if (!value.isNegative) {
        return message?.call(messages, value) ?? messages.isNegative(value);
      }
      return null;
    });
  }

  /// check if the value is positive
  FieldValidator<T, num> isPositive([MessageCallBack<num>? message]) {
    return next((messages, value) {
      if (value.isNegative) {
        return message?.call(messages, value) ?? messages.isPositive(value);
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
        return message?.call(messages, value) ?? messages.isEven(value);
      }
      return null;
    });
  }

  /// check if the value is even number
  FieldValidator<T, int> isOdd([MessageCallBack<int>? message]) {
    return next((messages, value) {
      if (!value.isOdd) {
        return message?.call(messages, value) ?? messages.isOdd(value);
      }
      return null;
    });
  }
}
