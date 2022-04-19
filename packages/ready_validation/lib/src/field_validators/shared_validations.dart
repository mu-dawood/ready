part of '../context_extension.dart';

extension NullableStringValidationExtension<T> on FieldValidator<T?, T?> {
  /// check if the value is required
  FieldValidator<T?, T> required([MessageCallBack<T?>? message]) {
    return next(
      (messages, value) {
        return value == null
            ? message?.call(messages, value) ?? messages.required
            : null;
      },
    ).transform((value) => value!);
  }
}

extension SharedValidationExtensions<T, R> on FieldValidator<T, R> {
  /// check is the value is not  equal [value]
  FieldValidator<T, R> notEqualFn(ValueGetter<R> value,
      [MessageCallBack<R>? message]) {
    return next((messages, v) {
      var _value = value();
      if (v == _value) {
        return message?.call(messages, v) ?? messages.notEqual(v);
      }
      return null;
    });
  }

  /// check is the value is not  equal [value]
  FieldValidator<T, R> notEqual(R value, [MessageCallBack<R>? message]) {
    return notEqualFn(() => value, message);
  }

  /// check is the value is equal [value]
  FieldValidator<T, R> equalFn(ValueGetter<R> value,
      [MessageCallBack<R>? message]) {
    return next((messages, v) {
      var _value = value();
      if (v != _value) {
        return message?.call(messages, v) ?? messages.equal(v);
      }
      return null;
    });
  }

  /// check is the value is equal [value]
  FieldValidator<T, R> equal(R value, [MessageCallBack<R>? message]) {
    return equalFn(() => value, message);
  }

  /// check is the value is in [values]
  FieldValidator<T, R> isInFn(ValueGetter<List<R>> values,
      [MessageCallBack<R>? message]) {
    return next((messages, value) {
      var _values = values();
      if (!_values.contains(value)) {
        return message?.call(messages, value) ?? messages.isIn(value, _values);
      }
      return null;
    });
  }

  /// check is the value is in [values]
  FieldValidator<T, R> isIn(List<R> values, [MessageCallBack<R>? message]) {
    return isInFn(() => values, message);
  }

  /// check is the value is not in [values]
  FieldValidator<T, R> notInFn(ValueGetter<List<R>> values,
      [MessageCallBack<R>? message]) {
    return next((messages, value) {
      var _values = values();
      if (_values.contains(value)) {
        return message?.call(messages, value) ??
            messages.isNotIn(value, _values);
      }
      return null;
    });
  }

  /// check is the value is not in [values]
  FieldValidator<T, R> notIn(List<R> values, [MessageCallBack<R>? message]) {
    return notInFn(() => values, message);
  }

  /// check is the value is not in [values]
  FieldValidator<T, R> validateWith(
      String? Function(R value, ReadyValidationMessages messages) validator) {
    return next((messages, value) {
      return validator(value, messages);
    });
  }
}
