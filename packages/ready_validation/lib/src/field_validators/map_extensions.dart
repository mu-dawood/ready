part of '../context_extension.dart';

extension MapValidationExtension<T, TKey, TValue>
    on FieldValidator<T, Map<TKey, TValue>> {
  /// check is the map contains [length] of elements
  FieldValidator<T, Map<TKey, TValue>> hasLength(int length,
      [MessageCallBack<Map<TKey, TValue>>? message]) {
    return _next((messages, value) {
      if (value.length != length) {
        return message?.call(value) ??
            messages.listHasLength(value.entries, length);
      }
      return null;
    });
  }

  /// check is the map contains  elements less than or equal [max]
  FieldValidator<T, Map<TKey, TValue>> hasMaxLength(int max,
      [MessageCallBack<Map<TKey, TValue>>? message]) {
    return _next((messages, value) {
      if (value.length > max) {
        return message?.call(value) ??
            messages.listMaxLength(value.entries, max);
      }
      return null;
    });
  }

  /// check is the map contains  elements greater than or equal [min]
  FieldValidator<T, Map<TKey, TValue>> hasMinLength(int min,
      [MessageCallBack<Map<TKey, TValue>>? message]) {
    return _next((messages, value) {
      if (value.length < min) {
        return message?.call(value) ??
            messages.listMinLength(value.entries, min);
      }
      return null;
    });
  }

  /// check is the map contains  elements greater than or equal [min] and  less than or equal [max]
  FieldValidator<T, Map<TKey, TValue>> hasRange(int min, int max,
      [MessageCallBack<Map<TKey, TValue>>? message]) {
    return _next((messages, value) {
      if (value.length < min || value.length > max) {
        return message?.call(value) ??
            messages.listRange(value.entries, min, max);
      }
      return null;
    });
  }

  /// check if the value is not empty
  FieldValidator<T, Map<TKey, TValue>> notEmpty(
      [MessageCallBack<Map<TKey, TValue>>? message]) {
    return _next(
      (messages, value) =>
          value.isEmpty ? message?.call(value) ?? messages.notEmpty : null,
    );
  }

  /// check if the value contains [key]
  FieldValidator<T, Map<TKey, TValue>> containsKey(TKey key,
      [MessageCallBack<Map<TKey, TValue>>? message]) {
    return _next(
      (messages, value) => !value.containsKey(key)
          ? message?.call(value) ?? messages.containsItem(value.entries, key)
          : null,
    );
  }

  /// check if the value not contains [key]
  FieldValidator<T, Map<TKey, TValue>> notContainsKey(TKey key,
      [MessageCallBack<Map<TKey, TValue>>? message]) {
    return _next(
      (messages, value) => value.containsKey(key)
          ? message?.call(value) ?? messages.notContainsItem(value.entries, key)
          : null,
    );
  }

  /// check if the value contains [value]
  FieldValidator<T, Map<TKey, TValue>> containsValue(TValue value,
      [MessageCallBack<Map<TKey, TValue>>? message]) {
    return _next(
      (messages, v) => !v.containsValue(value)
          ? message?.call(v) ?? messages.containsItem(v.entries, value)
          : null,
    );
  }

  /// check if the value not contains [value]
  FieldValidator<T, Map<TKey, TValue>> notContainsValue(TValue value,
      [MessageCallBack<Map<TKey, TValue>>? message]) {
    return _next(
      (messages, v) => v.containsValue(value)
          ? message?.call(v) ?? messages.notContainsItem(v.entries, value)
          : null,
    );
  }
}
