import 'dart:async';

import 'package:flutter/material.dart';

import 'circular_reveal.dart';
import 'config.dart';
import 'keyboard_actions.dart';

typedef OnPostDataCallBack = Future<dynamic> Function();

/// Form key to allow accessing [validate] [onSubmit] [invalidFields] methods
class ReadyFormKey implements ReadyFormState {
  final GlobalKey<_ReadyFormState> _key;
  const ReadyFormKey._(this._key);
  factory ReadyFormKey({String? debugLabel}) =>
      ReadyFormKey._(GlobalKey<_ReadyFormState>(debugLabel: debugLabel));

  /// manually validate form
  @override
  bool validate() => _key.currentState!.validate();

  /// manually submit form
  @override
  Future<bool> onSubmit() => _key.currentState!.onSubmit();

  /// detect if form is now submitting
  @override
  bool get submitting => _key.currentState?.submitting ?? false;

  /// get invalid fields in the current form
  @override
  List<FormFieldState> invalidFields() =>
      _key.currentState?.invalidFields() ?? [];

  @override
  List<SubmitActions> get submitActions =>
      _key.currentState?.submitActions ?? [];

  @override
  Future makeFieldVisible(FormFieldState field) async {
    await _key.currentState?.makeFieldVisible(field);
  }
}

class ReadyForm extends StatefulWidget {
  /// called when ever  form is posted
  final OnPostDataCallBack onPostData;
  final Widget child;

  /// whether if reveal effect will be played or not, disabled by default
  final RevealConfig revealConfig;

  /// title for the  cancel dialog
  final Widget? cancelRequestTitle;

  /// content for the  cancel dialog
  final Widget? cancelRequestContent;

  /// disable taping and editing form fields while submitting defaults to [false]
  final bool? disableEditingOnSubmit;

  /// override yes button
  final Widget? yes;

  /// override no button
  final Widget? no;

  /// if specified will show a dialog when user try to pop and the form is [submitting]
  final VoidCallback? onCancelRequest;

  /// [Form.autovalidateMode] defaults to [FormAutoValidateMode.onSave]
  final FormAutoValidateMode? autoValidateMode;

  /// if [true] then it will add keyboard actions , enabled by default
  final KeyBoardActionConfig keyBoardActionConfig;

  ReadyForm({
    ReadyFormKey? key,
    required this.onPostData,
    required this.child,
    this.revealConfig = const RevealConfig(),
    this.onCancelRequest,
    this.cancelRequestTitle,
    this.cancelRequestContent,
    this.disableEditingOnSubmit,
    this.yes,
    this.autoValidateMode,
    this.keyBoardActionConfig = const KeyBoardActionConfig(),
    this.no,
  }) : super(key: key?._key);

  factory ReadyForm.builder({
    ReadyFormKey? key,
    required OnPostDataCallBack onPostData,
    required Widget Function(BuildContext context, bool submitting) builder,
    RevealConfig revealConfig = const RevealConfig(),
    Widget? cancelRequestTitle,
    Widget? cancelRequestContent,
    Widget? yes,
    Widget? no,
    bool? disableEditingOnSubmit,
    KeyBoardActionConfig keyBoardActionConfig = const KeyBoardActionConfig(),
    FormAutoValidateMode? autoValidateMode,
  }) =>
      ReadyForm(
        key: key,
        revealConfig: revealConfig,
        cancelRequestContent: cancelRequestContent,
        cancelRequestTitle: cancelRequestTitle,
        yes: yes,
        disableEditingOnSubmit: false,
        no: no,
        keyBoardActionConfig: keyBoardActionConfig,
        onPostData: onPostData,
        autoValidateMode: autoValidateMode,
        child: FormSubmitListener(
          builder: (BuildContext context, bool submitting) {
            return builder(context, submitting);
          },
        ),
      );

  static ReadyFormState? of(BuildContext context) =>
      context.findAncestorStateOfType<_ReadyFormState>();
  static _ReadyFormState? _of(BuildContext context) =>
      context.findAncestorStateOfType<_ReadyFormState>();

  static Set<_ReadyFormState> listOf(BuildContext context) {
    return FocusScope.of(context)
        .children
        .map((e) => e.context == null ? null : ReadyForm.of(e.context!))
        .whereType<_ReadyFormState>()
        .toSet();
  }

  @override
  _ReadyFormState createState() => _ReadyFormState();
}

class _ReadyFormState extends State<ReadyForm> implements ReadyFormState {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final List<SubmitActions> _submitActions = [];
  @override
  List<SubmitActions> get submitActions =>
      _submitActions.map((e) => e).toList();
  CircularRevealController? controller;
  ReadyFormConfig? get config => ReadyFormConfig.of(context);
  final ValueNotifier<bool> _submitting = ValueNotifier<bool>(false);
  @override
  bool get submitting => _submitting.value;
  @override
  bool validate() {
    return formKey.currentState!.validate();
  }

  bool get _disableEditingOnSubmit =>
      widget.disableEditingOnSubmit ?? config?.disableEditingOnSubmit ?? false;

  void _visitElements(
      Element element, bool Function(FormFieldState field) check) {
    element.visitChildren((element) {
      if (element is StatefulElement) {
        var _state = element.state;
        if (_state is FormFieldState) {
          if (check(_state)) {
            return;
          }
        }
      }
      _visitElements(element, check);
    });
  }

  @override
  List<FormFieldState> invalidFields() {
    List<FormFieldState> list = [];
    context.visitChildElements((element) {
      _visitElements(element, (field) {
        if (!field.isValid) {
          list.add(field);
        }
        return false;
      });
    });
    return list;
  }

  @override
  Future makeFieldVisible(FormFieldState field) async {
    var ensureVisible = field.context
        .findAncestorStateOfType<_EnsureFieldVisibleState>()
        ?.widget;
    if (ensureVisible != null && ensureVisible._ensureVisible != null) {
      return ensureVisible._ensureVisible!(field);
    }
    if (ensureVisible != null && ensureVisible.before != null) {
      await ensureVisible.before!(field);
    }
    var scope = FocusScope.of(field.context);
    if (scope.hasFocus) {
      var focus = _firstOrDefault<FocusNode>(
        scope.children,
        (element) =>
            element.context?.findAncestorStateOfType<FormFieldState>() == field,
      );
      if (focus != null && focus != scope.focusedChild) {
        scope.requestFocus(focus);
        return;
      }
    }
    await Scrollable.ensureVisible(
      field.context,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInCubic,
      alignment: 1.0,
      alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
    );
    if (ensureVisible != null && ensureVisible.after != null) {
      await ensureVisible.after!(field);
    }
  }

  @override
  Future<bool> onSubmit() async {
    var action = SubmitActions(isValid: true, isSubmitting: submitting);
    if (submitting) {
      setState(() {
        _submitActions.add(action);
      });
      return false;
    }
    action = action.copyWith(isSubmitting: false);
    if (validate()) {
      setState(() {
        _submitActions.add(action);
      });
      formKey.currentState!.save();
      await _validationSuccess();
      return true;
    } else {
      setState(() {
        _submitActions.add(action.copyWith(isValid: false));
      });
      var items = invalidFields();
      if (items.isNotEmpty) {
        await makeFieldVisible(items.first);
      }
      return false;
    }
  }

  Future<dynamic> _validationSuccess() async {
    var currentFocus = FocusScope.of(formKey.currentContext!);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
    setState(() {
      _submitting.value = true;
    });
    try {
      if (_disableEditingOnSubmit) FocusScope.of(context).unfocus();
      var result = await widget.onPostData();
      setState(() {
        _submitting.value = false;
      });
      if (controller != null) {
        await controller!.reveal().then((value) async {
          await Future.delayed(const Duration(milliseconds: 300));
          await controller?.unReveal();
        });
      }

      return result;
    } catch (e) {
      setState(() {
        _submitting.value = false;
      });
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    var reveal = config?.revealConfig.copyWith(widget.revealConfig) ??
        widget.revealConfig;
    if (reveal.enabled == true) {
      return CircularReveal(
        revealColor: reveal.color,
        build: (CircularRevealController ctrl) {
          controller = ctrl;
          return _build(context);
        },
      );
    } else {
      return _build(context);
    }
  }

  Widget _build(BuildContext context) {
    var keyBoardActionConfig =
        config?.keyBoardActionConfig.copyWith(widget.keyBoardActionConfig) ??
            widget.keyBoardActionConfig;
    if (keyBoardActionConfig.enabled != false) {
      return KeyboardActions(
        policy: keyBoardActionConfig.policy,
        child: _buildForm(context),
      );
    } else {
      return _buildForm(context);
    }
  }

  AutovalidateMode? _getAutoValidateMode() {
    var mode = config?.autoValidateMode ?? widget.autoValidateMode;
    if (mode == null) return null;
    switch (mode) {
      case FormAutoValidateMode.disabled:
        return AutovalidateMode.disabled;
      case FormAutoValidateMode.always:
        return AutovalidateMode.always;
      case FormAutoValidateMode.onUserInteraction:
        return AutovalidateMode.onUserInteraction;
      case FormAutoValidateMode.onSubmit:
        return submitActions.isEmpty
            ? AutovalidateMode.disabled
            : AutovalidateMode.always;
    }
  }

  T? _firstOrDefault<T>(Iterable<T> list, [bool Function(T element)? test]) {
    var filtered = test == null ? list : list.where(test);
    if (filtered.isNotEmpty) {
      return filtered.first;
    } else {
      return null;
    }
  }

  Widget _buildForm(BuildContext context) {
    return AbsorbPointer(
      absorbing: _disableEditingOnSubmit && _submitting.value,
      child: Form(
        key: formKey,
        onWillPop: () async {
          if (!submitting || widget.onCancelRequest == null) return true;

          var res = await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: widget.cancelRequestTitle ??
                      config?.cancelRequestTitle ??
                      const Text("Cancel request"),
                  content: widget.cancelRequestContent ??
                      config?.cancelRequestContent ??
                      const Text(
                          "Do you want to leave and cancel the current action?"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        widget.onCancelRequest?.call();
                        Navigator.of(context).pop("yes");
                      },
                      child: widget.yes ?? config?.yes ?? const Text("Yes"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop("no");
                      },
                      style: TextButton.styleFrom(
                          primary: Theme.of(context).errorColor),
                      child: widget.no ?? config?.no ?? const Text("No"),
                    )
                  ],
                );
              });
          return res == "yes";
        },
        autovalidateMode: _getAutoValidateMode(),
        child: widget.child,
      ),
    );
  }
}

/// listen for form submit event
class FormSubmitListener extends StatelessWidget {
  final Widget Function(BuildContext context, bool submitting) builder;
  const FormSubmitListener({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ReadyForm._of(context)!._submitting,
      builder: (BuildContext ctx, bool v, c) => builder(ctx, v),
    );
  }
}

/// wrap your fields with this widget will override the default behaviour of
/// field visibility
///
/// for [EnsureFieldVisible] constructor the [ensureVisible] callback will be called after the default behaviour
/// for [EnsureFieldVisible.override] constructor the [ensureVisible] callback will override the default behaviour

class EnsureFieldVisible extends StatefulWidget {
  final Future Function(FormFieldState field)? after;
  final Future Function(FormFieldState field)? before;
  final Future Function(FormFieldState field)? _ensureVisible;
  final Widget child;
  const EnsureFieldVisible({
    Key? key,
    this.after,
    this.before,
    required this.child,
  })  : _ensureVisible = null,
        super(key: key);
  const EnsureFieldVisible.override({
    Key? key,
    required Future Function(FormFieldState field) ensureVisible,
    required this.child,
  })  : _ensureVisible = ensureVisible,
        after = null,
        before = null,
        super(key: key);

  @override
  State<EnsureFieldVisible> createState() => _EnsureFieldVisibleState();
}

class _EnsureFieldVisibleState extends State<EnsureFieldVisible> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
