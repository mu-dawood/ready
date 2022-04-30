part of '../context_extension.dart';

extension TimeOfDayValidationExtension<T> on FieldValidator<T, TimeOfDay> {
  DateTime _dateTime(TimeOfDay timeOfDay) {
    var now = DateTime.now();
    return DateTime(
        now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
  }

  /// check if the value is after [other]
  FieldValidator<T, TimeOfDay> isAfterFn(ValueGetter<TimeOfDay> other,
      [MessageCallBack<TimeOfDay>? message]) {
    return next((messages, value) {
      var _other = other();
      if (!value.isAfter(_other)) {
        return message?.call(messages, value) ??
            messages.isTimeAfter(_dateTime(value), _dateTime(_other));
      }
      return null;
    });
  }

  /// check if the value is after [other]
  FieldValidator<T, TimeOfDay> isAfter(TimeOfDay other,
      [MessageCallBack<TimeOfDay>? message]) {
    return isAfterFn(() => other, message);
  }

  /// check if the value is after [other] or at the same moment
  FieldValidator<T, TimeOfDay> isAfterOrEqualFn(ValueGetter<TimeOfDay> other,
      [MessageCallBack<TimeOfDay>? message]) {
    return next((messages, value) {
      var _other = other();

      if (!value.isAfter(_other) && !value.isAtSameMomentAs(_other)) {
        return message?.call(messages, value) ??
            messages.isTimeAfterOrEqual(_dateTime(value), _dateTime(_other));
      }
      return null;
    });
  }

  /// check if the value is after [other] or at the same moment
  FieldValidator<T, TimeOfDay> isAfterOrEqual(TimeOfDay other,
      [MessageCallBack<TimeOfDay>? message]) {
    return isAfterOrEqualFn(() => other, message);
  }

  /// check if the value is before [other]
  FieldValidator<T, TimeOfDay> isBeforeFn(ValueGetter<TimeOfDay> other,
      [MessageCallBack<TimeOfDay>? message]) {
    return next((messages, value) {
      var _other = other();
      if (!value.isBefore(_other)) {
        return message?.call(messages, value) ??
            messages.isTimeBefore(_dateTime(value), _dateTime(_other));
      }
      return null;
    });
  }

  /// check if the value is before [other]
  FieldValidator<T, TimeOfDay> isBefore(TimeOfDay other,
      [MessageCallBack<TimeOfDay>? message]) {
    return isBeforeFn(() => other, message);
  }

  /// check if the value is before [other] or at the same moment
  FieldValidator<T, TimeOfDay> isBeforeOrEqualFn(ValueGetter<TimeOfDay> other,
      [MessageCallBack<TimeOfDay>? message]) {
    return next((messages, value) {
      var _other = other();
      if (!value.isBefore(_other) && !value.isAtSameMomentAs(_other)) {
        return message?.call(messages, value) ??
            messages.isTimeBeforeOrEqual(_dateTime(value), _dateTime(_other));
      }
      return null;
    });
  }

  /// check if the value is before [other] or at the same moment
  FieldValidator<T, TimeOfDay> isBeforeOrEqual(TimeOfDay other,
      [MessageCallBack<TimeOfDay>? message]) {
    return isBeforeOrEqualFn(() => other, message);
  }

  /// check if the value is between [min] and [max]
  FieldValidator<T, TimeOfDay> isBetweenFn(
      ValueGetter<TimeOfDay> min, ValueGetter<TimeOfDay> max,
      [MessageCallBack<TimeOfDay>? message]) {
    return next((messages, value) {
      var _min = min();
      var _max = max();

      if (!value.isAfter(_min) || !value.isBefore(_max)) {
        return message?.call(messages, value) ??
            messages.isTimeBetween(
                _dateTime(value), _dateTime(_min), _dateTime(_max));
      }
      return null;
    });
  }

  /// check if the value is between [min] and [max]
  FieldValidator<T, TimeOfDay> isBetween(TimeOfDay min, TimeOfDay max,
      [MessageCallBack<TimeOfDay>? message]) {
    return isBetweenFn(() => min, () => max, message);
  }

  /// check if the value is between [min] and [max] or equal any of them
  FieldValidator<T, TimeOfDay> isBetweenOrEqualFn(
      ValueGetter<TimeOfDay> min, ValueGetter<TimeOfDay> max,
      [MessageCallBack<TimeOfDay>? message]) {
    return next((messages, value) {
      var _min = min();
      var _max = max();
      if (value.isBefore(_min) || value.isAfter(_max)) {
        return message?.call(messages, value) ??
            messages.isTimeBetweenOrEqual(
                _dateTime(value), _dateTime(_min), _dateTime(_max));
      }
      return null;
    });
  }

  /// check if the value is between [min] and [max] or equal any of them
  FieldValidator<T, TimeOfDay> isBetweenOrEqual(TimeOfDay min, TimeOfDay max,
      [MessageCallBack<TimeOfDay>? message]) {
    return isBetweenOrEqualFn(() => min, () => max, message);
  }
}

extension _TimeOfDayCompare on TimeOfDay {
  int _timeStamp(TimeOfDay timeOfDay) {
    return timeOfDay.hour * 60 + timeOfDay.minute;
  }

  bool isAfter(TimeOfDay other) {
    return _timeStamp(this) > _timeStamp(other);
  }

  bool isBefore(TimeOfDay other) {
    return _timeStamp(this) < _timeStamp(other);
  }

  bool isAtSameMomentAs(TimeOfDay other) {
    return _timeStamp(this) == _timeStamp(other);
  }
}
