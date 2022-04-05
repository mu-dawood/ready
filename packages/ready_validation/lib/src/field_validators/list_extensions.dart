part of '../context_extension.dart';

extension ListValidationExtension<T, TItem> on FieldValidator<T, List<TItem>> {
  /// check is the list contains [length] of elements
  FieldValidator<T, List<TItem>> hasLength(int length,
      [MessageCallBack<List<TItem>>? message]) {
    return next((messages, value) {
      if (value.length != length) {
        return message?.call(messages, value) ??
            messages.listHasLength(value, length);
      }
      return null;
    });
  }

  /// check is the list contains  elements less than or equal [max]
  FieldValidator<T, List<TItem>> hasMaxLength(int max,
      [MessageCallBack<List<TItem>>? message]) {
    return next((messages, value) {
      if (value.length > max) {
        return message?.call(messages, value) ??
            messages.listMaxLength(value, max);
      }
      return null;
    });
  }

  /// check is the list contains  elements greater than or equal [min]
  FieldValidator<T, List<TItem>> hasMinLength(int min,
      [MessageCallBack<List<TItem>>? message]) {
    return next((messages, value) {
      if (value.length < min) {
        return message?.call(messages, value) ??
            messages.listMinLength(value, min);
      }
      return null;
    });
  }

  /// check is the list contains  elements greater than or equal [min] and  less than or equal [max]
  FieldValidator<T, List<TItem>> hasRange(int min, int max,
      [MessageCallBack<List<TItem>>? message]) {
    return next((messages, value) {
      if (value.length < min || value.length > max) {
        return message?.call(messages, value) ??
            messages.listRange(value, min, max);
      }
      return null;
    });
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
  FieldValidator<T, List<TItem>> contains(TItem item,
      [MessageCallBack<List<TItem>>? message]) {
    return next(
      (messages, value) => !value.any((a) => a == item)
          ? message?.call(messages, value) ?? messages.containsItem(value, item)
          : null,
    );
  }

  /// check if the value not contains [item]
  FieldValidator<T, List<TItem>> notContains(TItem item,
      [MessageCallBack<List<TItem>>? message]) {
    return next(
      (messages, value) => value.any((a) => a == item)
          ? message?.call(messages, value) ??
              messages.notContainsItem(value, item)
          : null,
    );
  }
}
