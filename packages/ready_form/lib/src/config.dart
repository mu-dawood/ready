import 'package:flutter/material.dart';

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

class KeyBoardActionConfig {
  final bool? enabled;
  final FocusTraversalPolicy? policy;

  const KeyBoardActionConfig({
    this.enabled,
    this.policy,
  });

  KeyBoardActionConfig copyWith(KeyBoardActionConfig? other) {
    return KeyBoardActionConfig(
      enabled: other?.enabled ?? enabled,
      policy: other?.policy ?? policy,
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

  /// if [true] then it will add keyboard actions , enabled by default
  final KeyBoardActionConfig keyBoardActionConfig;

  /// no button
  final Widget? no;
  const ReadyFormConfig({
    Key? key,
    this.revealConfig = const RevealConfig(),
    this.cancelRequestTitle,
    this.cancelRequestContent,
    this.disableEditingOnSubmit,
    this.keyBoardActionConfig = const KeyBoardActionConfig(),
    this.yes,
    this.no,
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
        cancelRequestContent != oldWidget.cancelRequestContent ||
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
