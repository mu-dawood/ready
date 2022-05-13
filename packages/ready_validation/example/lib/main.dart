import 'package:ready_validation/ready_validation.dart';

void main() {
  var number = "7";

  var isValid = number
      .validateWith((v) => v.isNumber())
      .validateWith((v) => v.isBetween(5, 10))
      .isValid();

  /// or
  isValid = number.validateWith((v) => v.isNumber().isBetween(5, 10)).isValid();

  // ignore: avoid_print
  print(isValid);
}
