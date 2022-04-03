part of 'validations.dart';

class FieldValidator<T> {
  final String? Function(T? value) validate;
  final BuildContext context;
  FieldValidator._({
    required this.validate,
    required this.context,
  });

  String? call(T? value) {
    return validate(value);
  }

  FieldValidator<T> add(
      FieldValidator<T> Function(BuildContext context) other) {
    return FieldValidator<T>._(
      validate: (v) {
        return validate(v) ?? other(context)(v);
      },
      context: context,
    );
  }
}
