part of 'context_extension.dart';

extension StringValidateCreatorExtension<T> on T {
  ValidatorOf<T?, R> validateWith<R>(
      FieldValidator<T?, R> Function(FieldValidator<T?, T>) callback) {
    return ValidatorOf<T?, R>._(
      this,
      callback(FieldValidator<T, T>._(
        messages: ReadyValidationMessagesAr(),
        convert: (v) => v,
        validate: (value) => null,
      )),
    );
  }
}

class ValidatorOf<T, R> {
  final T value;
  final FieldValidator<T, R> _validator;
  ValidatorOf._(this.value, this._validator);

  /// add validator to the current tree
  ValidatorOf<T, X> validateWith<X>(
      FieldValidator<T, X> Function(FieldValidator<T, R>) callback) {
    return ValidatorOf<T, X>._(value, callback(_validator));
  }

  /// check if the value is valid
  ValidatorOf<T, R> and(ValidateWithCallback<R> validator) {
    return ValidatorOf<T, R>._(value, _validator.validateWith(validator));
  }

  /// replace the messages
  /// all the next validations will use the new messages
  /// the old messages will be kept in the _prevErrors
  ValidatorOf<T, R> withMessages(ReadyValidationMessagesAr messages) {
    return ValidatorOf<T, R>._(value, _validator.withMessages(messages));
  }

  /// check is the value is valid
  bool isValid() {
    return _validator.isValid(value);
  }

  bool call() {
    return isValid();
  }

  /// returns the error message if exists
  String? errorMessage() {
    return _validator(value);
  }

  /// returns the list of error messages
  List<String> errorMessages() {
    return _validator.errors(value);
  }
}
