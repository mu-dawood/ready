part of 'validations.dart';

class ValidationMessagesConfig extends StatefulWidget {
  final ValidationMessages Function(BuildContext context) messages;
  final Widget child;
  const ValidationMessagesConfig({Key? key, required this.messages, required this.child}) : super(key: key);

  @override
  _ValidationMessagesConfigState createState() => _ValidationMessagesConfigState();

  static ValidationMessages? of(BuildContext context) => context.findRootAncestorStateOfType<_ValidationMessagesConfigState>()?._messages(context);
}

class _ValidationMessagesConfigState extends State<ValidationMessagesConfig> {
  ValidationMessages _messages(BuildContext context) {
    var perent = ValidationMessagesConfig.of(context);
    return perent?.withOther(widget.messages(context)) ?? widget.messages(context);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
