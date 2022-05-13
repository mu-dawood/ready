import 'package:flutter_test/flutter_test.dart';
import 'package:ready_validation/ready_validation.dart';

void main() {
  test('lessThan', () {
    expect(15.validateWith((v) => v.lessThan(20)).isValid(), true);
    expect((-15).validateWith((v) => v.lessThan(0)).isValid(), true);
    expect((-15).validateWith((v) => v.lessThan(-20)).isValid(), false);
    expect(15.validateWith((v) => v.lessThan(10)).isValid(), false);
    expect(15.validateWith((v) => v.lessThan(15)).isValid(), false);
    expect(15.validateWith((v) => v.lessThanOrEqual(15)).isValid(), true);
  });

  test('greaterThan', () {
    expect(15.validateWith((v) => v.greaterThan(10)).isValid(), true);
    expect((-15).validateWith((v) => v.greaterThan(-20)).isValid(), true);
    expect((-15).validateWith((v) => v.greaterThan(0)).isValid(), false);
    expect(15.validateWith((v) => v.greaterThan(20)).isValid(), false);
    expect(15.validateWith((v) => v.greaterThan(15)).isValid(), false);
    expect(15.validateWith((v) => v.greaterThanOrEqual(15)).isValid(), true);
  });

  test('between', () {
    expect(15.validateWith((v) => v.isBetween(10, 20)).isValid(), true);
    expect(15.validateWith((v) => v.isBetween(10, 15)).isValid(), false);
    expect(15.validateWith((v) => v.isBetween(15, 20)).isValid(), false);
    expect(15.validateWith((v) => v.isBetweenOrEqual(15, 20)).isValid(), true);
    expect(15.validateWith((v) => v.isBetweenOrEqual(10, 15)).isValid(), true);
  });

  test('isNegative', () {
    expect(15.validateWith((v) => v.isNegative()).isValid(), false);
    expect((-15).validateWith((v) => v.isNegative()).isValid(), true);
  });

  test('isPositive', () {
    expect(15.validateWith((v) => v.isPositive()).isValid(), true);
    expect((-15).validateWith((v) => v.isPositive()).isValid(), false);
  });

  test('isEven', () {
    expect(16.validateWith((v) => v.isEven()).isValid(), true);
    expect(15.validateWith((v) => v.isEven()).isValid(), false);
  });

  test('isOdd', () {
    expect(15.validateWith((v) => v.isOdd()).isValid(), true);
    expect(16.validateWith((v) => v.isOdd()).isValid(), false);
  });

  test('isDivisibleBy', () {
    expect(15.validateWith((v) => v.isDivisibleBy(2)).isValid(), false);
    expect(16.validateWith((v) => v.isDivisibleBy(2)).isValid(), true);
  });
}
