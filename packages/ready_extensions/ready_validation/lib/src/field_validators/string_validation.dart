part of '../context_extension.dart';

extension NullableStringValidationExtension on FieldValidator<String?> {
  _FieldValidator<String?, String> required() {
    return _next(
      (messages, value) =>
          value == null || value.isEmpty ? messages.required : null,
    ).transform((value) => value!);
  }
}

extension StringValidationExtension on _FieldValidator<String?, String> {
  _FieldValidator<String?, String> hasMinLength(int min) {
    return _next((messages, value) {
      if (value.length < min) return messages.hasMinLength(value, min);
      return null;
    });
  }

  _FieldValidator<String?, String> hasMaxLength(int max) {
    return _next((messages, value) {
      if (value.length > max) return messages.hasMaxLength(value, max);
      return null;
    });
  }

  _FieldValidator<String?, String> hasRange(int min, int max) {
    return _next((messages, value) {
      if (value.length < min || value.length > max) {
        return messages.hasRange(value, min, max);
      }
      return null;
    });
  }

  _FieldValidator<String?, num> isNumber() {
    return _next((messages, value) {
      if (num.tryParse(value) != null) {
        return messages.isNumber(value);
      }
      return null;
    }).transform((value) => num.parse(value));
  }

  _FieldValidator<String?, int> isInteger() {
    return _next((messages, value) {
      if (int.tryParse(value) != null) {
        return messages.isInteger(value);
      }
      return null;
    }).transform((value) => int.parse(value));
  }

  _FieldValidator<String?, int> isDecimal() {
    return _next((messages, value) {
      if (double.tryParse(value) != null) {
        return messages.isDecimal(value);
      }
      return null;
    }).transform((value) => int.parse(value));
  }

  ///
  _FieldValidator<String?, DateTime> isDateTime() {
    return _next((messages, value) {
      if (DateTime.tryParse(value) != null) {
        return messages.isDecimal(value);
      }
      return null;
    }).transform((value) => DateTime.parse(value));
  }

  _FieldValidator<String?, DateTime> isTimeOfDay() {
    return _next((messages, value) {
      if (TimeOfDay.tryParse(value) != null) {
        return messages.isDecimal(value);
      }
      return null;
    }).transform((value) => DateTime.parse(value));
  }
}
