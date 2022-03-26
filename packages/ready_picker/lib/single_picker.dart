part of ready_picker;

class ReadyPicker<T, TController extends SelectFormBloc<T>>
    extends InheritedWidget {
  final InputDecoration decoration;
  final TController controller;
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
  })  : builder = null,
        super(key: key, child: _Field<T, TController>());

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
  })  : decoration = const InputDecoration(),
        maxLines = null,
        textAlign = TextAlign.start,
        super(key: key, child: _Field<T, TController>());
  @override
  bool updateShouldNotify(ReadyPicker<T, TController> oldWidget) {
    return true;
  }

  static ReadyPicker<T, TController>?
      of<T, TController extends SelectFormBloc<T>>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ReadyPicker<T, TController>>();
  }
}

class _Field<T, TController extends SelectFormBloc<T>> extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var options = ReadyPicker.of<T, TController>(context)!;
    return FormField<T>(
        key: key,
        initialValue: options.initialValue,
        validator: options.validator,
        onSaved: options.onSaved,
        autovalidateMode: options.autovalidateMode,
        builder: (FormFieldState<T> field) {
          return _ReadyPicker<T, TController>(field: field);
        });
  }
}

class _ReadyPicker<T, TController extends SelectFormBloc<T>>
    extends StatefulWidget {
  final FormFieldState<T> field;

  const _ReadyPicker({Key? key, required this.field}) : super(key: key);

  @override
  __ReadyPickerState<T, TController> createState() =>
      __ReadyPickerState<T, TController>();
}

class __ReadyPickerState<T, TController extends SelectFormBloc<T>>
    extends State<_ReadyPicker<T, TController>>
    with AutomaticKeepAliveClientMixin {
  late FocusNode _focusNode;
  late FocusAttachment _focusAttachment;

  @override
  bool get wantKeepAlive => true;
  void _handleFocusChanged() {
    Future.delayed(const Duration(milliseconds: 200)).then((value) {
      if (mounted && _focusNode.hasFocus) {
        shoSheet();
        _focusNode.unfocus();
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void initState() {
    _focusNode = FocusNode();
    _focusAttachment = _focusNode.attach(context);
    _focusNode.addListener(_handleFocusChanged);

    super.initState();
  }

  @override
  void dispose() {
    _focusAttachment.detach();
    _focusNode.removeListener(_handleFocusChanged);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _focusAttachment.reparent();
    super.build(context);
    var options = ReadyPicker.of<T, TController>(context)!;

    final effectiveDecoration = options.decoration
        .applyDefaults(Theme.of(context).inputDecorationTheme);
    final style =
        Theme.of(context).textTheme.subtitle1?.merge(options.textStyle) ??
            options.textStyle;
    return Semantics(
      button: true,
      child: GestureDetector(
        onTap: options.enabled
            ? () async {
                FocusScope.of(context).requestFocus(_focusNode);
              }
            : null,
        behavior: HitTestBehavior.opaque,
        child: AbsorbPointer(
          child: options.builder != null
              ? options.builder!(widget.field)
              : InputDecorator(
                  isFocused: _focusNode.hasFocus,
                  decoration: effectiveDecoration.copyWith(
                    errorText: widget.field.errorText,
                    enabled: options.enabled,
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
                                  options.onChanged?.call(null);
                                },
                              )),
                  ),
                  isEmpty: widget.field.value == null,
                  textAlign: options.textAlign,
                  child: widget.field.value == null
                      ? const Text('')
                      : Text(
                          options.controller
                              .getDisplay(context, widget.field.value!),
                          style: style,
                          textAlign: options.textAlign,
                          maxLines: options.maxLines,
                        ),
                ),
        ),
      ),
    );
  }

  Widget getSheet(ReadyPicker<T, TController> options) {
    return _SelectorSheet<T, TController>(
      controller: options.controller,
      allowMultiple: false,
      textStyle: options.itemTextStyle,
      activeColor: options.activeColor,
      inActiveColor: options.inActiveColor,
      selectedItems: widget.field.value == null ? [] : [widget.field.value!],
    );
  }

  Future shoSheet() {
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
