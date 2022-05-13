import 'package:flutter/material.dart';
import 'package:ready_extensions/ready_extensions.dart';
import 'package:ready_validation/src/messages/messages_en.dart';

import 'config.dart';
import 'messages/messages.dart';
import 'messages/messages_ar.dart';
import 'utils.dart';

part './field_validators/date_time_extensions.dart';
part './field_validators/list_extensions.dart';
part './field_validators/map_extensions.dart';
part './field_validators/number_extension.dart';
part './field_validators/shared_validations.dart';
part './field_validators/string_validation.dart';
part './field_validators/time_of_day_extensions.dart';
part 'field_validator.dart';
part 'type_extension.dart';

typedef MessageCallBack<T> = String Function(
    ReadyValidationMessages messages, T value);

typedef ValueGetter<T> = T Function();

extension ValidationExtensions on BuildContext {
  ReadyValidationMessages get _messages =>
      ValidationMessagesConfig.of(this) ??
      ReadyValidationMessages.of(this) ??
      ReadyValidationMessagesEn();

  /// create [FieldValidator] for [String]
  FieldValidator<String?, String?> string(
      [String? Function(String? value)? validate]) {
    return FieldValidator<String?, String?>._(
      messages: _messages,
      convert: (v) => v,
      validate: (value) => validate?.call(value.value),
    );
  }

  /// create [FieldValidator] for [num]
  FieldValidator<num?, num?> number([String? Function(num? value)? validate]) {
    return FieldValidator<num?, num?>._(
      messages: _messages,
      convert: (v) => v,
      validate: (value) => validate?.call(value.value),
    );
  }

  /// create [FieldValidator] for [int]
  FieldValidator<int?, int?> integer([String? Function(int? value)? validate]) {
    return FieldValidator<int?, int?>._(
      messages: _messages,
      convert: (v) => v,
      validate: (value) => validate?.call(value.value),
    );
  }

  /// create [FieldValidator] for [double]
  FieldValidator<double?, double?> decimal(
      [String? Function(double? value)? validate]) {
    return FieldValidator<double?, double?>._(
      messages: _messages,
      convert: (v) => v,
      validate: (value) => validate?.call(value.value),
    );
  }

  /// create [FieldValidator] for [bool]
  FieldValidator<bool?, bool?> boolean(
      [String? Function(bool? value)? validate]) {
    return FieldValidator<bool?, bool?>._(
      messages: _messages,
      convert: (v) => v,
      validate: (value) => validate?.call(value.value),
    );
  }

  /// create [FieldValidator] for [DateTime]
  FieldValidator<DateTime?, DateTime?> dateTime(
      [String? Function(DateTime? value)? validate]) {
    return FieldValidator<DateTime?, DateTime?>._(
      messages: _messages,
      convert: (v) => v,
      validate: (value) => validate?.call(value.value),
    );
  }

  /// create [FieldValidator] for [TimeOfDay]
  FieldValidator<TimeOfDay?, TimeOfDay?> timeOfDay(
      [String? Function(TimeOfDay? value)? validate]) {
    return FieldValidator<TimeOfDay?, TimeOfDay?>._(
      messages: _messages,
      convert: (v) => v,
      validate: (value) => validate?.call(value.value),
    );
  }

  /// create [FieldValidator] for [List] of type [T]
  FieldValidator<List<T>?, List<T>?> list<T>(
      [String? Function(List<T>? value)? validate]) {
    return FieldValidator<List<T>?, List<T>?>._(
      messages: _messages,
      convert: (v) => v,
      validate: (value) => validate?.call(value.value),
    );
  }

  /// create [FieldValidator] for [Map] of key [K] and value [V]
  FieldValidator<Map<K, V>?, Map<K, V>?> map<K, V>(
      [String? Function(Map<K, V>? value)? validate]) {
    return FieldValidator<Map<K, V>?, Map<K, V>?>._(
      messages: _messages,
      convert: (v) => v,
      validate: (value) => validate?.call(value.value),
    );
  }

  /// create [FieldValidator] for any type of [T]
  FieldValidator<T, T> validator<T>([String? Function(T? value)? validate]) {
    return FieldValidator<T, T>._(
      messages: _messages,
      convert: (v) => v,
      validate: (value) => validate?.call(value.value),
    );
  }
}
