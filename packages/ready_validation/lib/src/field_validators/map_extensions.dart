part of '../context_extension.dart';

extension MapValidationExtension<T, TKey, TValue>
    on FieldValidator<T, Map<TKey, TValue>> {
  /// check is the map contains [length] of elements
  FieldValidator<T, Map<TKey, TValue>> hasLengthFn(ValueGetter<int> length,
      [MessageCallBack<Map<TKey, TValue>>? message]) {
    return next((messages, value) {
      var len = length();
      if (value.length != len) {
        return message?.call(messages, value) ?? messages.listHasLength(len);
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
      var maximum = max();
      if (value.length > maximum) {
        return message?.call(messages, value) ??
            messages.listMaxLength(maximum);
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
      var minimum = min();
      if (value.length < minimum) {
        return message?.call(messages, value) ??
            messages.listMinLength(minimum);
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
      var minimum = min();
      var maximum = max();
      if (value.length < minimum || value.length > maximum) {
        return message?.call(messages, value) ??
            messages.listRange(minimum, maximum);
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
      var k = key();
      return !value.containsKey(k)
          ? message?.call(messages, value) ?? messages.containsItem(k)
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
      var k = key();
      return value.containsKey(k)
          ? message?.call(messages, value) ?? messages.notContainsItem(k)
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
      var val = value();
      return !v.containsValue(val)
          ? message?.call(messages, v) ?? messages.containsItem(val)
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
      var val = value();
      return v.containsValue(val)
          ? message?.call(messages, v) ?? messages.notContainsItem(val)
          : null;
    });
  }

  /// check if the value not contains [value]
  FieldValidator<T, Map<TKey, TValue>> notContainsValue(TValue value,
      [MessageCallBack<Map<TKey, TValue>>? message]) {
    return notContainsValueFn(() => value, message);
  }
}
