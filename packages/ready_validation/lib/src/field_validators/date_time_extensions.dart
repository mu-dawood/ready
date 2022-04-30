part of '../context_extension.dart';

extension DateTimeValidationExtension<T> on FieldValidator<T, DateTime> {
  /// check if the value is after [other]
  FieldValidator<T, DateTime> isAfterFn(ValueGetter<DateTime> other,
      [MessageCallBack<DateTime>? message]) {
    return next((messages, value) {
      var _other = other();
      if (!value.isAfter(_other)) {
        return message?.call(messages, value) ??
            messages.isDateAfter(value, _other);
      }
      return null;
    });
  }

  /// check if the value is after [other]
  FieldValidator<T, DateTime> isAfter(DateTime other,
      [MessageCallBack<DateTime>? message]) {
    return isAfterFn(() => other, message);
  }

  /// check if the value is after [other] or at the same moment
  FieldValidator<T, DateTime> isAfterOrEqualFn(ValueGetter<DateTime> other,
      [MessageCallBack<DateTime>? message]) {
    return next((messages, value) {
      var _other = other();

      if (!value.isAfter(_other) && !value.isAtSameMomentAs(_other)) {
        return message?.call(messages, value) ??
            messages.isDateAfterOrEqual(value, _other);
      }
      return null;
    });
  }

  /// check if the value is after [other] or at the same moment
  FieldValidator<T, DateTime> isAfterOrEqual(DateTime other,
      [MessageCallBack<DateTime>? message]) {
    return isAfterOrEqualFn(() => other, message);
  }

  /// check if the value is before [other]
  FieldValidator<T, DateTime> isBeforeFn(ValueGetter<DateTime> other,
      [MessageCallBack<DateTime>? message]) {
    return next((messages, value) {
      var _other = other();
      if (!value.isBefore(_other)) {
        return message?.call(messages, value) ??
            messages.isDateBefore(value, _other);
      }
      return null;
    });
  }

  /// check if the value is before [other]
  FieldValidator<T, DateTime> isBefore(DateTime other,
      [MessageCallBack<DateTime>? message]) {
    return isBeforeFn(() => other, message);
  }

  /// check if the value is before [other] or at the same moment
  FieldValidator<T, DateTime> isBeforeOrEqualFn(ValueGetter<DateTime> other,
      [MessageCallBack<DateTime>? message]) {
    return next((messages, value) {
      var _other = other();
      if (!value.isBefore(_other) && !value.isAtSameMomentAs(_other)) {
        return message?.call(messages, value) ??
            messages.isDateBeforeOrEqual(value, _other);
      }
      return null;
    });
  }

  /// check if the value is before [other] or at the same moment
  FieldValidator<T, DateTime> isBeforeOrEqual(DateTime other,
      [MessageCallBack<DateTime>? message]) {
    return isBeforeOrEqualFn(() => other, message);
  }

  /// check if the value is between [min] and [max]
  FieldValidator<T, DateTime> isBetweenFn(
      ValueGetter<DateTime> min, ValueGetter<DateTime> max,
      [MessageCallBack<DateTime>? message]) {
    return next((messages, value) {
      var _min = min();
      var _max = max();

      if (!value.isAfter(_min) || !value.isBefore(_max)) {
        return message?.call(messages, value) ??
            messages.isDateBetween(value, _min, _max);
      }
      return null;
    });
  }

  /// check if the value is between [min] and [max]
  FieldValidator<T, DateTime> isBetween(DateTime min, DateTime max,
      [MessageCallBack<DateTime>? message]) {
    return isBetweenFn(() => min, () => max, message);
  }

  /// check if the value is between [min] and [max] or equal any of them
  FieldValidator<T, DateTime> isBetweenOrEqualFn(
      ValueGetter<DateTime> min, ValueGetter<DateTime> max,
      [MessageCallBack<DateTime>? message]) {
    return next((messages, value) {
      var _min = min();
      var _max = max();
      if (value.isBefore(_min) || value.isAfter(_max)) {
        return message?.call(messages, value) ??
            messages.isDateBetweenOrEqual(value, _min, _max);
      }
      return null;
    });
  }

  /// check if the value is between [min] and [max] or equal any of them
  FieldValidator<T, DateTime> isBetweenOrEqual(DateTime min, DateTime max,
      [MessageCallBack<DateTime>? message]) {
    return isBetweenOrEqualFn(() => min, () => max, message);
  }
}
