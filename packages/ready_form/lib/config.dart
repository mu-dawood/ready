import 'package:flutter/material.dart';

class ReadyFormConfig extends InheritedWidget {
  /// show reveal effect
  final bool? reveal;

  /// handle how AutoFillGroup works
  final AutofillContextAction? autofillContextAction;

  /// cancel dialog title
  final Widget? cancelRequestTitle;

  /// cancel dialog content
  final Widget? cancelRequestContent;

  /// yes button
  final Widget? yes;

  /// no button
  final Widget? no;
  const ReadyFormConfig({
    Key? key,
    this.reveal,
    this.autofillContextAction,
    this.cancelRequestTitle,
    this.cancelRequestContent,
    this.yes,
    this.no,
    required Widget child,
  }) : super(key: key, child: child);

  static ReadyFormConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ReadyFormConfig>();
  }

  @override
  bool updateShouldNotify(ReadyFormConfig oldWidget) {
    return reveal != oldWidget.reveal ||
        cancelRequestTitle != oldWidget.cancelRequestTitle ||
        cancelRequestContent != oldWidget.cancelRequestContent ||
        yes != oldWidget.yes ||
        no != oldWidget.no ||
        autofillContextAction != autofillContextAction;
  }
}

enum ButtonType { elevated, outlined, text }

class ProgressButtonConfig extends InheritedWidget {
  const ProgressButtonConfig({
    Key? key,
    this.loadingIndicator,
    this.alignment,
    this.duration,
    this.clipBehavior,
    this.style,
    this.type,
    this.autoSubmitForm,
    required Widget child,
  }) : super(key: key, child: child);

  /// loading indicator for progress button
  final Widget? loadingIndicator;

  /// button default alignment
  final AlignmentGeometry? alignment;

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
        duration != oldWidget.duration ||
        alignment != oldWidget.alignment;
  }
}
