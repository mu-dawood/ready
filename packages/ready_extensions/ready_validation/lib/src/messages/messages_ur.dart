


import 'messages.dart';

/// The translations for Urdu (`ur`).
class ReadyValidationMessagesUr extends ReadyValidationMessages {
  ReadyValidationMessagesUr([String locale = 'ur']) : super(locale);

  @override
  String get required => 'معذرت! اس کو پر کرنا ضروری ہے';

  @override
  String hasMaxLength(String value, int max) {
    return 'يجب أن لا يزيد طول النص عن $max';
  }

  @override
  String hasMinLength(String value, int min) {
    return 'يجب أن لا يقل طول النص عن $min';
  }

  @override
  String hasRange(String value, int min, int max) {
    return 'يجب إدخال نص  لايقل طوله عن $min ولا يزيد عن $max';
  }

  @override
  String isNumber(Object value) {
    return 'يجب إدخال رقم';
  }

  @override
  String isInteger(Object value) {
    return 'يجب إدخال رقم';
  }

  @override
  String isDecimal(Object value) {
    return 'يجب إدخال رقم';
  }
}
