import 'package:ready_validation/ready_validation.dart';

void main() {
  // ignore: avoid_print
  print("1".isValid(validate: (v) => v.isNumber()));
}
