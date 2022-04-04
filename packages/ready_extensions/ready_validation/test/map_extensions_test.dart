import 'package:flutter_test/flutter_test.dart';
import 'package:ready_validation/ready_validation.dart';

void main() {
  test('hasLength', () {
    expect({}.isValid(validate: (v) => v.hasLength(0)), true);
    expect({1: ""}.isValid(validate: (v) => v.hasLength(1)), true);
    expect({1: ""}.isValid(validate: (v) => v.hasLength(0)), false);
  });

  test('hasMinLength', () {
    expect({}.isValid(validate: (v) => v.hasMinLength(2)), false);
    expect({1: "", 2: ""}.isValid(validate: (v) => v.hasLength(2)), true);
    expect({1: ""}.isValid(validate: (v) => v.hasLength(2)), false);
  });

  test('hasMaxLength', () {
    expect({}.isValid(validate: (v) => v.hasMaxLength(2)), true);
    expect({1: "", 2: ""}.isValid(validate: (v) => v.hasMaxLength(2)), true);
    expect({1: "", 2: "", 3: ""}.isValid(validate: (v) => v.hasMaxLength(2)),
        false);
    expect({1: ""}.isValid(validate: (v) => v.hasMaxLength(2)), true);
  });

  test('hasRange', () {
    expect([].isValid(validate: (v) => v.hasRange(2, 4)), false);
    expect({1: "", 2: ""}.isValid(validate: (v) => v.hasRange(2, 4)), true);
    expect(
        {1: "", 2: "", 3: ""}.isValid(validate: (v) => v.hasRange(2, 4)), true);
    expect(
        {1: "", 2: "", 3: "", 4: ""}.isValid(validate: (v) => v.hasRange(2, 4)),
        true);
    expect(
        {1: "", 2: "", 3: "", 4: "", 5: ""}
            .isValid(validate: (v) => v.hasRange(2, 4)),
        false);
  });

  test('notEmpty', () {
    expect([].isValid(validate: (v) => v.notEmpty()), false);
    expect({1: "", 2: ""}.isValid(validate: (v) => v.notEmpty()), true);
  });

  test('contains', () {
    expect({2: "", 3: "", 4: ""}.isValid(validate: (v) => v.containsKey(1)),
        false);
    expect(
        {1: "", 2: "", 3: "", 4: ""}.isValid(validate: (v) => v.containsKey(1)),
        true);
  });

  test('notContains', () {
    expect({2: "", 3: "", 4: ""}.isValid(validate: (v) => v.notContainsKey(1)),
        true);
    expect(
        {1: "", 2: "", 3: "", 4: ""}
            .isValid(validate: (v) => v.notContainsKey(1)),
        false);
  });

  test('contains', () {
    expect(
        {2: "2", 3: "3", 4: "4"}.isValid(validate: (v) => v.containsValue("1")),
        false);
    expect(
        {1: "1", 2: "2"}.isValid(validate: (v) => v.containsValue("1")), true);
  });

  test('notContains', () {
    expect(
        {2: "2", 3: "3", 4: "4"}
            .isValid(validate: (v) => v.notContainsValue("1")),
        true);
    expect(
        {1: "1", 2: "2", 3: "3", 4: "4"}
            .isValid(validate: (v) => v.notContainsValue("1")),
        false);
  });
}
