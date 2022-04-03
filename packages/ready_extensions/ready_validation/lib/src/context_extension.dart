import 'package:flutter/material.dart';
import 'package:ready_extensions/ready_extensions.dart';

import 'config.dart';
import 'messages/messages.dart';
import 'messages/messages_ar.dart';

part './field_validators/date_time_extensions.dart';
part './field_validators/list_extensions.dart';
part './field_validators/map_extensions.dart';
part './field_validators/number_extension.dart';
part './field_validators/string_validation.dart';
part 'field_validator.dart';

typedef MessageCallBack<T> = String Function(T value);

extension ValidationExtensions on BuildContext {
  ReadyValidationMessages get _messages =>
      ValidationMessagesConfig.of(this) ??
      ReadyValidationMessages.of(this) ??
      ReadyValidationMessagesAr();

  /// create [_FieldValidator] for [String]
  FieldValidator<String?> string([String? Function(String? value)? validate]) {
    return FieldValidator<String?>._(
      messages: _messages,
      validate: (value) => validate?.call(value),
    );
  }

  /// create [_FieldValidator] for [num]
  FieldValidator<num?> number([String? Function(num? value)? validate]) {
    return FieldValidator<num?>._(
      messages: _messages,
      validate: (value) => validate?.call(value),
    );
  }

  /// create [_FieldValidator] for [int]
  FieldValidator<int?> integer([String? Function(int? value)? validate]) {
    return FieldValidator<int?>._(
      messages: _messages,
      validate: (value) => validate?.call(value),
    );
  }

  /// create [_FieldValidator] for [double]
  FieldValidator<double?> decimal([String? Function(double? value)? validate]) {
    return FieldValidator<double?>._(
      messages: _messages,
      validate: (value) => validate?.call(value),
    );
  }

  /// create [_FieldValidator] for [bool]
  FieldValidator<bool?> boolean([String? Function(bool? value)? validate]) {
    return FieldValidator<bool?>._(
      messages: _messages,
      validate: (value) => validate?.call(value),
    );
  }

  /// create [_FieldValidator] for [DateTime]
  FieldValidator<DateTime?> dateTime(
      [String? Function(DateTime? value)? validate]) {
    return FieldValidator<DateTime?>._(
      messages: _messages,
      validate: (value) => validate?.call(value),
    );
  }

  /// create [_FieldValidator] for [TimeOfDay]
  FieldValidator<TimeOfDay?> timeOfDay(
      [String? Function(TimeOfDay? value)? validate]) {
    return FieldValidator<TimeOfDay?>._(
      messages: _messages,
      validate: (value) => validate?.call(value),
    );
  }

  /// create [_FieldValidator] for [List] of type [T]
  FieldValidator<List<T>?> list<T>(
      [String? Function(List<T>? value)? validate]) {
    return FieldValidator<List<T>?>._(
      messages: _messages,
      validate: (value) => validate?.call(value),
    );
  }

  /// create [_FieldValidator] for [Map] of key [K] and value [V]
  FieldValidator<Map<K, V>?> map<K, V>(
      [String? Function(Map<K, V>? value)? validate]) {
    return FieldValidator<Map<K, V>?>._(
      messages: _messages,
      validate: (value) => validate?.call(value),
    );
  }

  /// create [_FieldValidator] for any type of [T]
  FieldValidator<T?> validatorFor<T>([String? Function(T? value)? validate]) {
    return FieldValidator<T>._(
      messages: _messages,
      validate: (value) => validate?.call(value),
    );
  }
}

extension NullableStringValidationExtension<T> on FieldValidator<T?> {
  /// check if the value is required
  _FieldValidator<T?, T> required([MessageCallBack<T?>? message]) {
    return _next(
      (messages, value) =>
          value == null ? message?.call(value) ?? messages.required : null,
    ).transform((value) => value!);
  }
}

extension SharedValidationExtensions<T, R> on _FieldValidator<T, R> {
  /// check is the value is not  equal [value]
  _FieldValidator<T, R> notEqual(R value, [MessageCallBack<R>? message]) {
    return _next((messages, value) {
      if (value == value) {
        return message?.call(value) ?? messages.notEqual(value);
      }
      return null;
    });
  }

  /// check is the value is equal [value]
  _FieldValidator<T, R> equal(R value, [MessageCallBack<R>? message]) {
    return _next((messages, value) {
      if (value != value) {
        return message?.call(value) ?? messages.equal(value);
      }
      return null;
    });
  }

  /// check is the value is in [values]
  _FieldValidator<T, R> isIn(List<R> values, [MessageCallBack<R>? message]) {
    return _next((messages, value) {
      if (!values.contains(value)) {
        return message?.call(value) ?? messages.isIn(value, values);
      }
      return null;
    });
  }

  /// check is the value is not in [values]
  _FieldValidator<T, R> isNotIn(List<R> values, [MessageCallBack<R>? message]) {
    return _next((messages, value) {
      if (values.contains(value)) {
        return message?.call(value) ?? messages.isNotIn(value, values);
      }
      return null;
    });
  }

  /// check is the value is not in [values]
  _FieldValidator<T, R> validateWith(String? Function(R value) validator) {
    return _next((messages, value) {
      return validator(value);
    });
  }
}
