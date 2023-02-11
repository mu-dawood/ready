part of 'ready_form.dart';

/// widget to show all submit errors that returned from on submit method
class ReadyFormErrorMessages extends StatefulWidget {
  final Widget Function(ReadyFormState form)? builder;
  const ReadyFormErrorMessages({Key? key, this.builder}) : super(key: key);

  @override
  State<ReadyFormErrorMessages> createState() => _ReadyFormErrorMessagesState();
}

class _ReadyFormErrorMessagesState extends State<ReadyFormErrorMessages> {
  TextStyle _getErrorStyle(ThemeData themeData) {
    final Color color = themeData.colorScheme.error;
    return themeData.textTheme.bodySmall!
        .copyWith(color: color)
        .merge(themeData.inputDecorationTheme.errorStyle);
  }

  @override
  Widget build(BuildContext context) {
    return FormStateListener(
      builder: (context, state) {
        var errors = state.submitErrors;
        if (widget.builder != null) {
          return widget.builder!(ReadyForm._of(context)!);
        } else if (errors.isEmpty) {
          return const SizedBox();
        } else {
          return Text(
            errors.values.join('\n'),
            style: _getErrorStyle(Theme.of(context)),
          );
        }
      },
    );
  }
}
