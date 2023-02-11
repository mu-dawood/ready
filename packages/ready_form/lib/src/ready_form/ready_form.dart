import 'dart:async';

import 'package:flutter/material.dart';

import '../circular_reveal.dart';
import '../config.dart';
import '../keyboard_actions.dart';

part 'ensure_visible.dart';
part 'listeners.dart';
part 'ready_form_error_messages.dart';
part 'submit_error_message_for.dart';

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

  /// get invalid fields in the current form
  @override
  List<FormFieldState> invalidFields() =>
      _key.currentState?.invalidFields() ?? [];

  @override
  FormSubmitState get submitState => _key.currentState!.submitState;

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

  /// called before validation
  final ValueChanged<ReadyFormState>? beforeValidate;
  ReadyForm({
    ReadyFormKey? key,
    required this.onPostData,
    required this.child,
    this.beforeValidate,
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
    required Widget Function(BuildContext context, FormSubmitState state)
        builder,
    RevealConfig revealConfig = const RevealConfig(),
    ValueChanged<ReadyFormState>? beforeValidate,
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
        beforeValidate: beforeValidate,
        disableEditingOnSubmit: false,
        no: no,
        keyBoardActionConfig: keyBoardActionConfig,
        onPostData: onPostData,
        autoValidateMode: autoValidateMode,
        child: FormStateListener(
          builder: (BuildContext context, FormSubmitState state) {
            return builder(context, state);
          },
        ),
      );

  static ReadyFormState? of(BuildContext context) =>
      context.findAncestorStateOfType<_ReadyFormState>();
  static _ReadyFormState? _of(BuildContext context) =>
      context.findAncestorStateOfType<_ReadyFormState>();

  static Set<ReadyFormState> formsOf(BuildContext context) {
    return FocusScope.of(context)
        .children
        .map((e) => e.context == null ? null : ReadyForm.of(e.context!))
        .whereType<_ReadyFormState>()
        .toSet();
  }

  @override
  State<ReadyForm> createState() => _ReadyFormState();
}

class _ReadyFormState extends State<ReadyForm> implements ReadyFormState {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  CircularRevealController? controller;
  ReadyFormConfig? get config => ReadyFormConfig.of(context);

  late ValueNotifier<FormSubmitState> _state;

  @override
  FormSubmitState get submitState => _state.value;

  @override
  void initState() {
    _state = ValueNotifier<FormSubmitState>(FormSubmitState(
      submitActions: [],
      submitErrors: {},
      submitting: false,
    ));
    _state.addListener(_onValueChanged);
    super.initState();
  }

  void _onValueChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    _state.removeListener(_onValueChanged);
    _state.dispose();
    super.dispose();
  }

  @override
  bool validate() {
    return formKey.currentState!.validate();
  }

  bool get _disableEditingOnSubmit =>
      widget.disableEditingOnSubmit ?? config?.disableEditingOnSubmit ?? false;

  void _visitElements(
      Element element, bool Function(StatefulElement element) check) {
    element.visitChildren((element) {
      if (element is StatefulElement) {
        if (check(element)) {
          return;
        }
      }
      _visitElements(element, check);
    });
  }

  @override
  List<FormFieldState> invalidFields() {
    List<FormFieldState> list = [];
    context.visitChildElements((element) {
      _visitElements(element, (e) {
        var state = e.state;
        if (state is FormFieldState) {
          if (!state.isValid) {
            list.add(state);
            return false;
          }
        }

        return false;
      });
    });
    return list;
  }

  List<State> invalidErrorMessages() {
    var errors = _state.value.submitErrors;
    if (errors.isEmpty) return [];
    List<State> list = [];
    context.visitChildElements((element) {
      _visitElements(element, (e) {
        var state = e.state;
        if (state is _ReadyFormErrorMessagesState) {
          list.add(state);
        } else if (state is _SubmitErrorMessageForState) {
          if (errors.containsKey(state.widget.messageFor)) {
            list.add(state);
            return false;
          }
        }
        return false;
      });
    });
    return list;
  }

  @override
  Future makeFieldVisible(FormFieldState field) async {
    return _makeContextVisible(field.context);
  }

  Future _makeContextVisible(BuildContext context) async {
    var ensureVisible =
        context.findAncestorStateOfType<_EnsureContextVisibleState>()?.widget;
    if (ensureVisible != null && ensureVisible._ensureVisible != null) {
      return ensureVisible._ensureVisible!(context);
    }
    if (ensureVisible != null && ensureVisible.before != null) {
      await ensureVisible.before!(context);
    }
    if (!mounted) return;
    var scope = FocusScope.of(context);
    if (scope.hasFocus) {
      var focus = _firstOrDefault<FocusNode>(
        scope.children,
        (element) =>
            element.context
                ?.findAncestorStateOfType<FormFieldState>()
                ?.context ==
            context,
      );
      if (focus != null && focus != scope.focusedChild) {
        scope.requestFocus(focus);
        return;
      }
    }
    await Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInCubic,
      alignment: 1.0,
      alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
    );
    if (ensureVisible != null && ensureVisible.after != null) {
      if (!mounted) return;
      await ensureVisible.after!(context);
    }
  }

  Future _moveToFirstInvalid() async {
    var items = invalidFields();
    if (items.isNotEmpty) {
      await makeFieldVisible(items.first);
    }
  }

  @override
  Future<bool> onSubmit() async {
    var action = SubmitActions(
      isValid: true,
      isSubmitting: _state.value.submitting,
    );
    if (action.isSubmitting) {
      _state.value = _state.value
          .copyWith(submitActions: [..._state.value.submitActions, action]);
      return false;
    }
    action = action.copyWith(isSubmitting: false);
    widget.beforeValidate?.call(this);
    _state.value = _state.value.copyWith(submitErrors: {});
    if (validate()) {
      formKey.currentState!.save();
      var res = await _validationSuccess(action);
      return res.errors.isEmpty;
    } else {
      _state.value = _state.value.copyWith(submitActions: [
        ..._state.value.submitActions,
        action.copyWith(isValid: false)
      ]);
      await _moveToFirstInvalid();
      return false;
    }
  }

  Future<OnPostDataResult> _validationSuccess(SubmitActions action) async {
    var currentFocus = FocusScope.of(formKey.currentContext!);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
    _state.value = _state.value.copyWith(submitting: true);
    try {
      if (_disableEditingOnSubmit) FocusScope.of(context).unfocus();
      var res = await widget.onPostData();
      _state.value = _state.value.copyWith(
        submitting: false,
        submitActions: [
          ..._state.value.submitActions,
          action.copyWith(isValid: res.errors.isEmpty)
        ],
        submitErrors: res.errors,
      );

      var invalidMessages = invalidErrorMessages();
      if (invalidMessages.isNotEmpty) {
        _makeContextVisible(invalidMessages[0].context);
      }
      if (controller != null && res.errors.isEmpty) {
        await controller!.reveal().then((value) async {
          await Future.delayed(const Duration(milliseconds: 300));
          await controller?.unReveal();
        });
      }
      return res;
    } catch (e) {
      _state.value = _state.value.copyWith(
        submitting: false,
        submitActions: [
          ..._state.value.submitActions,
          action.copyWith(isValid: false)
        ],
      );
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

  AutovalidateMode? _getAutoValidateMode(FormSubmitState state) {
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
        return state.submitActions.isEmpty
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
      absorbing: _disableEditingOnSubmit && _state.value.submitting,
      child: Form(
        key: formKey,
        onWillPop: () async {
          if (!_state.value.submitting || widget.onCancelRequest == null) {
            return true;
          }
          var res = await showDialog(
            context: context,
            builder: (context) {
              return CancelDialog(
                cancelRequestContent: widget.cancelRequestContent,
                cancelRequestTitle: widget.cancelRequestTitle,
                yes: widget.yes,
                no: widget.no,
                config: config,
                onCancelRequest: widget.onCancelRequest!,
              );
            },
          );
          return res == "yes";
        },
        autovalidateMode: _getAutoValidateMode(_state.value),
        child: widget.child,
      ),
    );
  }
}

class CancelDialog extends StatelessWidget {
  const CancelDialog({
    Key? key,
    this.cancelRequestContent,
    this.cancelRequestTitle,
    this.yes,
    this.no,
    this.config,
    required this.onCancelRequest,
  }) : super(key: key);

  /// cancel dialog title
  final Widget? cancelRequestTitle;

  /// cancel dialog content
  final Widget? cancelRequestContent;

  /// yes button
  final Widget? yes;

  /// yes button
  final Widget? no;
  final ReadyFormConfig? config;

  /// if specified will show a dialog when user try to pop and the form is [submitting]
  final VoidCallback onCancelRequest;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: cancelRequestTitle ??
          config?.cancelRequestTitle ??
          const Text("Cancel request"),
      content: cancelRequestContent ??
          config?.cancelRequestContent ??
          const Text("Do you want to leave and cancel the current action?"),
      actions: [
        TextButton(
          onPressed: () {
            onCancelRequest.call();
            Navigator.of(context).pop("yes");
          },
          child: yes ?? config?.yes ?? const Text("Yes"),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop("no");
          },
          style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.error),
          child: no ?? config?.no ?? const Text("No"),
        )
      ],
    );
  }
}
