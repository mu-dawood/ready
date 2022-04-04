import 'package:flutter_test/flutter_test.dart';
import 'package:ready_validation/ready_validation.dart';

void main() {
  test('required', () {
    String? test1;
    expect(test1.isValid(validate: (v) => v.required()), false);
  });

  test('matches', () {
    String test2 = "test";
    expect(test2.isValid(validate: (v) => v.matches(RegExp(r'^te'))), true);
    expect(test2.isValid(validate: (v) => v.matches(RegExp(r'^ss'))), false);
  });

  test('notEmptyOrWhiteSpace', () {
    String test2 = "test";
    expect(test2.isValid(validate: (v) => v.notEmptyOrWhiteSpace()), true);
    expect(''.isValid(validate: (v) => v.notEmptyOrWhiteSpace()), false);
    expect(''.isValid(validate: (v) => v.notEmptyOrWhiteSpace()), false);
  });

  test('notEmpty', () {
    String test2 = "test";
    expect(test2.isValid(validate: (v) => v.notEmpty()), true);
    expect(''.isValid(validate: (v) => v.notEmpty()), false);
  });

  test('contains', () {
    String test2 = "test";
    expect(test2.isValid(validate: (v) => v.contains("te")), true);
    expect(test2.isValid(validate: (v) => v.contains("sw")), false);
  });

  test('startsWith', () {
    String test2 = "test";
    expect(test2.isValid(validate: (v) => v.startsWith("te")), true);
    expect(test2.isValid(validate: (v) => v.startsWith("sw")), false);
  });

  test('endsWith', () {
    String test2 = "test";
    expect(test2.isValid(validate: (v) => v.endsWith("st")), true);
    expect(test2.isValid(validate: (v) => v.endsWith("sw")), false);
  });

  test('hasMaxLength', () {
    String test2 = "test";
    expect(test2.isValid(validate: (v) => v.hasMaxLength(10)), true);
    expect(test2.isValid(validate: (v) => v.hasMaxLength(2)), false);
  });

  test('hasMinLength', () {
    String test2 = "test";
    expect(test2.isValid(validate: (v) => v.hasMinLength(3)), true);
    expect(test2.isValid(validate: (v) => v.hasMinLength(10)), false);
  });

  test('hasLength', () {
    String test2 = "test";
    expect(test2.isValid(validate: (v) => v.hasLength(4)), true);
    expect(test2.isValid(validate: (v) => v.hasLength(5)), false);
  });

  test('hasRange', () {
    String test2 = "test";
    expect(test2.isValid(validate: (v) => v.hasRange(3, 7)), true);
    expect(test2.isValid(validate: (v) => v.hasRange(5, 7)), false);
    expect(test2.isValid(validate: (v) => v.hasRange(1, 3)), false);
  });
  test('isNumber', () {
    expect('-555'.isValid(validate: (v) => v.isNumber()), true);
    expect('555'.isValid(validate: (v) => v.isNumber()), true);
    expect('555.00'.isValid(validate: (v) => v.isNumber()), true);
    expect('-555.00'.isValid(validate: (v) => v.isNumber()), true);
    expect('test'.isValid(validate: (v) => v.isNumber()), false);
  });

  test('isInteger', () {
    expect('-555'.isValid(validate: (v) => v.isInteger()), true);
    expect('555'.isValid(validate: (v) => v.isInteger()), true);
    expect('555.00'.isValid(validate: (v) => v.isInteger()), false);
    expect('-555.00'.isValid(validate: (v) => v.isInteger()), false);
    expect('test'.isValid(validate: (v) => v.isInteger()), false);
  });

  test('isDecimal', () {
    expect('-555'.isValid(validate: (v) => v.isDecimal()), true);
    expect('555'.isValid(validate: (v) => v.isDecimal()), true);
    expect('555.00'.isValid(validate: (v) => v.isDecimal()), true);
    expect('-555.00'.isValid(validate: (v) => v.isDecimal()), true);
    expect('test'.isValid(validate: (v) => v.isDecimal()), false);
  });
}
