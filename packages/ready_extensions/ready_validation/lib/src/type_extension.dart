part of 'context_extension.dart';

extension StringValidateCreatorExtension<T> on T {
  /// check is the value is valid
  bool isValid<R>({
    ReadyValidationMessages? messages,
    required FieldValidator<T?, R> Function(_FieldValidator<T> validator)
        validate,
  }) {
    var validator = validate(_FieldValidator<T>._(
      messages: messages ?? ReadyValidationMessagesAr(),
      validate: (value) => null,
    ));

    return validator.isValid(this);
  }

  /// check is the value is valid
  bool isValidOf<R>({
    required BuildContext context,
    required FieldValidator<T?, R> Function(_FieldValidator<T> validator)
        validate,
  }) {
    var validator = validate(_FieldValidator<T>._(
      messages: ValidationMessagesConfig.of(context) ??
          ReadyValidationMessages.of(context) ??
          ReadyValidationMessagesAr(),
      validate: (value) => null,
    ));

    return validator.isValid(this);
  }
}
