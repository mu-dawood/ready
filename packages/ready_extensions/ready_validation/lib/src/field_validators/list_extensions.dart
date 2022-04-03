part of '../context_extension.dart';

extension ListValidationExtension<T, TItem> on _FieldValidator<T, List<TItem>> {
  /// check if the value is not empty
  _FieldValidator<T, List<TItem>> notEmpty(
      [MessageCallBack<List<TItem>>? message]) {
    return _next(
      (messages, value) =>
          value.isEmpty ? message?.call(value) ?? messages.notEmpty : null,
    );
  }

  /// check if the value contains [item]
  _FieldValidator<T, List<TItem>> contains(TItem item,
      [MessageCallBack<List<TItem>>? message]) {
    return _next(
      (messages, value) => !value.any((a) => a == item)
          ? message?.call(value) ?? messages.containsItem(value, item)
          : null,
    );
  }

  /// check if the value not contains [item]
  _FieldValidator<T, List<TItem>> notContains(TItem item,
      [MessageCallBack<List<TItem>>? message]) {
    return _next(
      (messages, value) => value.any((a) => a == item)
          ? message?.call(value) ?? messages.notContainsItem(value, item)
          : null,
    );
  }
}
