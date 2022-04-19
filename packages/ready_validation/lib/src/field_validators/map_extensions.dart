part of '../context_extension.dart';

extension MapValidationExtension<T, TKey, TValue>
    on FieldValidator<T, Map<TKey, TValue>> {
  /// check is the map contains [length] of elements
  FieldValidator<T, Map<TKey, TValue>> hasLengthFn(ValueGetter<int> length,
      [MessageCallBack<Map<TKey, TValue>>? message]) {
    return next((messages, value) {
      var _length = length();
      if (value.length != _length) {
        return message?.call(messages, value) ??
            messages.listHasLength(value.entries, _length);
      }
      return null;
    });
  }

  /// check is the map contains [length] of elements
  FieldValidator<T, Map<TKey, TValue>> hasLength(int length,
      [MessageCallBack<Map<TKey, TValue>>? message]) {
    return hasLengthFn(() => length, message);
  }

  /// check is the map contains  elements less than or equal [max]
  FieldValidator<T, Map<TKey, TValue>> hasMaxLengthFn(ValueGetter<int> max,
      [MessageCallBack<Map<TKey, TValue>>? message]) {
    return next((messages, value) {
      var _max = max();
      if (value.length > _max) {
        return message?.call(messages, value) ??
            messages.listMaxLength(value.entries, _max);
      }
      return null;
    });
  }

  /// check is the map contains  elements less than or equal [max]
  FieldValidator<T, Map<TKey, TValue>> hasMaxLength(int max,
      [MessageCallBack<Map<TKey, TValue>>? message]) {
    return hasMaxLengthFn(() => max, message);
  }

  /// check is the map contains  elements greater than or equal [min]
  FieldValidator<T, Map<TKey, TValue>> hasMinLengthFn(ValueGetter<int> min,
      [MessageCallBack<Map<TKey, TValue>>? message]) {
    return next((messages, value) {
      var _min = min();
      if (value.length < _min) {
        return message?.call(messages, value) ??
            messages.listMinLength(value.entries, _min);
      }
      return null;
    });
  }

  /// check is the map contains  elements greater than or equal [min]
  FieldValidator<T, Map<TKey, TValue>> hasMinLength(int min,
      [MessageCallBack<Map<TKey, TValue>>? message]) {
    return hasMinLengthFn(() => min, message);
  }

  /// check is the map contains  elements greater than or equal [min] and  less than or equal [max]
  FieldValidator<T, Map<TKey, TValue>> hasRangeFn(
      ValueGetter<int> min, ValueGetter<int> max,
      [MessageCallBack<Map<TKey, TValue>>? message]) {
    return next((messages, value) {
      var _min = min();
      var _max = max();
      if (value.length < _min || value.length > _max) {
        return message?.call(messages, value) ??
            messages.listRange(value.entries, _min, _max);
      }
      return null;
    });
  }

  /// check is the map contains  elements greater than or equal [min] and  less than or equal [max]
  FieldValidator<T, Map<TKey, TValue>> hasRange(int min, int max,
      [MessageCallBack<Map<TKey, TValue>>? message]) {
    return hasRangeFn(() => min, () => max, message);
  }

  /// check if the value is not empty
  FieldValidator<T, Map<TKey, TValue>> notEmpty(
      [MessageCallBack<Map<TKey, TValue>>? message]) {
    return next(
      (messages, value) => value.isEmpty
          ? message?.call(messages, value) ?? messages.notEmpty
          : null,
    );
  }

  /// check if the value contains [key]
  FieldValidator<T, Map<TKey, TValue>> containsKeyFn(ValueGetter<TKey> key,
      [MessageCallBack<Map<TKey, TValue>>? message]) {
    return next((messages, value) {
      var _key = key();
      return !value.containsKey(_key)
          ? message?.call(messages, value) ??
              messages.containsItem(value.entries, _key)
          : null;
    });
  }

  /// check if the value contains [key]
  FieldValidator<T, Map<TKey, TValue>> containsKey(TKey key,
      [MessageCallBack<Map<TKey, TValue>>? message]) {
    return containsKeyFn(() => key, message);
  }

  /// check if the value not contains [key]
  FieldValidator<T, Map<TKey, TValue>> notContainsKeyFn(ValueGetter<TKey> key,
      [MessageCallBack<Map<TKey, TValue>>? message]) {
    return next((messages, value) {
      var _key = key();
      return value.containsKey(_key)
          ? message?.call(messages, value) ??
              messages.notContainsItem(value.entries, _key)
          : null;
    });
  }

  /// check if the value not contains [key]
  FieldValidator<T, Map<TKey, TValue>> notContainsKey(TKey key,
      [MessageCallBack<Map<TKey, TValue>>? message]) {
    return notContainsKeyFn(() => key, message);
  }

  /// check if the value contains [value]
  FieldValidator<T, Map<TKey, TValue>> containsValueFn(
      ValueGetter<TValue> value,
      [MessageCallBack<Map<TKey, TValue>>? message]) {
    return next((messages, v) {
      var _value = value();
      return !v.containsValue(_value)
          ? message?.call(messages, v) ??
              messages.containsItem(v.entries, _value)
          : null;
    });
  }

  /// check if the value contains [value]
  FieldValidator<T, Map<TKey, TValue>> containsValue(TValue value,
      [MessageCallBack<Map<TKey, TValue>>? message]) {
    return containsValueFn(() => value, message);
  }

  /// check if the value not contains [value]
  FieldValidator<T, Map<TKey, TValue>> notContainsValueFn(
      ValueGetter<TValue> value,
      [MessageCallBack<Map<TKey, TValue>>? message]) {
    return next((messages, v) {
      var _value = value();
      return v.containsValue(_value)
          ? message?.call(messages, v) ??
              messages.notContainsItem(v.entries, _value)
          : null;
    });
  }

  /// check if the value not contains [value]
  FieldValidator<T, Map<TKey, TValue>> notContainsValue(TValue value,
      [MessageCallBack<Map<TKey, TValue>>? message]) {
    return notContainsValueFn(() => value, message);
  }
}
