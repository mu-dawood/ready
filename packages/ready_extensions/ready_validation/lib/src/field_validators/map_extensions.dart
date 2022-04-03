part of '../context_extension.dart';

extension MapValidationExtension<T, TKey, TValue>
    on FieldValidator<T, Map<TKey, TValue>> {
  /// check if the value is not empty
  FieldValidator<T, Map<TKey, TValue>> notEmpty(
      [MessageCallBack<Map<TKey, TValue>>? message]) {
    return _next(
      (messages, value) =>
          value.isEmpty ? message?.call(value) ?? messages.notEmpty : null,
    );
  }

  /// check if the value contains [key]
  FieldValidator<T, Map<TKey, TValue>> contains(TKey key,
      [MessageCallBack<Map<TKey, TValue>>? message]) {
    return _next(
      (messages, value) => !value.containsKey(key)
          ? message?.call(value) ?? messages.containsItem(value, key)
          : null,
    );
  }

  /// check if the value not contains [key]
  FieldValidator<T, Map<TKey, TValue>> notContainsKey(TKey key,
      [MessageCallBack<Map<TKey, TValue>>? message]) {
    return _next(
      (messages, value) => value.containsKey(key)
          ? message?.call(value) ?? messages.notContainsItem(value, key)
          : null,
    );
  }

  /// check if the value contains [value]
  FieldValidator<T, Map<TKey, TValue>> containsValue(TValue value,
      [MessageCallBack<Map<TKey, TValue>>? message]) {
    return _next(
      (messages, value) => !value.containsValue(value)
          ? message?.call(value) ?? messages.containsItem(value, value)
          : null,
    );
  }

  /// check if the value not contains [value]
  FieldValidator<T, Map<TKey, TValue>> notContainsValue(TValue value,
      [MessageCallBack<Map<TKey, TValue>>? message]) {
    return _next(
      (messages, value) => value.containsValue(value)
          ? message?.call(value) ?? messages.notContainsItem(value, value)
          : null,
    );
  }
}
