import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

typedef OnPostDataCallBack = Future<OnPostDataResult> Function();

class OnPostDataResult {
  final Map<String, String> errors;
  OnPostDataResult([this.errors = const {}]);
}

class FormSubmitState {
  /// detect if form is submitting
  final bool submitting;

  /// the list of times [onSubmit] method called
  final List<SubmitActions> submitActions;

  /// get the extra errors for the form that may be added by users
  /// May be used for remote errors
  final Map<String, String> submitErrors;

  FormSubmitState({
    required this.submitting,
    required this.submitActions,
    required this.submitErrors,
  });

  FormSubmitState copyWith({
    bool? submitting,
    List<SubmitActions>? submitActions,
    Map<String, String>? submitErrors,
  }) {
    return FormSubmitState(
      submitting: submitting ?? this.submitting,
      submitActions: submitActions ?? this.submitActions,
      submitErrors: submitErrors ?? this.submitErrors,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final collectionEquals = const DeepCollectionEquality().equals;

    return other is FormSubmitState && other.submitting == submitting && collectionEquals(other.submitActions, submitActions) && collectionEquals(other.submitErrors, submitErrors);
  }

  @override
  int get hashCode => submitting.hashCode ^ submitActions.hashCode ^ submitErrors.hashCode;
}

abstract class ReadyFormState {
  /// validate form field
  bool validate();

  /// call this to submit form
  Future<bool> onSubmit();

  FormSubmitState get submitState;

  /// get the invalid fields of the form
  List<FormFieldState> invalidFields();

  /// scroll to the field
  Future makeFieldVisible(FormFieldState field);
}

class SubmitActions {
  /// at the time user click this action
  /// the form is invalid
  final bool isValid;

  /// at the time user click this action
  /// the form is is submitting
  final bool isSubmitting;

  SubmitActions({
    required this.isValid,
    required this.isSubmitting,
  });

  SubmitActions copyWith({
    bool? isValid,
    bool? isSubmitting,
  }) {
    return SubmitActions(
      isValid: isValid ?? this.isValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }
}

enum FormAutoValidateMode {
  /// No auto validation will occur.
  disabled,

  /// Used to auto-validate [Form] and [FormField] even without user interaction.
  always,

  /// Used to auto-validate [Form] and [FormField] only after each user
  /// interaction.
  onUserInteraction,

  /// validation will be occurred if [ReadyFormState.onSubmit]  called at least one time
  onSubmit
}

class RevealConfig {
  final bool? enabled;
  final Color? color;

  const RevealConfig({
    this.enabled,
    this.color,
  });

  RevealConfig copyWith(RevealConfig? other) {
    return RevealConfig(
      enabled: other?.enabled ?? enabled,
      color: other?.color ?? color,
    );
  }
}

class ReadyFormConfig extends InheritedWidget {
  /// show reveal effect, disabled by default
  final RevealConfig revealConfig;

  /// cancel dialog title
  final Widget? cancelRequestTitle;

  /// cancel dialog content
  final Widget? cancelRequestContent;

  /// yes button
  final Widget? yes;

  /// disable taping and editing form fields while submitting defaults to [false]
  final bool? disableEditingOnSubmit;

  /// if [true] key board will be hidden if user tap outside inputs , enabled by default
  final bool unfocusOnTapOutSide;

  /// [Form.autovalidateMode] defaults to [FormAutoValidateMode.onSave]
  final FormAutoValidateMode? autoValidateMode;

  /// no button
  final Widget? no;

  /// if set will wrap the form child with [FocusTraversalGroup]
  final FocusTraversalPolicy Function()? generateFocusTraversalPolicy;

  const ReadyFormConfig({
    Key? key,
    this.revealConfig = const RevealConfig(),
    this.cancelRequestTitle,
    this.cancelRequestContent,
    this.disableEditingOnSubmit,
    this.generateFocusTraversalPolicy,
    this.unfocusOnTapOutSide = true,
    this.yes,
    this.no,
    this.autoValidateMode,
    required Widget child,
  }) : super(key: key, child: child);

  static ReadyFormConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ReadyFormConfig>();
  }

  @override
  bool updateShouldNotify(ReadyFormConfig oldWidget) {
    return revealConfig != oldWidget.revealConfig ||
        cancelRequestTitle != oldWidget.cancelRequestTitle ||
        disableEditingOnSubmit != oldWidget.disableEditingOnSubmit ||
        generateFocusTraversalPolicy != oldWidget.generateFocusTraversalPolicy ||
        unfocusOnTapOutSide != oldWidget.unfocusOnTapOutSide ||
        cancelRequestContent != oldWidget.cancelRequestContent ||
        autoValidateMode != oldWidget.autoValidateMode ||
        yes != oldWidget.yes ||
        no != oldWidget.no;
  }
}

enum ButtonType { elevated, outlined, text }

class ProgressButtonConfig extends InheritedWidget {
  const ProgressButtonConfig({
    Key? key,
    this.loadingIndicator,
    this.duration,
    this.clipBehavior,
    this.style,
    this.type,
    this.autoSubmitForm,
    required Widget child,
  }) : super(key: key, child: child);

  /// loading indicator for progress button
  final Widget? loadingIndicator;

  /// progress animation duration default is 300 ms
  final Duration? duration;

  /// clipBehavior
  final Clip? clipBehavior;

  /// style for the button
  final ButtonStyle? style;

  /// default button type default is elevated
  final ButtonType? type;

  /// whether or not to submit parent form
  final bool? autoSubmitForm;

  static ProgressButtonConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ProgressButtonConfig>();
  }

  @override
  bool updateShouldNotify(ProgressButtonConfig oldWidget) {
    return loadingIndicator != oldWidget.loadingIndicator ||
        autoSubmitForm != oldWidget.autoSubmitForm ||
        type != oldWidget.type ||
        style != oldWidget.style ||
        clipBehavior != oldWidget.clipBehavior ||
        duration != oldWidget.duration;
  }
}
