import 'package:flutter/material.dart';

import 'controller.dart';
import 'pickers.dart';
import 'sheet.dart';

class SingleField<T, TController extends ReadyPickerController<T>>
    extends StatelessWidget {
  const SingleField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var picker = ReadyPicker.of<T, TController>(context)!;
    return FormField<T>(
      key: key,
      initialValue: picker.initialValue,
      validator: picker.validator,
      onSaved: picker.onSaved,
      autovalidateMode: picker.autovalidateMode,
      builder: (FormFieldState<T> field) {
        return _ReadyPicker<T, TController>(
          field: field,
          picker: picker,
        );
      },
    );
  }
}

class _ReadyPicker<T, TController extends ReadyPickerController<T>>
    extends StatefulWidget {
  final FormFieldState<T> field;
  final ReadyPicker<T, TController> picker;
  const _ReadyPicker({
    Key? key,
    required this.field,
    required this.picker,
  }) : super(key: key);

  @override
  __ReadyPickerState<T, TController> createState() =>
      __ReadyPickerState<T, TController>();
}

class __ReadyPickerState<T, TController extends ReadyPickerController<T>>
    extends State<_ReadyPicker<T, TController>>
    with AutomaticKeepAliveClientMixin {
  FocusNode get _effectiveFocusNode =>
      widget.picker.focusNode ?? (_focusNode ??= FocusNode());
  FocusNode? _focusNode;
  bool _hasPrimaryFocus = false;

  late FocusAttachment attachment;
  @override
  bool get wantKeepAlive => true;

  bool sheetOpened = false;

  void _handleFocusChanged() {
    if (_hasPrimaryFocus != _effectiveFocusNode.hasPrimaryFocus) {
      setState(() {
        _hasPrimaryFocus = _effectiveFocusNode.hasPrimaryFocus;
      });
      if (_hasPrimaryFocus && !sheetOpened) {
        _effectiveFocusNode.unfocus();
        showSheet();
      }
    }
  }

  @override
  void didChangeDependencies() {
    attachment = _effectiveFocusNode.attach(context);
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant _ReadyPicker<T, TController> oldWidget) {
    _effectiveFocusNode.removeListener(_handleFocusChanged);
    _effectiveFocusNode.addListener(_handleFocusChanged);
    _effectiveFocusNode.canRequestFocus = widget.picker.enabled;
    _hasPrimaryFocus = _effectiveFocusNode.hasPrimaryFocus;
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void initState() {
    _effectiveFocusNode.addListener(_handleFocusChanged);
    _effectiveFocusNode.canRequestFocus = widget.picker.enabled;
    super.initState();
  }

  @override
  void dispose() {
    _effectiveFocusNode.removeListener(_handleFocusChanged);
    _focusNode?.dispose();
    attachment.detach();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    attachment.reparent();
    super.build(context);
    var picker = widget.picker;

    final effectiveDecoration =
        picker.decoration.applyDefaults(Theme.of(context).inputDecorationTheme);
    final style =
        Theme.of(context).textTheme.subtitle1?.merge(picker.textStyle) ??
            picker.textStyle;
    VoidCallback? handleDidGainAccessibilityFocus;
    switch (Theme.of(context).platform) {
      case TargetPlatform.windows:
      case TargetPlatform.macOS:
        handleDidGainAccessibilityFocus = () {
          if (!_effectiveFocusNode.hasFocus &&
              _effectiveFocusNode.canRequestFocus) {
            _effectiveFocusNode.requestFocus();
          }
        };
        break;
      default:
    }
    return GestureDetector(
      onTap: () {
        _effectiveFocusNode.requestFocus();
      },
      behavior: HitTestBehavior.opaque,
      child: FocusTrapArea(
        focusNode: _effectiveFocusNode,
        child: Semantics(
          button: true,
          onDidGainAccessibilityFocus: handleDidGainAccessibilityFocus,
          child: picker.builder != null
              ? picker.builder!(widget.field)
              : InputDecorator(
                  isFocused: _effectiveFocusNode.hasFocus,
                  decoration: effectiveDecoration.copyWith(
                    errorText: widget.field.errorText,
                    enabled: picker.enabled,
                    suffixIcon: effectiveDecoration.suffixIcon ??
                        (widget.field.value == null
                            ? null
                            : IconButton(
                                icon: Icon(
                                  Icons.delete_rounded,
                                  color: Theme.of(context).errorColor,
                                ),
                                onPressed: () {
                                  widget.field.didChange(null);

                                  picker.onChanged?.call(null);
                                },
                              )),
                  ),
                  isEmpty: widget.field.value == null,
                  textAlign: picker.textAlign,
                  child: widget.field.value == null
                      ? const Text('')
                      : Text(
                          picker.controller
                              .getDisplay(context, widget.field.value!),
                          style: style,
                          textAlign: picker.textAlign,
                          maxLines: picker.maxLines,
                        ),
                ),
        ),
      ),
    );
  }

  Widget getSheet(ReadyPicker<T, TController> options) {
    return SelectorSheet<T, TController>(
      controller: options.controller,
      allowMultiple: false,
      buildItem: options.buildItem,
      textStyle: options.itemTextStyle,
      activeColor: options.activeColor,
      inActiveColor: options.inActiveColor,
      selectedItems: widget.field.value == null ? [] : [widget.field.value!],
    );
  }

  Future showSheet() {
    var options = ReadyPicker.of<T, TController>(context)!;
    Future future;
    if (options.showItems != null) {
      future = options.showItems!(
        widget.field.context,
        getSheet(options),
      );
    } else {
      future = showModalBottomSheet(
        context: widget.field.context,
        isScrollControlled: true,
        clipBehavior: Clip.antiAlias,
        builder: (ctx) => getSheet(options),
      );
    }
    return future.then((value) {
      if (value is T) {
        widget.field.didChange(value);
        options.onChanged?.call(value);
      }

      return value;
    });
  }
}
