part of 'ready_form.dart';

/// widget to show  submit error for specified key that returned from on submit method
class SubmitErrorMessageFor extends StatefulWidget {
  final Widget Function(ReadyFormState form, String? error)? builder;

  final String messageFor;
  const SubmitErrorMessageFor(
      {Key? key, this.builder, required this.messageFor})
      : super(key: key);

  @override
  State<SubmitErrorMessageFor> createState() => _SubmitErrorMessageForState();
}

class _SubmitErrorMessageForState extends State<SubmitErrorMessageFor> {
  TextStyle _getErrorStyle(ThemeData themeData) {
    final Color color = themeData.errorColor;
    return themeData.textTheme.caption!
        .copyWith(color: color)
        .merge(themeData.inputDecorationTheme.errorStyle);
  }

  @override
  Widget build(BuildContext context) {
    return FormStateListener(
      builder: (context, state) {
        var errors = state.submitErrors;
        var error = errors[widget.messageFor];
        if (widget.builder == null && error != null) {
          return Text(error, style: _getErrorStyle(Theme.of(context)));
        } else if (widget.builder == null) {
          return const SizedBox();
        } else {
          return widget.builder!(ReadyForm._of(context)!, error);
        }
      },
    );
  }
}
