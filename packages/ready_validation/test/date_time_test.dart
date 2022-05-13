import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:ready_validation/ready_validation.dart';

void main() {
  setUp(() async {
    await initializeDateFormatting('ar', '');
  });
  test('isAfter', () {
    expect(
      DateTime(2000, 10, 1)
          .validateWith((v) => v.isAfter(DateTime(2000, 1, 1)))
          .isValid(),
      true,
    );
    expect(
      DateTime(2000, 10, 1)
          .validateWith((v) => v.isAfter(DateTime(2000, 10, 1)))
          .isValid(),
      false,
    );
    expect(
      DateTime(2000, 10, 1)
          .validateWith((v) => v.isAfterOrEqual(DateTime(2000, 1, 1)))
          .isValid(),
      true,
    );
    expect(
      DateTime(2000, 11, 1)
          .validateWith((v) => v.isAfterOrEqual(DateTime(2000, 10, 1)))
          .isValid(),
      true,
    );
  });

  test('isBefore', () {
    expect(
      DateTime(2000, 1, 1)
          .validateWith((v) => v.isBefore(DateTime(2000, 10, 1)))
          .isValid(),
      true,
    );
    expect(
      DateTime(2000, 10, 1)
          .validateWith((v) => v.isBefore(DateTime(2000, 10, 1)))
          .isValid(),
      false,
    );
    expect(
      DateTime(2000, 10, 1)
          .validateWith((v) => v.isAfterOrEqual(DateTime(2000, 10, 1)))
          .isValid(),
      true,
    );
    expect(
      DateTime(2000, 1, 1)
          .validateWith((v) => v.isBeforeOrEqual(DateTime(2000, 10, 1)))
          .isValid(),
      true,
    );
  });

  test('isBetween', () {
    expect(
      DateTime(2000, 5, 1)
          .validateWith(
              (v) => v.isBetween(DateTime(2000, 1, 1), DateTime(2000, 10, 1)))
          .isValid(),
      true,
    );
    expect(
      DateTime(2000, 5, 1)
          .validateWith(
              (v) => v.isBetween(DateTime(2000, 10, 1), DateTime(2000, 1, 1)))
          .isValid(),
      false,
    );
    expect(
      DateTime(2000, 5, 1)
          .validateWith(
              (v) => v.isBetween(DateTime(2000, 5, 1), DateTime(2000, 10, 1)))
          .isValid(),
      false,
    );
    expect(
      DateTime(2000, 5, 1)
          .validateWith((v) =>
              v.isBetweenOrEqual(DateTime(2000, 5, 1), DateTime(2000, 10, 1)))
          .isValid(),
      true,
    );
    expect(
      DateTime(2000, 5, 1)
          .validateWith(
              (v) => v.isBetween(DateTime(2000, 1, 1), DateTime(2000, 5, 1)))
          .isValid(),
      false,
    );
    expect(
      DateTime(2000, 5, 1)
          .validateWith((v) =>
              v.isBetweenOrEqual(DateTime(2000, 1, 1), DateTime(2000, 5, 1)))
          .isValid(),
      true,
    );
  });
}
