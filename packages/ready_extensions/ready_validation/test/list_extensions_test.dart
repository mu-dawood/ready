import 'package:flutter_test/flutter_test.dart';
import 'package:ready_validation/ready_validation.dart';

void main() {
  test('hasLength', () {
    expect([].isValid(validate: (v) => v.hasLength(0)), true);
    expect([1].isValid(validate: (v) => v.hasLength(1)), true);
    expect([1].isValid(validate: (v) => v.hasLength(0)), false);
  });

  test('hasMinLength', () {
    expect([].isValid(validate: (v) => v.hasMinLength(2)), false);
    expect([1, 2].isValid(validate: (v) => v.hasLength(2)), true);
    expect([1].isValid(validate: (v) => v.hasLength(2)), false);
  });

  test('hasMaxLength', () {
    expect([].isValid(validate: (v) => v.hasMaxLength(2)), true);
    expect([1, 2].isValid(validate: (v) => v.hasMaxLength(2)), true);
    expect([1, 2, 3].isValid(validate: (v) => v.hasMaxLength(2)), false);
    expect([1].isValid(validate: (v) => v.hasMaxLength(2)), true);
  });

  test('hasRange', () {
    expect([].isValid(validate: (v) => v.hasRange(2, 4)), false);
    expect([1, 2].isValid(validate: (v) => v.hasRange(2, 4)), true);
    expect([1, 2, 3].isValid(validate: (v) => v.hasRange(2, 4)), true);
    expect([1, 2, 3, 4].isValid(validate: (v) => v.hasRange(2, 4)), true);
    expect([1, 2, 3, 4, 5].isValid(validate: (v) => v.hasRange(2, 4)), false);
  });

  test('notEmpty', () {
    expect([].isValid(validate: (v) => v.notEmpty()), false);
    expect([1].isValid(validate: (v) => v.notEmpty()), true);
  });

  test('contains', () {
    expect([5, 6, 7].isValid(validate: (v) => v.contains(1)), false);
    expect([1, 2, 3].isValid(validate: (v) => v.contains(1)), true);
  });

  test('notContains', () {
    expect([5, 6, 7].isValid(validate: (v) => v.notContains(1)), true);
    expect([1, 2, 3].isValid(validate: (v) => v.notContains(1)), false);
  });
}
