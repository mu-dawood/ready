import 'package:flutter/material.dart';

import 'messages/messages.dart';

class ValidationMessagesConfig extends StatefulWidget {
  final ReadyValidationMessages Function(BuildContext context) messages;
  final Widget child;
  const ValidationMessagesConfig(
      {Key? key, required this.messages, required this.child})
      : super(key: key);

  @override
  _ValidationMessagesConfigState createState() =>
      _ValidationMessagesConfigState();

  static ReadyValidationMessages? of(BuildContext context) => context
      .findRootAncestorStateOfType<_ValidationMessagesConfigState>()
      ?.widget
      .messages(context);
}

class _ValidationMessagesConfigState extends State<ValidationMessagesConfig> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
