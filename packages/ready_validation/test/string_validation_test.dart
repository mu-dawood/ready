import 'package:flutter_test/flutter_test.dart';
import 'package:ready_validation/ready_validation.dart';

void main() {
  test('when', () {
    String? nullTest;
    expect(
        nullTest
            .validateWith((v) => v.required().isEmail().when((value) => true))
            .isValid(),
        false);
    String? test1 = "";
    expect(
        test1
            .validateWith((v) => v.required().isEmail().when((value) => true))
            .isValid(),
        false);

    expect(
        test1.validateWith((v) => v.isEmail().when((value) => false)).isValid(),
        true);
    expect(
        test1
            .validateWith((v) => v.isEmail().allWhen((value) => false))
            .isValid(),
        true);
  });

  test('required', () {
    String? test1;
    expect(test1.validateWith((v) => v.required()).isValid(), false);
  });

  test('matches', () {
    String test2 = "test";
    expect(
        test2.validateWith((v) => v.matches(RegExp(r'^te'))).isValid(), true);
    expect(
        test2.validateWith((v) => v.matches(RegExp(r'^ss'))).isValid(), false);
  });

  test('notEmptyOrWhiteSpace', () {
    String test2 = "test";
    expect(test2.validateWith((v) => v.notEmptyOrWhiteSpace()).isValid(), true);
    expect(''.validateWith((v) => v.notEmptyOrWhiteSpace()).isValid(), false);
    expect(''.validateWith((v) => v.notEmptyOrWhiteSpace()).isValid(), false);
  });

  test('notEmpty', () {
    String test2 = "test";
    expect(test2.validateWith((v) => v.notEmpty()).isValid(), true);
    expect(''.validateWith((v) => v.notEmpty()).isValid(), false);
  });

  test('contains', () {
    String test2 = "test";
    expect(test2.validateWith((v) => v.contains("te")).isValid(), true);
    expect(test2.validateWith((v) => v.contains("sw")).isValid(), false);
  });

  test('startsWith', () {
    String test2 = "test";
    expect(test2.validateWith((v) => v.startsWith("te")).isValid(), true);
    expect(test2.validateWith((v) => v.startsWith("sw")).isValid(), false);
  });

  test('endsWith', () {
    String test2 = "test";
    expect(test2.validateWith((v) => v.endsWith("st")).isValid(), true);
    expect(test2.validateWith((v) => v.endsWith("sw")).isValid(), false);
  });

  test('hasMaxLength', () {
    String test2 = "test";
    expect(test2.validateWith((v) => v.hasMaxLength(10)).isValid(), true);
    expect(test2.validateWith((v) => v.hasMaxLength(2)).isValid(), false);
  });

  test('hasMinLength', () {
    String test2 = "test";
    expect(test2.validateWith((v) => v.hasMinLength(3)).isValid(), true);
    expect(test2.validateWith((v) => v.hasMinLength(10)).isValid(), false);
  });

  test('hasLength', () {
    String test2 = "test";
    expect(test2.validateWith((v) => v.hasLength(4)).isValid(), true);
    expect(test2.validateWith((v) => v.hasLength(5)).isValid(), false);
  });

  test('hasRange', () {
    String test2 = "test";
    expect(test2.validateWith((v) => v.hasRange(3, 7)).isValid(), true);
    expect(test2.validateWith((v) => v.hasRange(5, 7)).isValid(), false);
    expect(test2.validateWith((v) => v.hasRange(1, 3)).isValid(), false);
  });
  test('isNumber', () {
    expect('-555'.validateWith((v) => v.isNumber()).isValid(), true);
    expect('555'.validateWith((v) => v.isNumber()).isValid(), true);
    expect('555.00'.validateWith((v) => v.isNumber()).isValid(), true);
    expect('-555.00'.validateWith((v) => v.isNumber()).isValid(), true);
    expect('test'.validateWith((v) => v.isNumber()).isValid(), false);
  });

  test('isInteger', () {
    expect('-555'.validateWith((v) => v.isInteger()).isValid(), true);
    expect('555'.validateWith((v) => v.isInteger()).isValid(), true);
    expect('555.00'.validateWith((v) => v.isInteger()).isValid(), false);
    expect('-555.00'.validateWith((v) => v.isInteger()).isValid(), false);
    expect('test'.validateWith((v) => v.isInteger()).isValid(), false);
  });

  test('isDecimal', () {
    expect('-555'.validateWith((v) => v.isDecimal()).isValid(), true);
    expect('555'.validateWith((v) => v.isDecimal()).isValid(), true);
    expect('555.00'.validateWith((v) => v.isDecimal()).isValid(), true);
    expect('-555.00'.validateWith((v) => v.isDecimal()).isValid(), true);
    expect('test'.validateWith((v) => v.isDecimal()).isValid(), false);
  });

  test('isEmail', () {
    expect('test'.validateWith((v) => v.isEmail()).isValid(), false);
    expect('test@test'.validateWith((v) => v.isEmail()).isValid(), false);
    expect('test@test.com'.validateWith((v) => v.isEmail()).isValid(), true);
  });

  test('isCreditCard', () {
    expect('test'.validateWith((v) => v.isCreditCard()).isValid(), false);
    expect('76167617'.validateWith((v) => v.isCreditCard()).isValid(), false);
    expect('4988141966577868'.validateWith((v) => v.isCreditCard()).isValid(),
        true);
  });

  test('isAngelCompany', () {
    expect(
        'https://angel.co/company/twitter'
            .validateWith((v) => v.isAngelCompany())
            .isValid(),
        true);
  });

  test('isAngelJob', () {
    expect(
        'https://angel.co/company/twitter/jobs/576275-engineering-manager'
            .validateWith((v) => v.isAngelJob())
            .isValid(),
        true);
    expect(
        'https://angel.co/company/twitter'
            .validateWith((v) => v.isAngelJob())
            .isValid(),
        false);
  });

  test('isCrunchbaseOrganization', () {
    expect(
        'http://crunchbase.com/organization/twitter'
            .validateWith((v) => v.isCrunchbaseOrganization())
            .isValid(),
        true);
  });
  test('isCrunchbasePerson', () {
    expect(
        'http://crunchbase.com/person/dawood'
            .validateWith((v) => v.isCrunchbasePerson())
            .isValid(),
        true);
  });
  test('isFacebookUrl', () {
    expect(
        'http://fb.com/peter_parker-miller'
            .validateWith((v) => v.isFacebookUrl())
            .isValid(),
        true);
  });
  test('isGitHubUrl', () {
    expect(
        'https://github.com/lorey/socials'
            .validateWith((v) => v.isGitHubUrl())
            .isValid(),
        true);
  });
  test('isGooglePlusUrl', () {
    expect(
        'https://plus.google.com/+googleplususername'
            .validateWith((v) => v.isGooglePlusUrl())
            .isValid(),
        true);
  });
  test('isHackerNewsUserUrl', () {
    expect(
        'https://news.ycombinator.com/user?id=CamelCaps'
            .validateWith((v) => v.isHackerNewsUserUrl())
            .isValid(),
        true);
  });
  test('isHackerNewsItemUrl', () {
    expect(
        'https://news.ycombinator.com/item?id=23290375'
            .validateWith((v) => v.isHackerNewsItemUrl())
            .isValid(),
        true);
  });

  test('isInstagramUrl', () {
    expect(
        '-https://instagram.com/__disco__dude'
            .validateWith((v) => v.isInstagramUrl())
            .isValid(),
        true);
  });

  test('isLinkedInProfile', () {
    expect(
        'https://de.linkedin.com/in/peter-m%C3%BCller-81a8/'
            .validateWith((v) => v.isLinkedInProfile())
            .isValid(),
        true);
  });
  test('isLinkedInCompany', () {
    expect(
        'https://linkedin.com/company/dash-company.io'
            .validateWith((v) => v.isLinkedInCompany())
            .isValid(),
        true);
  });
  test('isLinkedInPost', () {
    expect(
        'https://www.linkedin.com/feed/update/urn:li:activity:6665508550111912345/'
            .validateWith((v) => v.isLinkedInPost())
            .isValid(),
        true);
  });

  // test('isRedditUrl', () {
  //   expect('-555'.validateWith((v) => v.isRedditUrl()).isValid(), true);
  // });
  // test('isSnapchatUrl', () {
  //   expect('-555'.validateWith((v) => v.isSnapchatUrl()).isValid(), true);
  // });
  // test('isStackexchangeUrl', () {
  //   expect('-555'.validateWith((v) => v.isStackexchangeUrl()).isValid(), true);
  // });
  // test('isStackoverflowQuestionUrl', () {
  //   expect(
  //       '-555'.validateWith((v) => v.isStackoverflowQuestionUrl()).isValid(), true);
  // });
  // test('isStackoverflowUserUrl', () {
  //   expect('-555'.validateWith((v) => v.isStackoverflowUserUrl()).isValid(), true);
  // });
  // test('isTelegramProfileUrl', () {
  //   expect('-555'.validateWith((v) => v.isTelegramProfileUrl()).isValid(), true);
  // });
  // test('isMediumPostUrl', () {
  //   expect('-555'.validateWith((v) => v.isMediumPostUrl()).isValid(), true);
  // });
  // test('isMediumUserUrl', () {
  //   expect('-555'.validateWith((v) => v.isMediumUserUrl()).isValid(), true);
  // });
  // test('isTwitterStatusUrl', () {
  //   expect('-555'.validateWith((v) => v.isTwitterStatusUrl()).isValid(), true);
  // });
  // test('isTwitterUserUrl', () {
  //   expect('-555'.validateWith((v) => v.isTwitterUserUrl()).isValid(), true);
  // });
  // test('isYoutubeChannelUrl', () {
  //   expect('-555'.validateWith((v) => v.isYoutubeChannelUrl()).isValid(), true);
  // });
  // test('isYoutubeVideoUrl', () {
  //   expect('-555'.validateWith((v) => v.isYoutubeVideoUrl()).isValid(), true);
  // });
  // test('isYoutubeUserUrl', () {
  //   expect('-555'.validateWith((v) => v.isYoutubeUserUrl()).isValid(), true);
  // });
}
