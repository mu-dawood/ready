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
part 'type_extension.dart';

typedef MessageCallBack<T> = String Function(T value);

extension ValidationExtensions on BuildContext {
  ReadyValidationMessages get _messages =>
      ValidationMessagesConfig.of(this) ??
      ReadyValidationMessages.of(this) ??
      ReadyValidationMessagesAr();

  /// create [_FieldValidator] for [String]
  _FieldValidator<String?> string([String? Function(String? value)? validate]) {
    return _FieldValidator<String?>._(
      messages: _messages,
      validate: (value) => validate?.call(value),
    );
  }

  /// create [_FieldValidator] for [num]
  _FieldValidator<num?> number([String? Function(num? value)? validate]) {
    return _FieldValidator<num?>._(
      messages: _messages,
      validate: (value) => validate?.call(value),
    );
  }

  /// create [_FieldValidator] for [int]
  _FieldValidator<int?> integer([String? Function(int? value)? validate]) {
    return _FieldValidator<int?>._(
      messages: _messages,
      validate: (value) => validate?.call(value),
    );
  }

  /// create [_FieldValidator] for [double]
  _FieldValidator<double?> decimal(
      [String? Function(double? value)? validate]) {
    return _FieldValidator<double?>._(
      messages: _messages,
      validate: (value) => validate?.call(value),
    );
  }

  /// create [_FieldValidator] for [bool]
  _FieldValidator<bool?> boolean([String? Function(bool? value)? validate]) {
    return _FieldValidator<bool?>._(
      messages: _messages,
      validate: (value) => validate?.call(value),
    );
  }

  /// create [_FieldValidator] for [DateTime]
  _FieldValidator<DateTime?> dateTime(
      [String? Function(DateTime? value)? validate]) {
    return _FieldValidator<DateTime?>._(
      messages: _messages,
      validate: (value) => validate?.call(value),
    );
  }

  /// create [_FieldValidator] for [TimeOfDay]
  _FieldValidator<TimeOfDay?> timeOfDay(
      [String? Function(TimeOfDay? value)? validate]) {
    return _FieldValidator<TimeOfDay?>._(
      messages: _messages,
      validate: (value) => validate?.call(value),
    );
  }

  /// create [_FieldValidator] for [List] of type [T]
  _FieldValidator<List<T>?> list<T>(
      [String? Function(List<T>? value)? validate]) {
    return _FieldValidator<List<T>?>._(
      messages: _messages,
      validate: (value) => validate?.call(value),
    );
  }

  /// create [_FieldValidator] for [Map] of key [K] and value [V]
  _FieldValidator<Map<K, V>?> map<K, V>(
      [String? Function(Map<K, V>? value)? validate]) {
    return _FieldValidator<Map<K, V>?>._(
      messages: _messages,
      validate: (value) => validate?.call(value),
    );
  }

  /// create [_FieldValidator] for any type of [T]
  _FieldValidator<T?> validatorFor<T>([String? Function(T? value)? validate]) {
    return _FieldValidator<T>._(
      messages: _messages,
      validate: (value) => validate?.call(value),
    );
  }
}

extension NullableStringValidationExtension<T> on _FieldValidator<T?> {
  /// check if the value is required
  FieldValidator<T?, T> required([MessageCallBack<T?>? message]) {
    return _next(
      (messages, value) =>
          value == null ? message?.call(value) ?? messages.required : null,
    ).transform((value) => value!);
  }
}

extension SharedValidationExtensions<T, R> on FieldValidator<T, R> {
  /// check is the value is not  equal [value]
  FieldValidator<T, R> notEqual(R value, [MessageCallBack<R>? message]) {
    return _next((messages, value) {
      if (value == value) {
        return message?.call(value) ?? messages.notEqual(value);
      }
      return null;
    });
  }

  /// check is the value is equal [value]
  FieldValidator<T, R> equal(R value, [MessageCallBack<R>? message]) {
    return _next((messages, value) {
      if (value != value) {
        return message?.call(value) ?? messages.equal(value);
      }
      return null;
    });
  }

  /// check is the value is in [values]
  FieldValidator<T, R> isIn(List<R> values, [MessageCallBack<R>? message]) {
    return _next((messages, value) {
      if (!values.contains(value)) {
        return message?.call(value) ?? messages.isIn(value, values);
      }
      return null;
    });
  }

  /// check is the value is not in [values]
  FieldValidator<T, R> isNotIn(List<R> values, [MessageCallBack<R>? message]) {
    return _next((messages, value) {
      if (values.contains(value)) {
        return message?.call(value) ?? messages.isNotIn(value, values);
      }
      return null;
    });
  }

  /// check is the value is not in [values]
  FieldValidator<T, R> validateWith(String? Function(R value) validator) {
    return _next((messages, value) {
      return validator(value);
    });
  }
}
