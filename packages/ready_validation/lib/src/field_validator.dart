part of 'context_extension.dart';

class FieldValidator<T, R> {
  final String? Function(T value) _validate;
  final String? Function(T value) _validatePrev;
  final List<String> Function(T value) _prevErrors;
  final ReadyValidationMessages _messages;
  final R Function(T value) _convert;
  FieldValidator._({
    required String? Function(T value) validate,
    required String? Function(T value) validatePrev,
    required ReadyValidationMessages messages,
    required R Function(T value) convert,
    required List<String> Function(T value) prevErrors,
  })  : _validate = validate,
        _convert = convert,
        _prevErrors = prevErrors,
        _validatePrev = validatePrev,
        _messages = messages;

  /// check if the value is valid
  bool isValid(T value) {
    return call(value) == null;
  }

  /// the call method to be used with form fields
  String? call(T value) {
    return _validatePrev(value) ?? _validate(value);
  }

  /// get all errors
  List<String> errors(T value) {
    var _error = call(value);
    return [
      ..._prevErrors(value),
      if (_error != null) _error,
    ];
  }

  /// add the next validation to the validations tree
  FieldValidator<T, R> next(
    String? Function(ReadyValidationMessages messages, R value) next,
  ) {
    return FieldValidator<T, R>._(
      validate: (value) {
        return next(_messages, _convert(value));
      },
      prevErrors: (v) => errors(v),
      validatePrev: (v) => call(v),
      convert: _convert,
      messages: _messages,
    );
  }

  /// if the condition returns false then the previous validation will be ignored
  FieldValidator<T, R> when(bool Function(R value) condition) {
    return FieldValidator<T, R>._(
      validate: (value) {
        if (condition(_convert(value))) {
          return _validate(value);
        }
        return null;
      },
      prevErrors: _prevErrors,
      validatePrev: _validatePrev,
      convert: _convert,
      messages: _messages,
    );
  }

  /// if the condition returns false then all previous validation will be ignored
  FieldValidator<T, R> allWhen(bool Function(R value) condition) {
    return FieldValidator<T, R>._(
      validate: (value) {
        if (condition(_convert(value))) {
          return _validate(value);
        }
        return null;
      },
      prevErrors: (value) {
        if (condition(_convert(value))) {
          return _prevErrors(value);
        }
        return [];
      },
      validatePrev: (value) {
        if (condition(_convert(value))) {
          return _validatePrev(value);
        }
        return null;
      },
      convert: _convert,
      messages: _messages,
    );
  }

  /// if the condition returns true then the previous validation will be ignored
  FieldValidator<T, R> whenNot(bool Function(R value) condition) {
    return FieldValidator<T, R>._(
      validate: (value) {
        if (!condition(_convert(value))) {
          return _validate(value);
        }
        return null;
      },
      prevErrors: _prevErrors,
      validatePrev: _validatePrev,
      convert: _convert,
      messages: _messages,
    );
  }

  /// if the condition returns true then all previous validation will be ignored
  FieldValidator<T, R> allWhenNot(bool Function(R value) condition) {
    return FieldValidator<T, R>._(
      validate: (value) {
        if (!condition(_convert(value))) {
          return _validate(value);
        }
        return null;
      },
      prevErrors: (value) {
        if (!condition(_convert(value))) {
          return _prevErrors(value);
        }
        return [];
      },
      validatePrev: (value) {
        if (!condition(_convert(value))) {
          return _validatePrev(value);
        }
        return null;
      },
      convert: _convert,
      messages: _messages,
    );
  }

  /// transform from the current type to another type
  FieldValidator<T, Res> transform<Res>(Res Function(R value) convert) {
    return FieldValidator<T, Res>._(
      validate: (v) => null,
      messages: _messages,
      prevErrors: errors,
      validatePrev: call,
      convert: (v) => convert(_convert(v)),
    );
  }
}
