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

  /// create [FieldValidator] for [String]
  FieldValidator<String?, String?> string(
      [String? Function(String? value)? validate]) {
    return FieldValidator<String?, String?>._(
      messages: _messages,
      convert: (v) => v,
      validatePrev: (v) => null,
      prevErrors: (v) => [],
      validate: (value) => validate?.call(value),
    );
  }

  /// create [FieldValidator] for [num]
  FieldValidator<num?, num?> number([String? Function(num? value)? validate]) {
    return FieldValidator<num?, num?>._(
      messages: _messages,
      convert: (v) => v,
      validatePrev: (v) => null,
      prevErrors: (v) => [],
      validate: (value) => validate?.call(value),
    );
  }

  /// create [FieldValidator] for [int]
  FieldValidator<int?, int?> integer([String? Function(int? value)? validate]) {
    return FieldValidator<int?, int?>._(
      messages: _messages,
      convert: (v) => v,
      validatePrev: (v) => null,
      prevErrors: (v) => [],
      validate: (value) => validate?.call(value),
    );
  }

  /// create [FieldValidator] for [double]
  FieldValidator<double?, double?> decimal(
      [String? Function(double? value)? validate]) {
    return FieldValidator<double?, double?>._(
      messages: _messages,
      convert: (v) => v,
      validatePrev: (v) => null,
      prevErrors: (v) => [],
      validate: (value) => validate?.call(value),
    );
  }

  /// create [FieldValidator] for [bool]
  FieldValidator<bool?, bool?> boolean(
      [String? Function(bool? value)? validate]) {
    return FieldValidator<bool?, bool?>._(
      messages: _messages,
      convert: (v) => v,
      validatePrev: (v) => null,
      prevErrors: (v) => [],
      validate: (value) => validate?.call(value),
    );
  }

  /// create [FieldValidator] for [DateTime]
  FieldValidator<DateTime?, DateTime?> dateTime(
      [String? Function(DateTime? value)? validate]) {
    return FieldValidator<DateTime?, DateTime?>._(
      messages: _messages,
      convert: (v) => v,
      validatePrev: (v) => null,
      prevErrors: (v) => [],
      validate: (value) => validate?.call(value),
    );
  }

  /// create [FieldValidator] for [TimeOfDay]
  FieldValidator<TimeOfDay?, TimeOfDay?> timeOfDay(
      [String? Function(TimeOfDay? value)? validate]) {
    return FieldValidator<TimeOfDay?, TimeOfDay?>._(
      messages: _messages,
      convert: (v) => v,
      validatePrev: (v) => null,
      prevErrors: (v) => [],
      validate: (value) => validate?.call(value),
    );
  }

  /// create [FieldValidator] for [List] of type [T]
  FieldValidator<List<T>?, List<T>?> list<T>(
      [String? Function(List<T>? value)? validate]) {
    return FieldValidator<List<T>?, List<T>?>._(
      messages: _messages,
      convert: (v) => v,
      validatePrev: (v) => null,
      prevErrors: (v) => [],
      validate: (value) => validate?.call(value),
    );
  }

  /// create [FieldValidator] for [Map] of key [K] and value [V]
  FieldValidator<Map<K, V>?, Map<K, V>?> map<K, V>(
      [String? Function(Map<K, V>? value)? validate]) {
    return FieldValidator<Map<K, V>?, Map<K, V>?>._(
      messages: _messages,
      convert: (v) => v,
      validatePrev: (v) => null,
      prevErrors: (v) => [],
      validate: (value) => validate?.call(value),
    );
  }

  /// create [FieldValidator] for any type of [T]
  FieldValidator<T, T> validatorFor<T>([String? Function(T? value)? validate]) {
    return FieldValidator<T, T>._(
      messages: _messages,
      convert: (v) => v,
      validatePrev: (v) => null,
      prevErrors: (v) => [],
      validate: (value) => validate?.call(value),
    );
  }
}

extension NullableStringValidationExtension<T> on FieldValidator<T?, T?> {
  /// check if the value is required
  FieldValidator<T?, T> required([MessageCallBack<T?>? message]) {
    return _next(
      (messages, value) {
        return value == null ? message?.call(value) ?? messages.required : null;
      },
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
