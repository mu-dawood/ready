part of 'context_extension.dart';

abstract class FieldValidator<Caller, T> {
  FieldValidator<Caller, T> _next(
      String? Function(ReadyValidationMessages messages, T value) next);
  FieldValidator<Caller, T> when(bool Function(T value) condition);
  FieldValidator<Caller, T> whenNot(bool Function(T value) condition);
  FieldValidator<Caller, R> transform<R>(R Function(T value) convert);
  bool isValid(Caller value);
  String? call(Caller value);
}

class _FieldValidator<T> extends FieldValidator<T, T> {
  final String? Function(T value) _validate;
  final ReadyValidationMessages _messages;
  _FieldValidator._({
    required String? Function(T value) validate,
    required ReadyValidationMessages messages,
  })  : _validate = validate,
        _messages = messages;

  @override
  bool isValid(T value) {
    return _validate(value) == null;
  }

  @override
  String? call(T value) {
    return _validate(value);
  }

  @override
  _FieldValidator<T> _next(
    String? Function(ReadyValidationMessages messages, T value) next,
  ) {
    return _FieldValidator<T>._(
      validate: (value) {
        return call(value) ?? next(_messages, value);
      },
      messages: _messages,
    );
  }

  @override
  _FieldValidator<T> when(bool Function(T value) condition) {
    return _FieldValidator<T>._(
      validate: (value) {
        if (condition(value)) {
          return call(value);
        }
        return null;
      },
      messages: _messages,
    );
  }

  @override
  _FieldValidator<T> whenNot(bool Function(T value) condition) {
    return _FieldValidator<T>._(
      validate: (value) {
        if (!condition(value)) {
          return call(value);
        }
        return null;
      },
      messages: _messages,
    );
  }

  @override
  TransformedFieldValidator<T, R> transform<R>(R Function(T value) convert) {
    return TransformedFieldValidator<T, R>._(
      validate: (value) => null,
      messages: _messages,
      convert: convert,
    );
  }
}

class TransformedFieldValidator<T, R> extends FieldValidator<T, R> {
  final String? Function(R value) _validate;
  final ReadyValidationMessages _messages;
  final R Function(T value) _convert;
  TransformedFieldValidator._({
    required String? Function(R value) validate,
    required ReadyValidationMessages messages,
    required R Function(T value) convert,
  })  : _validate = validate,
        _convert = convert,
        _messages = messages;

  @override
  bool isValid(T value) {
    return _validate(_convert(value)) == null;
  }

  @override
  String? call(T value) {
    return _validate(_convert(value));
  }

  @override
  TransformedFieldValidator<T, R> _next(
    String? Function(ReadyValidationMessages messages, R value) next,
  ) {
    return TransformedFieldValidator<T, R>._(
      validate: (value) {
        return _validate(value) ?? next(_messages, value);
      },
      convert: _convert,
      messages: _messages,
    );
  }

  @override
  TransformedFieldValidator<T, R> when(bool Function(R value) condition) {
    return TransformedFieldValidator<T, R>._(
      validate: (value) {
        if (condition(value)) {
          return _validate(value);
        }
        return null;
      },
      convert: _convert,
      messages: _messages,
    );
  }

  @override
  TransformedFieldValidator<T, R> whenNot(bool Function(R value) condition) {
    return TransformedFieldValidator<T, R>._(
      validate: (value) {
        if (!condition(value)) {
          return _validate(value);
        }
        return null;
      },
      convert: _convert,
      messages: _messages,
    );
  }

  @override
  TransformedFieldValidator<T, Res> transform<Res>(
      Res Function(R value) convert) {
    return TransformedFieldValidator<T, Res>._(
      validate: (value) => null,
      messages: _messages,
      convert: (v) => convert(_convert(v)),
    );
  }
}
