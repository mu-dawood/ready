import 'package:flutter/material.dart';

import 'controller.dart';
import 'multi_picker.dart';
import 'single_picker.dart';

typedef ItemBuilderCallback<T, TController extends ReadyPickerController<T>>
    = Widget Function(
        TController controller, T? item, bool selected, VoidCallback onTap);

class ReadyPicker<T, TController extends ReadyPickerController<T>>
    extends InheritedWidget {
  final InputDecoration decoration;
  final TController controller;
  final FocusNode? focusNode;
  final Color? inActiveColor;
  final Color? activeColor;
  final TextStyle? itemTextStyle;
  final TextStyle? textStyle;
  final FormFieldSetter<T>? onSaved;
  final FormFieldSetter<T>? onChanged;
  final FormFieldValidator<T>? validator;
  final T? initialValue;
  final AutovalidateMode? autovalidateMode;
  final int? maxLines;
  final TextAlign textAlign;
  final bool enabled;
  final Future<T> Function(BuildContext context, Widget child)? showItems;
  final Widget Function(FormFieldState<T> field)? builder;
  final ItemBuilderCallback<T, TController>? _buildItem;
  ItemBuilderCallback<T, TController>? get buildItem => _buildItem;
  ReadyPicker({
    this.decoration = const InputDecoration(),
    required this.controller,
    this.inActiveColor,
    Key? key,
    this.activeColor,
    this.itemTextStyle,
    this.textStyle,
    this.onSaved,
    this.onChanged,
    this.validator,
    this.initialValue,
    this.autovalidateMode,
    this.maxLines,
    this.textAlign = TextAlign.start,
    this.enabled = true,
    this.showItems,
    this.focusNode,
  })  : builder = null,
        _buildItem = null,
        super(key: key, child: SingleField<T, TController>());
  ReadyPicker.buildItem({
    this.decoration = const InputDecoration(),
    required this.controller,
    Key? key,
    this.textStyle,
    this.onSaved,
    this.onChanged,
    this.validator,
    this.initialValue,
    this.autovalidateMode,
    this.maxLines,
    this.textAlign = TextAlign.start,
    this.enabled = true,
    this.showItems,
    this.focusNode,
    required Widget Function(
            TController controller, T? item, bool selected, VoidCallback onTap)
        buildItem,
  })  : builder = null,
        activeColor = null,
        itemTextStyle = null,
        inActiveColor = null,
        _buildItem = buildItem,
        super(key: key, child: SingleField<T, TController>());

  ReadyPicker.builder({
    required this.controller,
    required this.builder,
    this.inActiveColor,
    Key? key,
    this.activeColor,
    this.itemTextStyle,
    this.textStyle,
    this.onSaved,
    this.onChanged,
    this.validator,
    this.initialValue,
    this.autovalidateMode,
    this.enabled = true,
    this.showItems,
    this.focusNode,
  })  : decoration = const InputDecoration(),
        maxLines = null,
        _buildItem = null,
        textAlign = TextAlign.start,
        super(key: key, child: SingleField<T, TController>());
  @override
  bool updateShouldNotify(ReadyPicker<T, TController> oldWidget) {
    return true;
  }

  static ReadyPicker<T, TController>?
      of<T, TController extends ReadyPickerController<T>>(
          BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ReadyPicker<T, TController>>();
  }
}

class ReadyMultiPicker<T, TController extends ReadyPickerController<T>>
    extends InheritedWidget {
  final InputDecoration decoration;
  final TController controller;
  final Color? inActiveColor;
  final Color? activeColor;
  final TextStyle? itemTextStyle;
  final TextStyle? textStyle;
  final Future<T> Function(BuildContext context, Widget child)? showItems;
  final FormFieldSetter<List<T>>? onSaved;
  final FormFieldSetter<List<T>>? onChanged;
  final FormFieldValidator<List<T>>? validator;
  final List<T>? initialValue;
  final AutovalidateMode? autovalidateMode;
  final int? maxLines;
  final TextAlign textAlign;
  final bool enabled;
  final FocusNode? focusNode;
  final Widget Function(FormFieldState<List<T>> field)? builder;
  final ItemBuilderCallback<T, TController>? _buildItem;
  ItemBuilderCallback<T, TController>? get buildItem => _buildItem;
  ReadyMultiPicker({
    this.decoration = const InputDecoration(),
    required this.controller,
    this.inActiveColor,
    Key? key,
    this.activeColor,
    this.focusNode,
    this.itemTextStyle,
    this.textStyle,
    this.onSaved,
    this.onChanged,
    this.validator,
    this.initialValue,
    this.autovalidateMode,
    this.maxLines,
    this.textAlign = TextAlign.start,
    this.enabled = true,
    this.showItems,
  })  : builder = null,
        _buildItem = null,
        super(key: key, child: MultiField<T, TController>());
  ReadyMultiPicker.buildItem({
    this.decoration = const InputDecoration(),
    required this.controller,
    Key? key,
    this.textStyle,
    this.onSaved,
    this.onChanged,
    this.validator,
    this.focusNode,
    this.initialValue,
    this.autovalidateMode,
    this.maxLines,
    this.textAlign = TextAlign.start,
    this.enabled = true,
    this.showItems,
    required Widget Function(
            TController controller, T? item, bool selected, VoidCallback onTap)
        buildItem,
  })  : builder = null,
        activeColor = null,
        _buildItem = buildItem,
        itemTextStyle = null,
        inActiveColor = null,
        super(key: key, child: MultiField<T, TController>());
  ReadyMultiPicker.builder({
    required this.controller,
    required this.builder,
    this.inActiveColor,
    Key? key,
    this.focusNode,
    this.activeColor,
    this.itemTextStyle,
    this.textStyle,
    this.onSaved,
    this.onChanged,
    this.validator,
    this.initialValue,
    this.autovalidateMode,
    this.enabled = true,
    this.showItems,
  })  : decoration = const InputDecoration(),
        maxLines = null,
        _buildItem = null,
        textAlign = TextAlign.start,
        super(key: key, child: MultiField<T, TController>());
  @override
  bool updateShouldNotify(ReadyMultiPicker<T, TController> oldWidget) {
    return true;
  }

  static ReadyMultiPicker<T, TController>?
      of<T, TController extends ReadyPickerController<T>>(
          BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ReadyMultiPicker<T, TController>>();
  }
}
