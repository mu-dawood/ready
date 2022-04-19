part of '../context_extension.dart';

extension ListValidationExtension<T, TItem> on FieldValidator<T, List<TItem>> {
  /// check is the list contains [length] of elements
  FieldValidator<T, List<TItem>> hasLengthFn(ValueGetter<int> length,
      [MessageCallBack<List<TItem>>? message]) {
    return next((messages, value) {
      var _length = length();
      if (value.length != _length) {
        return message?.call(messages, value) ??
            messages.listHasLength(value, _length);
      }
      return null;
    });
  }

  /// check is the list contains [length] of elements
  FieldValidator<T, List<TItem>> hasLength(int length,
      [MessageCallBack<List<TItem>>? message]) {
    return hasLengthFn(() => length, message);
  }

  /// check is the list contains  elements less than or equal [max]
  FieldValidator<T, List<TItem>> hasMaxLengthFn(ValueGetter<int> max,
      [MessageCallBack<List<TItem>>? message]) {
    return next((messages, value) {
      var _max = max();
      if (value.length > _max) {
        return message?.call(messages, value) ??
            messages.listMaxLength(value, _max);
      }
      return null;
    });
  }

  /// check is the list contains  elements less than or equal [max]
  FieldValidator<T, List<TItem>> hasMaxLength(int max,
      [MessageCallBack<List<TItem>>? message]) {
    return hasMaxLengthFn(() => max, message);
  }

  /// check is the list contains  elements greater than or equal [min]
  FieldValidator<T, List<TItem>> hasMinLengthFn(ValueGetter<int> min,
      [MessageCallBack<List<TItem>>? message]) {
    return next((messages, value) {
      var _min = min();
      if (value.length < _min) {
        return message?.call(messages, value) ??
            messages.listMinLength(value, _min);
      }
      return null;
    });
  }

  /// check is the list contains  elements greater than or equal [min]
  FieldValidator<T, List<TItem>> hasMinLength(int min,
      [MessageCallBack<List<TItem>>? message]) {
    return hasMinLengthFn(() => min, message);
  }

  /// check is the list contains  elements greater than or equal [min] and  less than or equal [max]
  FieldValidator<T, List<TItem>> hasRangeFn(
      ValueGetter<int> min, ValueGetter<int> max,
      [MessageCallBack<List<TItem>>? message]) {
    return next((messages, value) {
      var _min = min();
      var _max = max();

      if (value.length < _min || value.length > _max) {
        return message?.call(messages, value) ??
            messages.listRange(value, _min, _max);
      }
      return null;
    });
  }

  /// check is the list contains  elements greater than or equal [min] and  less than or equal [max]
  FieldValidator<T, List<TItem>> hasRange(int min, int max,
      [MessageCallBack<List<TItem>>? message]) {
    return hasRangeFn(() => min, () => max, message);
  }

  /// check if the value is not empty
  FieldValidator<T, List<TItem>> notEmpty(
      [MessageCallBack<List<TItem>>? message]) {
    return next(
      (messages, value) => value.isEmpty
          ? message?.call(messages, value) ?? messages.notEmpty
          : null,
    );
  }

  /// check if the value contains [item]
  FieldValidator<T, List<TItem>> containsFn(ValueGetter<TItem> item,
      [MessageCallBack<List<TItem>>? message]) {
    return next(
      (messages, value) {
        var _item = item();
        return !value.any((a) => a == _item)
            ? message?.call(messages, value) ??
                messages.containsItem(value, _item)
            : null;
      },
    );
  }

  /// check if the value contains [item]
  FieldValidator<T, List<TItem>> contains(TItem item,
      [MessageCallBack<List<TItem>>? message]) {
    return containsFn(() => item, message);
  }

  /// check if the value not contains [item]
  FieldValidator<T, List<TItem>> notContainsFn(ValueGetter<TItem> item,
      [MessageCallBack<List<TItem>>? message]) {
    return next((messages, value) {
      var _item = item();
      return value.any((a) => a == _item)
          ? message?.call(messages, value) ??
              messages.notContainsItem(value, _item)
          : null;
    });
  }

  /// check if the value not contains [item]
  FieldValidator<T, List<TItem>> notContains(TItem item,
      [MessageCallBack<List<TItem>>? message]) {
    return notContainsFn(() => item, message);
  }
}
