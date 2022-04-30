part of 'ready_form.dart';

/// listen for form submit event
class FormStateListener extends StatelessWidget {
  final Widget Function(BuildContext context, FormSubmitState state) builder;
  const FormStateListener({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ReadyForm._of(context)!._state,
      builder: (BuildContext ctx, FormSubmitState v, c) => builder(ctx, v),
    );
  }
}
