part of 'context_extension.dart';

extension StringValidateCreatorExtension<T> on T {
  /// check is the value is valid
  bool isValid<R>({
    ReadyValidationMessages? messages,
    required FieldValidator<T?, R> Function(FieldValidator<T, T> validator)
        validate,
  }) {
    var validator = validate(FieldValidator<T, T>._(
      messages: messages ?? ReadyValidationMessagesAr(),
      convert: (v) => v,
      validatePrev: (v) => null,
      prevErrors: (v) => [],
      validate: (value) => null,
    ));

    return validator.isValid(this);
  }

  /// check is the value is valid
  bool isValidOf<R>({
    required BuildContext context,
    required FieldValidator<T?, R> Function(FieldValidator<T, T> validator)
        validate,
  }) {
    var validator = validate(context.validatorFor());

    return validator.isValid(this);
  }

  /// returns the error message if exists
  String? errorMessage<R>({
    ReadyValidationMessages? messages,
    required FieldValidator<T?, R> Function(FieldValidator<T, T> validator)
        validate,
  }) {
    var validator = validate(FieldValidator<T, T>._(
      messages: messages ?? ReadyValidationMessagesAr(),
      convert: (v) => v,
      validatePrev: (v) => null,
      prevErrors: (v) => [],
      validate: (value) => null,
    ));

    return validator(this);
  }

  /// returns the error message if exists
  String? errorMessageOf<R>({
    required BuildContext context,
    required FieldValidator<T?, R> Function(FieldValidator<T, T> validator)
        validate,
  }) {
    var validator = validate(context.validatorFor());

    return validator(this);
  }

  /// returns the list of error messages
  List<String> errorMessages<R>({
    ReadyValidationMessages? messages,
    required FieldValidator<T?, R> Function(FieldValidator<T, T> validator)
        validate,
  }) {
    var validator = validate(FieldValidator<T, T>._(
      messages: messages ?? ReadyValidationMessagesAr(),
      convert: (v) => v,
      validatePrev: (v) => null,
      prevErrors: (v) => [],
      validate: (value) => null,
    ));

    return validator.errors(this);
  }

  /// returns the list of error messages
  List<String> errorMessagesOf<R>({
    required BuildContext context,
    required FieldValidator<T?, R> Function(FieldValidator<T, T> validator)
        validate,
  }) {
    var validator = validate(context.validatorFor());

    return validator.errors(this);
  }
}
