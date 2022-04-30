import 'package:flutter_test/flutter_test.dart';
import 'package:ready_validation/ready_validation.dart';
import 'package:ready_validation/src/messages/messages_ar.dart';

void main() {
  test('isAftesr', () {
    var x = DateTime(2000, 10, 1);
    print(x
        .createValidator(messages: ReadyValidationMessagesAr())
        .required()
        .isAfter(DateTime.now())
        .call(x));
  });
  test('isAfter', () {
    expect(
      DateTime(2000, 10, 1)
          .isValid(validate: (v) => v.isAfter(DateTime(2000, 1, 1))),
      true,
    );
    expect(
      DateTime(2000, 10, 1)
          .isValid(validate: (v) => v.isAfter(DateTime(2000, 10, 1))),
      false,
    );
    expect(
      DateTime(2000, 10, 1)
          .isValid(validate: (v) => v.isAfterOrEqual(DateTime(2000, 1, 1))),
      true,
    );
    expect(
      DateTime(2000, 11, 1)
          .isValid(validate: (v) => v.isAfterOrEqual(DateTime(2000, 10, 1))),
      true,
    );
  });

  test('isBefore', () {
    expect(
      DateTime(2000, 1, 1)
          .isValid(validate: (v) => v.isBefore(DateTime(2000, 10, 1))),
      true,
    );
    expect(
      DateTime(2000, 10, 1)
          .isValid(validate: (v) => v.isBefore(DateTime(2000, 10, 1))),
      false,
    );
    expect(
      DateTime(2000, 10, 1)
          .isValid(validate: (v) => v.isAfterOrEqual(DateTime(2000, 10, 1))),
      true,
    );
    expect(
      DateTime(2000, 1, 1)
          .isValid(validate: (v) => v.isBeforeOrEqual(DateTime(2000, 10, 1))),
      true,
    );
  });

  test('isBetween', () {
    expect(
      DateTime(2000, 5, 1).isValid(
          validate: (v) =>
              v.isBetween(DateTime(2000, 1, 1), DateTime(2000, 10, 1))),
      true,
    );
    expect(
      DateTime(2000, 5, 1).isValid(
          validate: (v) =>
              v.isBetween(DateTime(2000, 10, 1), DateTime(2000, 1, 1))),
      false,
    );
    expect(
      DateTime(2000, 5, 1).isValid(
          validate: (v) =>
              v.isBetween(DateTime(2000, 5, 1), DateTime(2000, 10, 1))),
      false,
    );
    expect(
      DateTime(2000, 5, 1).isValid(
          validate: (v) =>
              v.isBetweenOrEqual(DateTime(2000, 5, 1), DateTime(2000, 10, 1))),
      true,
    );
    expect(
      DateTime(2000, 5, 1).isValid(
          validate: (v) =>
              v.isBetween(DateTime(2000, 1, 1), DateTime(2000, 5, 1))),
      false,
    );
    expect(
      DateTime(2000, 5, 1).isValid(
          validate: (v) =>
              v.isBetweenOrEqual(DateTime(2000, 1, 1), DateTime(2000, 5, 1))),
      true,
    );
  });
}
