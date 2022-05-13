part of 'context_extension.dart';

typedef ValidatorForCallBack<T, R> = FieldValidator<T, R> Function(
    FieldValidator<T, R> validator, R object);

class TransformedValue<T, R> {
  final T _value;
  final R Function(T value) _convert;

  TransformedValue._(this._value, this._convert);
  T get originalValue => _value;
  R get value => _convert(_value);
}

class FieldValidator<T, R> {
  final String? Function(TransformedValue<T, R> value) _validate;
  final String? Function(TransformedValue<T, R> value)? _validatePrev;
  final List<String> Function(TransformedValue<T, R> value)? _prevErrors;
  final ReadyValidationMessages _messages;
  final R Function(T value) _convert;
  FieldValidator._({
    required String? Function(TransformedValue<T, R> value) validate,
    String? Function(TransformedValue<T, R> value)? validatePrev,
    required ReadyValidationMessages messages,
    required R Function(T value) convert,
    List<String> Function(TransformedValue<T, R> value)? prevErrors,
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
    var transformed = TransformedValue<T, R>._(value, _convert);
    return _call(transformed);
  }

  String? _call(TransformedValue<T, R> transformed) {
    return _validatePrev?.call(transformed) ?? _validate(transformed);
  }

  /// get all errors
  List<String> errors(T value) {
    var transformed = TransformedValue<T, R>._(value, _convert);
    return _errors(transformed);
  }

  List<String> _errors(TransformedValue<T, R> transformed) {
    var _error = _call(transformed);
    return [
      ...(_prevErrors?.call(transformed) ?? []),
      if (_error != null) _error,
    ];
  }

  /// replace the messages
  /// all the next validations will use the new messages
  /// the old messages will be kept in the _prevErrors
  FieldValidator<T, R> withMessages(ReadyValidationMessagesAr messages) {
    return FieldValidator<T, R>._(
      validate: _validate,
      prevErrors: _prevErrors,
      validatePrev: _validatePrev,
      convert: _convert,
      messages: messages,
    );
  }

  /// add the next validation to the validations tree
  FieldValidator<T, R> next(
      String? Function(ReadyValidationMessages messages, R value) next) {
    return FieldValidator<T, R>._(
      validate: (value) {
        return next(_messages, value.value);
      },
      prevErrors: (v) => _errors(v),
      validatePrev: (v) => _call(v),
      convert: _convert,
      messages: _messages,
    );
  }

  /// if the condition returns false then the previous validation will be ignored
  FieldValidator<T, R> when(
      bool Function(TransformedValue<T, R> value) condition) {
    return FieldValidator<T, R>._(
      validate: (value) {
        if (condition(value)) {
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
  FieldValidator<T, R> allWhen(
      bool Function(TransformedValue<T, R> value) condition) {
    return FieldValidator<T, R>._(
      validate: (value) {
        if (condition(value)) {
          return _validate(value);
        }
        return null;
      },
      prevErrors: _prevErrors == null
          ? null
          : (value) {
              if (condition(value)) {
                return _prevErrors!(value);
              }
              return [];
            },
      validatePrev: _validatePrev == null
          ? null
          : (value) {
              if (condition(value)) {
                return _validatePrev!(value);
              }
              return null;
            },
      convert: _convert,
      messages: _messages,
    );
  }

  /// if the condition returns true then the previous validation will be ignored
  FieldValidator<T, R> whenNot(
      bool Function(TransformedValue<T, R> value) condition) {
    return FieldValidator<T, R>._(
      validate: (value) {
        if (!condition(value)) {
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
  FieldValidator<T, R> allWhenNot(
      bool Function(TransformedValue<T, R> value) condition) {
    return FieldValidator<T, R>._(
      validate: (value) {
        if (!condition(value)) {
          return _validate(value);
        }
        return null;
      },
      prevErrors: _prevErrors == null
          ? null
          : (value) {
              if (!condition(value)) {
                return _prevErrors!(value);
              }
              return [];
            },
      validatePrev: _validatePrev == null
          ? null
          : (value) {
              if (!condition(value)) {
                return _validatePrev!(value);
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
      prevErrors: (v) => errors(v.originalValue),
      validatePrev: (v) => call(v.originalValue),
      convert: (v) => convert(_convert(v)),
    );
  }

  /// transform from the current type to another type
  FieldValidator<T, T> transformBack() {
    return FieldValidator<T, T>._(
      validate: (v) => null,
      messages: _messages,
      prevErrors: (v) => errors(v.originalValue),
      validatePrev: (v) => call(v.originalValue),
      convert: (v) => v,
    );
  }

  /// validate a sub field without transform current validator
  FieldValidator<T, R> validatorFor<Res>(
    FieldValidator<T, Res> Function(ReadyValidationMessages messages, R value)
        validator,
  ) {
    return FieldValidator<T, R>._(
      validate: (value) {
        return validator(_messages, value.value).call(value.originalValue);
      },
      prevErrors: (v) => _errors(v),
      validatePrev: (v) => _call(v),
      convert: _convert,
      messages: _messages,
    );
  }

  /// validate a sub field without transform current validator
  FieldValidator<T, R> multiValidate(
      List<ValidatorForCallBack<T, R>> validators) {
    var validator = this;
    for (var _validator in validators) {
      validator = FieldValidator<T, R>._(
        validate: (value) {
          return _validator(this, value.value)._call(value);
        },
        prevErrors: validator._prevErrors,
        validatePrev: validator._call,
        convert: _convert,
        messages: _messages,
      );
    }
    return validator;
  }
}
