import 'package:flutter_test/flutter_test.dart';
import 'package:ready_validation/ready_validation.dart';

void main() {
  test('hasLength', () {
    expect({}.validateWith((v) => v.hasLength(0)).isValid(), true);
    expect({1: ""}.validateWith((v) => v.hasLength(1)).isValid(), true);
    expect({1: ""}.validateWith((v) => v.hasLength(0)).isValid(), false);
  });

  test('hasMinLength', () {
    expect({}.validateWith((v) => v.hasMinLength(2)).isValid(), false);
    expect({1: "", 2: ""}.validateWith((v) => v.hasLength(2)).isValid(), true);
    expect({1: ""}.validateWith((v) => v.hasLength(2)).isValid(), false);
  });

  test('hasMaxLength', () {
    expect({}.validateWith((v) => v.hasMaxLength(2)).isValid(), true);
    expect(
        {1: "", 2: ""}.validateWith((v) => v.hasMaxLength(2)).isValid(), true);
    expect(
        {1: "", 2: "", 3: ""}.validateWith((v) => v.hasMaxLength(2)).isValid(),
        false);
    expect({1: ""}.validateWith((v) => v.hasMaxLength(2)).isValid(), true);
  });

  test('hasRange', () {
    expect([].validateWith((v) => v.hasRange(2, 4)).isValid(), false);
    expect(
        {1: "", 2: ""}.validateWith((v) => v.hasRange(2, 4)).isValid(), true);
    expect(
        {1: "", 2: "", 3: ""}.validateWith((v) => v.hasRange(2, 4)).isValid(),
        true);
    expect(
        {1: "", 2: "", 3: "", 4: ""}
            .validateWith((v) => v.hasRange(2, 4))
            .isValid(),
        true);
    expect(
        {1: "", 2: "", 3: "", 4: "", 5: ""}
            .validateWith((v) => v.hasRange(2, 4))
            .isValid(),
        false);
  });

  test('notEmpty', () {
    expect([].validateWith((v) => v.notEmpty()).isValid(), false);
    expect({1: "", 2: ""}.validateWith((v) => v.notEmpty()).isValid(), true);
  });

  test('contains', () {
    expect(
        {2: "", 3: "", 4: ""}.validateWith((v) => v.containsKey(1)).isValid(),
        false);
    expect(
        {1: "", 2: "", 3: "", 4: ""}
            .validateWith((v) => v.containsKey(1))
            .isValid(),
        true);
  });

  test('notContains', () {
    expect(
        {2: "", 3: "", 4: ""}
            .validateWith((v) => v.notContainsKey(1))
            .isValid(),
        true);
    expect(
        {1: "", 2: "", 3: "", 4: ""}
            .validateWith((v) => v.notContainsKey(1))
            .isValid(),
        false);
  });

  test('contains', () {
    expect(
        {2: "2", 3: "3", 4: "4"}
            .validateWith((v) => v.containsValue("1"))
            .isValid(),
        false);
    expect({1: "1", 2: "2"}.validateWith((v) => v.containsValue("1")).isValid(),
        true);
  });

  test('notContains', () {
    expect(
        {2: "2", 3: "3", 4: "4"}
            .validateWith((v) => v.notContainsValue("1"))
            .isValid(),
        true);
    expect(
        {1: "1", 2: "2", 3: "3", 4: "4"}
            .validateWith((v) => v.notContainsValue("1"))
            .isValid(),
        false);
  });
}
