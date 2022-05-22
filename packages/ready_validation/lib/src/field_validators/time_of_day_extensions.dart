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
      var oth = other();
      if (!value.isAfter(oth)) {
        return message?.call(messages, value) ??
            messages.isTimeAfter(_dateTime(value), _dateTime(oth));
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
      var oth = other();

      if (!value.isAfter(oth) && !value.isAtSameMomentAs(oth)) {
        return message?.call(messages, value) ??
            messages.isTimeAfterOrEqual(_dateTime(value), _dateTime(oth));
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
      var oth = other();
      if (!value.isBefore(oth)) {
        return message?.call(messages, value) ??
            messages.isTimeBefore(_dateTime(value), _dateTime(oth));
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
      var oth = other();
      if (!value.isBefore(oth) && !value.isAtSameMomentAs(oth)) {
        return message?.call(messages, value) ??
            messages.isTimeBeforeOrEqual(_dateTime(value), _dateTime(oth));
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
      var minimum = min();
      var maximum = max();

      if (!value.isAfter(minimum) || !value.isBefore(maximum)) {
        return message?.call(messages, value) ??
            messages.isTimeBetween(
                _dateTime(value), _dateTime(minimum), _dateTime(maximum));
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
      var minimum = min();
      var maximum = max();
      if (value.isBefore(minimum) || value.isAfter(maximum)) {
        return message?.call(messages, value) ??
            messages.isTimeBetweenOrEqual(
                _dateTime(value), _dateTime(minimum), _dateTime(maximum));
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
