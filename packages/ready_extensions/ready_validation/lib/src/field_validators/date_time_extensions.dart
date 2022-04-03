part of '../context_extension.dart';

extension NumberValidationExtension<T> on FieldValidator<T, DateTime> {
  /// check if the value is after [other]
  FieldValidator<T, DateTime> isAfter(DateTime other,
      [MessageCallBack<DateTime>? message]) {
    return _next((messages, value) {
      if (!value.isAfter(other)) {
        return message?.call(value) ?? messages.isAfter(false, value, other);
      }
      return null;
    });
  }

  /// check if the value is after [other] or at the same moment
  FieldValidator<T, DateTime> isAfterOrEqual(DateTime other,
      [MessageCallBack<DateTime>? message]) {
    return _next((messages, value) {
      if (!value.isAfter(other) && !value.isAtSameMomentAs(other)) {
        return message?.call(value) ?? messages.isAfter(true, value, other);
      }
      return null;
    });
  }

  /// check if the value is before [other]
  FieldValidator<T, DateTime> isBefore(DateTime other,
      [MessageCallBack<DateTime>? message]) {
    return _next((messages, value) {
      if (!value.isBefore(other)) {
        return message?.call(value) ?? messages.isBefore(false, value, other);
      }
      return null;
    });
  }

  /// check if the value is before [other] or at the same moment
  FieldValidator<T, DateTime> isBeforeOrEqual(DateTime other,
      [MessageCallBack<DateTime>? message]) {
    return _next((messages, value) {
      if (!value.isBefore(other) && !value.isAtSameMomentAs(other)) {
        return message?.call(value) ?? messages.isBefore(true, value, other);
      }
      return null;
    });
  }

  /// check if the value is between [min] and [max]
  FieldValidator<T, DateTime> isBetween(DateTime min, DateTime max,
      [MessageCallBack<DateTime>? message]) {
    return _next((messages, value) {
      if (!value.isAfter(min) && value.isBefore(max)) {
        return message?.call(value) ??
            messages.isDateBetween(false, value, min, max);
      }
      return null;
    });
  }

  /// check if the value is between [min] and [max] or equal any of them
  FieldValidator<T, DateTime> isBetweenOrEqual(DateTime min, DateTime max,
      [MessageCallBack<DateTime>? message]) {
    return _next((messages, value) {
      if (value.isBefore(min) || value.isAfter(max)) {
        return message?.call(value) ??
            messages.isDateBetween(true, value, min, max);
      }
      return null;
    });
  }
}
