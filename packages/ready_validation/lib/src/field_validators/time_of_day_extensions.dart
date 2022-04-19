part of '../context_extension.dart';

extension TimeOfDayValidationExtension<T> on FieldValidator<T, TimeOfDay> {
  int _timeStamp(TimeOfDay timeOfDay) {
    return timeOfDay.hour * 60 + timeOfDay.minute;
  }

  DateTime _dateTime(TimeOfDay timeOfDay) {
    var now = DateTime.now();
    return DateTime(
        now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
  }

  /// check if the value is after [other]
  FieldValidator<T, TimeOfDay> isAfter(TimeOfDay other,
      [MessageCallBack<TimeOfDay>? message]) {
    return next((messages, value) {
      if (_timeStamp(value) <= _timeStamp(other)) {
        return message?.call(messages, value) ??
            messages.isTimeAfter(false, _dateTime(value), _dateTime(other));
      }
      return null;
    });
  }

  /// check if the value is after [other] or at the same moment
  FieldValidator<T, TimeOfDay> isAfterOrEqual(TimeOfDay other,
      [MessageCallBack<TimeOfDay>? message]) {
    return next((messages, value) {
      if (_timeStamp(value) < _timeStamp(other)) {
        return message?.call(messages, value) ??
            messages.isTimeAfter(true, _dateTime(value), _dateTime(other));
      }
      return null;
    });
  }

  /// check if the value is before [other]
  FieldValidator<T, TimeOfDay> isBefore(TimeOfDay other,
      [MessageCallBack<TimeOfDay>? message]) {
    return next((messages, value) {
      if (_timeStamp(value) >= _timeStamp(other)) {
        return message?.call(messages, value) ??
            messages.isTimeBefore(false, _dateTime(value), _dateTime(other));
      }
      return null;
    });
  }

  /// check if the value is before [other] or at the same moment
  FieldValidator<T, TimeOfDay> isBeforeOrEqual(TimeOfDay other,
      [MessageCallBack<TimeOfDay>? message]) {
    return next((messages, value) {
      if (_timeStamp(value) > _timeStamp(other)) {
        return message?.call(messages, value) ??
            messages.isTimeBefore(true, _dateTime(value), _dateTime(other));
      }
      return null;
    });
  }

  /// check if the value is between [min] and [max]
  FieldValidator<T, TimeOfDay> isBetween(TimeOfDay min, TimeOfDay max,
      [MessageCallBack<TimeOfDay>? message]) {
    return next((messages, value) {
      if (_timeStamp(value) <= _timeStamp(min) ||
          _timeStamp(value) >= _timeStamp(max)) {
        return message?.call(messages, value) ??
            messages.isTimeBetween(
                false, _dateTime(value), _dateTime(min), _dateTime(max));
      }
      return null;
    });
  }

  /// check if the value is between [min] and [max] or equal any of them
  FieldValidator<T, TimeOfDay> isBetweenOrEqual(TimeOfDay min, TimeOfDay max,
      [MessageCallBack<TimeOfDay>? message]) {
    return next((messages, value) {
      if (_timeStamp(value) < _timeStamp(min) ||
          _timeStamp(value) > _timeStamp(max)) {
        return message?.call(messages, value) ??
            messages.isTimeBetween(
                true, _dateTime(value), _dateTime(min), _dateTime(max));
      }
      return null;
    });
  }
}
