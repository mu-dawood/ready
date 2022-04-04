part of 'context_extension.dart';

// abstract class FieldValidator<Caller, T> {
//   FieldValidator<Caller, T> _next(
//       String? Function(ReadyValidationMessages messages, T value) next);
//   FieldValidator<Caller, T> when(bool Function(T value) condition);
//   FieldValidator<Caller, T> whenNot(bool Function(T value) condition);
//   FieldValidator<Caller, R> transform<R>(R Function(T value) convert);
//   bool isValid(Caller value);
//   String? call(Caller value);
// }

// class _FieldValidator<T, R> extends FieldValidator<T, T> {
//   final String? Function(T value) _validate;
//   final ReadyValidationMessages _messages;
//   _FieldValidator._({
//     required String? Function(T value) validate,
//     required ReadyValidationMessages messages,
//   })  : _validate = validate,
//         _messages = messages;

//   @override
//   bool isValid(T value) {
//     return _validate(value) == null;
//   }

//   @override
//   String? call(T value) {
//     return _validate(value);
//   }

//   @override
//   _FieldValidator<T, R> _next(
//     String? Function(ReadyValidationMessages messages, T value) next,
//   ) {
//     return _FieldValidator<T, R>._(
//       validate: (value) {
//         return call(value) ?? next(_messages, value);
//       },
//       messages: _messages,
//     );
//   }

//   @override
//   _FieldValidator<T, R> when(bool Function(T value) condition) {
//     return _FieldValidator<T, R>._(
//       validate: (value) {
//         if (condition(value)) {
//           return call(value);
//         }
//         return null;
//       },
//       messages: _messages,
//     );
//   }

//   @override
//   _FieldValidator<T, R> whenNot(bool Function(T value) condition) {
//     return _FieldValidator<T, R>._(
//       validate: (value) {
//         if (!condition(value)) {
//           return call(value);
//         }
//         return null;
//       },
//       messages: _messages,
//     );
//   }

//   @override
//   TransformedFieldValidator<T, R> transform<R>(R Function(T value) convert) {
//     return TransformedFieldValidator<T, R>._(
//       validate: (value) => null,
//       messages: _messages,
//       convert: convert,
//     );
//   }
// }

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

  bool isValid(T value) {
    return call(value) == null;
  }

  String? call(T value) {
    return _validatePrev(value) ?? _validate(value);
  }

  List<String> errors(T value) {
    var _error = call(value);
    return [
      ..._prevErrors(value),
      if (_error != null) _error,
    ];
  }

  FieldValidator<T, R> _next(
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
