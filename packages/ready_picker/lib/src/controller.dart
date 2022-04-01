import 'package:flutter/material.dart';
import 'package:ready/ready.dart';

mixin ReadyPickerController<T> on ReadyListController<T> {
  bool checkSelected(T left, T right);
  String getItemDisplay(BuildContext context, T item) =>
      getDisplay(context, item);
  String getDisplay(BuildContext context, T item);

  SearchOptions? getSearchOptions(BuildContext context) => null;
}

class SearchOptions<T> {
  final void Function(String? value) callback;
  final InputDecoration decoration;
  SearchOptions({
    required this.callback,
    this.decoration = const InputDecoration(),
  });
}
