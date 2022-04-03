part of '../context_extension.dart';

extension StringValidationExtension<T> on FieldValidator<T, String> {
  /// check if the value starts with [pattern]
  FieldValidator<T, String> startsWith(Pattern pattern,
      [MessageCallBack<String>? message]) {
    return _next(
      (messages, value) => !value.startsWith(pattern)
          ? message?.call(value) ??
              messages.startsWith(value, pattern.toString())
          : null,
    );
  }

  /// check if the value contains [pattern]
  FieldValidator<T, String> contains(Pattern pattern,
      [MessageCallBack<String>? message]) {
    return _next(
      (messages, value) => !value.contains(pattern)
          ? message?.call(value) ?? messages.contains(value, pattern.toString())
          : null,
    );
  }

  /// check if the value ends with [other]
  FieldValidator<T, String> endsWith(String other,
      [MessageCallBack<String>? message]) {
    return _next(
      (messages, value) => !value.endsWith(other)
          ? message?.call(value) ?? messages.startsWith(value, other)
          : null,
    );
  }

  /// check if the value is not empty
  FieldValidator<T, String> notEmpty([MessageCallBack<String>? message]) {
    return _next(
      (messages, value) =>
          value.isEmpty ? message?.call(value) ?? messages.notEmpty : null,
    );
  }

  /// check if the value is not empty and not contains only white spaces
  FieldValidator<T, String> notEmptyOrWhiteSpace(
      [MessageCallBack<String>? message]) {
    return _next(
      (messages, value) => value.isNullOrEmptyOrWhiteSpace
          ? message?.call(value) ?? messages.notEmpty
          : null,
    );
  }

  /// check is the value matches [regExp]
  FieldValidator<T, String> regex(RegExp regExp,
      [MessageCallBack<String>? message]) {
    return _next((messages, value) {
      if (!regExp.hasMatch(value)) {
        return message?.call(value) ?? messages.regexp;
      }
      return null;
    });
  }

  /// check is the value has min length of [min]
  FieldValidator<T, String> hasMinLength(int min,
      [MessageCallBack<String>? message]) {
    return _next((messages, value) {
      if (value.length < min) {
        return message?.call(value) ?? messages.hasMinLength(value, min);
      }
      return null;
    });
  }

  /// check is the value has max length of [max]
  FieldValidator<T, String> hasMaxLength(int max,
      [MessageCallBack<String>? message]) {
    return _next((messages, value) {
      if (value.length > max) {
        return message?.call(value) ?? messages.hasMaxLength(value, max);
      }
      return null;
    });
  }

  /// check is the value length is between [min] and [max]
  FieldValidator<T, String> hasRange(int min, int max,
      [MessageCallBack<String>? message]) {
    return _next((messages, value) {
      if (value.length < min || value.length > max) {
        return message?.call(value) ?? messages.hasRange(value, min, max);
      }
      return null;
    });
  }

  /// check is the value is number
  FieldValidator<T, num> isNumber([MessageCallBack<String>? message]) {
    return _next((messages, value) {
      if (num.tryParse(value) != null) {
        return message?.call(value) ?? messages.isNumber(value);
      }
      return null;
    }).transform((value) => num.parse(value));
  }

  /// check is the value is [int]
  FieldValidator<T, int> isInteger([MessageCallBack<String>? message]) {
    return _next((messages, value) {
      if (int.tryParse(value) != null) {
        return message?.call(value) ?? messages.isInteger(value);
      }
      return null;
    }).transform((value) => int.parse(value));
  }

  /// check is the value is [double]
  FieldValidator<T, int> isDecimal([MessageCallBack<String>? message]) {
    return _next((messages, value) {
      if (double.tryParse(value) != null) {
        return message?.call(value) ?? messages.isDecimal(value);
      }
      return null;
    }).transform((value) => int.parse(value));
  }

  /// check is the value is [DateTime]
  FieldValidator<T, DateTime> isDateTime([MessageCallBack<String>? message]) {
    return _next((messages, value) {
      if (DateTime.tryParse(value) != null) {
        return message?.call(value) ?? messages.isDateTime(value);
      }
      return null;
    }).transform((value) => DateTime.parse(value));
  }

  /// check is the value is [TimeOfDay]
  FieldValidator<T, TimeOfDay> isTimeOfDay([MessageCallBack<String>? message]) {
    return _next((messages, value) {
      if (!value.isTimeOfDay) {
        return message?.call(value) ?? messages.isTimeOfDay(value);
      }
      return null;
    }).transform((value) => value.toTimeOfDay()!);
  }
}
