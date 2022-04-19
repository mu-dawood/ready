import 'package:flutter_test/flutter_test.dart';
import 'package:ready_validation/ready_validation.dart';

void main() {
  test('when', () {
    expect(
        "".isValid(
            validate: (v) => v.required().isEmail().when((value) => true)),
        false);
    String? test1 = "";
    expect(
        test1.isValid(
            validate: (v) => v.required().isEmail().when((value) => true)),
        false);

    expect(
        test1.isValid(
            validate: (v) => v.required().isEmail().when((value) => false)),
        true);
    expect(
        test1.isValid(
            validate: (v) => v.required().isEmail().allWhen((value) => false)),
        true);
  });

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

  test('isEmail', () {
    expect('test'.isValid(validate: (v) => v.isEmail()), false);
    expect('test@test'.isValid(validate: (v) => v.isEmail()), false);
    expect('test@test.com'.isValid(validate: (v) => v.isEmail()), true);
  });

  test('isCreditCard', () {
    expect('test'.isValid(validate: (v) => v.isCreditCard()), false);
    expect('76167617'.isValid(validate: (v) => v.isCreditCard()), false);
    expect('4988141966577868'.isValid(validate: (v) => v.isCreditCard()), true);
  });

  test('isAngelCompany', () {
    expect(
        'https://angel.co/company/twitter'
            .isValid(validate: (v) => v.isAngelCompany()),
        true);
  });

  test('isAngelJob', () {
    expect(
        'https://angel.co/company/twitter/jobs/576275-engineering-manager'
            .isValid(validate: (v) => v.isAngelJob()),
        true);
    expect(
        'https://angel.co/company/twitter'
            .isValid(validate: (v) => v.isAngelJob()),
        false);
  });

  test('isCrunchbaseOrganization', () {
    expect(
        'http://crunchbase.com/organization/twitter'
            .isValid(validate: (v) => v.isCrunchbaseOrganization()),
        true);
  });
  test('isCrunchbasePerson', () {
    expect(
        'http://crunchbase.com/person/dawood'
            .isValid(validate: (v) => v.isCrunchbasePerson()),
        true);
  });
  test('isFacebookUrl', () {
    expect(
        'http://fb.com/peter_parker-miller'
            .isValid(validate: (v) => v.isFacebookUrl()),
        true);
  });
  test('isGitHubUrl', () {
    expect(
        'https://github.com/lorey/socials'
            .isValid(validate: (v) => v.isGitHubUrl()),
        true);
  });
  test('isGooglePlusUrl', () {
    expect(
        'https://plus.google.com/+googleplususername'
            .isValid(validate: (v) => v.isGooglePlusUrl()),
        true);
  });
  test('isHackerNewsUserUrl', () {
    expect(
        'https://news.ycombinator.com/user?id=CamelCaps'
            .isValid(validate: (v) => v.isHackerNewsUserUrl()),
        true);
  });
  test('isHackerNewsItemUrl', () {
    expect(
        'https://news.ycombinator.com/item?id=23290375'
            .isValid(validate: (v) => v.isHackerNewsItemUrl()),
        true);
  });

  test('isInstagramUrl', () {
    expect(
        '-https://instagram.com/__disco__dude'
            .isValid(validate: (v) => v.isInstagramUrl()),
        true);
  });

  test('isLinkedInProfile', () {
    expect(
        'https://de.linkedin.com/in/peter-m%C3%BCller-81a8/'
            .isValid(validate: (v) => v.isLinkedInProfile()),
        true);
  });
  test('isLinkedInCompany', () {
    expect(
        'https://linkedin.com/company/dash-company.io'
            .isValid(validate: (v) => v.isLinkedInCompany()),
        true);
  });
  test('isLinkedInPost', () {
    expect(
        'https://www.linkedin.com/feed/update/urn:li:activity:6665508550111912345/'
            .isValid(validate: (v) => v.isLinkedInPost()),
        true);
  });

  // test('isRedditUrl', () {
  //   expect('-555'.isValid(validate: (v) => v.isRedditUrl()), true);
  // });
  // test('isSnapchatUrl', () {
  //   expect('-555'.isValid(validate: (v) => v.isSnapchatUrl()), true);
  // });
  // test('isStackexchangeUrl', () {
  //   expect('-555'.isValid(validate: (v) => v.isStackexchangeUrl()), true);
  // });
  // test('isStackoverflowQuestionUrl', () {
  //   expect(
  //       '-555'.isValid(validate: (v) => v.isStackoverflowQuestionUrl()), true);
  // });
  // test('isStackoverflowUserUrl', () {
  //   expect('-555'.isValid(validate: (v) => v.isStackoverflowUserUrl()), true);
  // });
  // test('isTelegramProfileUrl', () {
  //   expect('-555'.isValid(validate: (v) => v.isTelegramProfileUrl()), true);
  // });
  // test('isMediumPostUrl', () {
  //   expect('-555'.isValid(validate: (v) => v.isMediumPostUrl()), true);
  // });
  // test('isMediumUserUrl', () {
  //   expect('-555'.isValid(validate: (v) => v.isMediumUserUrl()), true);
  // });
  // test('isTwitterStatusUrl', () {
  //   expect('-555'.isValid(validate: (v) => v.isTwitterStatusUrl()), true);
  // });
  // test('isTwitterUserUrl', () {
  //   expect('-555'.isValid(validate: (v) => v.isTwitterUserUrl()), true);
  // });
  // test('isYoutubeChannelUrl', () {
  //   expect('-555'.isValid(validate: (v) => v.isYoutubeChannelUrl()), true);
  // });
  // test('isYoutubeVideoUrl', () {
  //   expect('-555'.isValid(validate: (v) => v.isYoutubeVideoUrl()), true);
  // });
  // test('isYoutubeUserUrl', () {
  //   expect('-555'.isValid(validate: (v) => v.isYoutubeUserUrl()), true);
  // });
}
