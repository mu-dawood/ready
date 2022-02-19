import 'package:flutter/material.dart';

import 'circular_reveal.dart';
import 'config.dart';
import 'keyboard_actions.dart';

typedef OnPostDataCallBack = Future<dynamic> Function();

/// Form key to allow accessing [validate] [onSubmit] [invalidFields] methods
class ReadyFormKey extends GlobalKey<_ReadyFormState> {
  final String id;
  const ReadyFormKey(this.id) : super.constructor();
  @override
  int get hashCode => identityHashCode(id);

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is ReadyFormKey && identical(other.id, id);
  }

  /// manually validate form
  bool? validate() => currentState?.validate();

  /// manually submit form
  Future<bool>? onSubmit() => currentState?.onSubmit();

  /// detect if form is now submitting
  bool get submitting => currentState?.submitting ?? false;

  /// get invalid fields in the current form
  List<FormFieldState> invalidFields() => currentState?.invalidFields() ?? [];
}

class ReadyForm extends StatefulWidget {
  /// called when ever  form is posted
  final OnPostDataCallBack onPostData;
  final Widget child;

  /// whether if reveal effect will be played or not
  final bool? reveal;

  /// handle auto fill group action
  final AutofillContextAction? autofillContextAction;

  /// title for the  cancel dialog
  final Widget? cancelRequestTitle;

  /// content for the  cancel dialog
  final Widget? cancelRequestContent;
  final Widget? yes;
  final Widget? no;
  final VoidCallback? onCancelRequest;
  final AutovalidateMode? autovalidateMode;
  const ReadyForm({
    ReadyFormKey? key,
    required this.onPostData,
    required this.child,
    this.reveal,
    this.onCancelRequest,
    this.autofillContextAction,
    this.cancelRequestTitle,
    this.cancelRequestContent,
    this.yes,
    this.autovalidateMode,
    this.no,
  }) : super(key: key);

  factory ReadyForm.builder({
    ReadyFormKey? key,
    required OnPostDataCallBack onPostData,
    required Widget Function(BuildContext context, bool submitting) builder,
    final bool? reveal,
    final AutofillContextAction? autofillContextAction,
    final Widget? cancelRequestTitle,
    final Widget? cancelRequestContent,
    final Widget? yes,
    final Widget? no,
  }) =>
      ReadyForm(
        key: key,
        reveal: reveal,
        autofillContextAction: autofillContextAction,
        cancelRequestContent: cancelRequestContent,
        cancelRequestTitle: cancelRequestTitle,
        yes: yes,
        no: no,
        onPostData: onPostData,
        child: Builder(
          builder: (BuildContext context) {
            return builder(context, ReadyForm.of(context)!.submitting);
          },
        ),
      );

  static _ReadyFormState? of(BuildContext context) =>
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

class _ReadyFormState extends State<ReadyForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutofillContextAction autofillContextAction = AutofillContextAction.cancel;
  CircularRevealController? controller;
  ReadyFormConfig? get config => ReadyFormConfig.of(context);
  bool _submitting = false;
  bool get submitting => _submitting;
  bool validate() {
    return formKey.currentState!.validate();
  }

  List<FormFieldState> invalidFields() {
    if (formKey.currentContext == null) return [];
    return FocusScope.of(formKey.currentContext!)
        .children
        .map((element) {
          if (element.context == null) return null;
          var field =
              element.context!.findAncestorStateOfType<FormFieldState>();
          if (field == null || field.isValid) return null;
          return field;
        })
        .whereType<FormFieldState>()
        .toList();
  }

  Future _goToElement(FormFieldState field) async {
    var scope = FocusScope.of(field.context);
    if (scope.hasFocus) {
      var focus = scope.children.firstOrDefault(
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
  }

  Future<bool> onSubmit() async {
    if (_submitting) return false;
    setState(() {
      autofillContextAction = AutofillContextAction.cancel;
    });
    if (validate()) {
      formKey.currentState!.save();
      await _validationSuccess();
      return true;
    } else {
      var items = invalidFields();
      if (items.isNotEmpty) {
        await _goToElement(items.first);
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
      _submitting = true;
    });
    try {
      var result = await widget.onPostData();
      setState(() {
        _submitting = false;
        autofillContextAction = widget.autofillContextAction ??
            config?.autofillContextAction ??
            AutofillContextAction.commit;
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
        _submitting = false;
        autofillContextAction = widget.autofillContextAction ??
            config?.autofillContextAction ??
            AutofillContextAction.commit;
      });
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    var reveal = widget.reveal ?? config?.reveal ?? false;
    if (reveal) {
      return CircularReveal(
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
    return KeyboardActions(
      child: AutofillGroup(
        onDisposeAction: autofillContextAction,
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
          autovalidateMode: widget.autovalidateMode,
          child: widget.child,
        ),
      ),
    );
  }
}

extension IterableExtensions<T> on Iterable<T> {
  /// get the first item that match expression or null if not any
  T? firstOrDefault([bool Function(T element)? test]) {
    var filtered = test == null ? this : where(test);
    if (filtered.isNotEmpty) {
      return filtered.first;
    } else {
      return null;
    }
  }
}
