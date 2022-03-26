part of ready_picker;

class ReadyMultiPicker<T, TController extends SelectFormBloc<T>>
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
  final Widget Function(FormFieldState<List<T>> field)? builder;
  ReadyMultiPicker({
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
        super(key: key, child: _MultiField<T, TController>());

  ReadyMultiPicker.builder({
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
        super(key: key, child: _MultiField<T, TController>());
  @override
  bool updateShouldNotify(ReadyMultiPicker<T, TController> oldWidget) {
    return true;
  }

  static ReadyMultiPicker<T, TController>?
      of<T, TController extends SelectFormBloc<T>>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ReadyMultiPicker<T, TController>>();
  }
}

class _MultiField<T, TController extends SelectFormBloc<T>>
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var options = ReadyMultiPicker.of<T, TController>(context)!;
    return FormField<List<T>>(
        key: key,
        initialValue: options.initialValue ?? [],
        validator: options.validator,
        onSaved: options.onSaved,
        autovalidateMode: options.autovalidateMode,
        builder: (FormFieldState<List<T>> field) {
          return _ReadyMultiPicker<T, TController>(
            field: field,
          );
        });
  }
}

class _ReadyMultiPicker<T, TController extends SelectFormBloc<T>>
    extends StatefulWidget {
  final FormFieldState<List<T>> field;

  const _ReadyMultiPicker({Key? key, required this.field}) : super(key: key);

  @override
  __ReadyMultiPickerState<T, TController> createState() =>
      __ReadyMultiPickerState<T, TController>();
}

class __ReadyMultiPickerState<T, TController extends SelectFormBloc<T>>
    extends State<_ReadyMultiPicker<T, TController>>
    with AutomaticKeepAliveClientMixin {
  late FocusNode _focusNode;
  late FocusAttachment _focusAttachment;
  bool sheetOpened = false;
  @override
  bool get wantKeepAlive => true;
  void _handleFocusChanged() {
    if (mounted && _focusNode.hasFocus && !sheetOpened) {
      sheetOpened = true;
      showSheet().whenComplete(() {
        sheetOpened = false;
      });
    }
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
  void didChangeDependencies() {
    // CompletedForm.of(context)?.register(widget.field);
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    // CompletedForm.of(context).unregister(widget.field);
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    _focusAttachment.reparent();
    super.build(context);
    var options = ReadyMultiPicker.of<T, TController>(context)!;

    final effectiveDecoration = options.decoration
        .applyDefaults(Theme.of(context).inputDecorationTheme);
    final style =
        Theme.of(context).textTheme.subtitle1?.merge(options.textStyle) ??
            options.textStyle;
    var value = widget.field.value ?? [];
    return Semantics(
      button: true,
      child: GestureDetector(
        onTap: options.enabled
            ? () async {
                FocusScope.of(context).requestFocus(_focusNode);
              }
            : null,
        behavior: HitTestBehavior.opaque,
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
                isEmpty: value.isEmpty,
                textAlign: options.textAlign,
                child: value.isEmpty
                    ? const Text('')
                    : Text(
                        value
                            .map((e) =>
                                options.controller.getDisplay(context, e))
                            .join(','),
                        style: style,
                        textAlign: options.textAlign,
                        maxLines: options.maxLines,
                      ),
              ),
      ),
    );
  }

  Widget getSheet(ReadyMultiPicker<T, TController> options) {
    return _SelectorSheet<T, TController>(
      controller: options.controller,
      allowMultiple: true,
      textStyle: options.itemTextStyle,
      activeColor: options.activeColor,
      inActiveColor: options.inActiveColor,
      selectedItems: widget.field.value ?? [],
    );
  }

  Future showSheet() {
    var options = ReadyMultiPicker.of<T, TController>(context)!;
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
      if (value is List<T>) {
        widget.field.didChange(value);
        options.onChanged?.call(value);
      }
    });
  }
}
