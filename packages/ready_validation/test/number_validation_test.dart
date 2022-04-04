import 'package:flutter_test/flutter_test.dart';
import 'package:ready_validation/ready_validation.dart';

void main() {
  test('lessThan', () {
    expect(15.isValid(validate: (v) => v.lessThan(20)), true);
    expect((-15).isValid(validate: (v) => v.lessThan(0)), true);
    expect((-15).isValid(validate: (v) => v.lessThan(-20)), false);
    expect(15.isValid(validate: (v) => v.lessThan(10)), false);
    expect(15.isValid(validate: (v) => v.lessThan(15)), false);
    expect(15.isValid(validate: (v) => v.lessThanOrEqual(15)), true);
  });

  test('greaterThan', () {
    expect(15.isValid(validate: (v) => v.greaterThan(10)), true);
    expect((-15).isValid(validate: (v) => v.greaterThan(-20)), true);
    expect((-15).isValid(validate: (v) => v.greaterThan(0)), false);
    expect(15.isValid(validate: (v) => v.greaterThan(20)), false);
    expect(15.isValid(validate: (v) => v.greaterThan(15)), false);
    expect(15.isValid(validate: (v) => v.greaterThanOrEqual(15)), true);
  });

  test('between', () {
    expect(15.isValid(validate: (v) => v.isBetween(10, 20)), true);
    expect(15.isValid(validate: (v) => v.isBetween(10, 15)), false);
    expect(15.isValid(validate: (v) => v.isBetween(15, 20)), false);
    expect(15.isValid(validate: (v) => v.isBetweenOrEqual(15, 20)), true);
    expect(15.isValid(validate: (v) => v.isBetweenOrEqual(10, 15)), true);
  });

  test('isNegative', () {
    expect(15.isValid(validate: (v) => v.isNegative()), false);
    expect((-15).isValid(validate: (v) => v.isNegative()), true);
  });

  test('isPositive', () {
    expect(15.isValid(validate: (v) => v.isPositive()), true);
    expect((-15).isValid(validate: (v) => v.isPositive()), false);
  });

  test('isEven', () {
    expect(16.isValid(validate: (v) => v.isEven()), true);
    expect(15.isValid(validate: (v) => v.isEven()), false);
  });

  test('isOdd', () {
    expect(15.isValid(validate: (v) => v.isOdd()), true);
    expect(16.isValid(validate: (v) => v.isOdd()), false);
  });

  test('isDivisibleBy', () {
    expect(15.isValid(validate: (v) => v.isDivisibleBy(2)), false);
    expect(16.isValid(validate: (v) => v.isDivisibleBy(2)), true);
  });
}
