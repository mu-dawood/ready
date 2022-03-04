library ready_picker;

import 'package:flutter/material.dart';
import 'package:ready/ready.dart';

part 'multi_picker.dart';
part 'sheet.dart';
part 'single_picker.dart';

mixin SelectFormBloc<T> on ReadyListController<T> {
  bool checkSelected(T left, T right);
  String getItemDisplay(BuildContext context, T item) =>
      getDisplay(context, item);
  String getDisplay(BuildContext context, T item);
}
