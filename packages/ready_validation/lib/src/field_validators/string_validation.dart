part of '../context_extension.dart';

extension StringValidationExtension<T> on FieldValidator<T, String> {
  /// check if the value is email address
  FieldValidator<T, String> isEmail([MessageCallBack<String>? message]) {
    return next(
      (messages, value) => !Utils.isEmail(value)
          ? message?.call(messages, value) ?? messages.isEmail(value)
          : null,
    );
  }

  /// check if the value is email address
  FieldValidator<T, String> isCreditCard([MessageCallBack<String>? message]) {
    return next(
      (messages, value) => !Utils.isCreditCard(value)
          ? message?.call(messages, value) ?? messages.isCreditCard(value)
          : null,
    );
  }

  /// check if the value starts with [pattern]
  FieldValidator<T, String> startsWithFn(ValueGetter<Pattern> pattern,
      [MessageCallBack<String>? message]) {
    return next((messages, value) {
      var ptr = pattern();
      return !value.startsWith(ptr)
          ? message?.call(messages, value) ??
              messages.startsWith(value, ptr.toString())
          : null;
    });
  }

  /// check if the value starts with [pattern]
  FieldValidator<T, String> startsWith(Pattern pattern,
          [MessageCallBack<String>? message]) =>
      startsWithFn(() => pattern, message);

  /// check if the value contains [pattern]
  FieldValidator<T, String> containsFn(ValueGetter<Pattern> pattern,
      [MessageCallBack<String>? message]) {
    return next((messages, value) {
      var ptr = pattern();
      return !value.contains(ptr)
          ? message?.call(messages, value) ??
              messages.contains(value, ptr.toString())
          : null;
    });
  }

  /// check if the value contains [pattern]
  FieldValidator<T, String> contains(Pattern pattern,
          [MessageCallBack<String>? message]) =>
      containsFn(() => pattern, message);

  /// check if the value ends with [other]
  FieldValidator<T, String> endsWithFn(ValueGetter<String> other,
      [MessageCallBack<String>? message]) {
    return next((messages, value) {
      var oth = other();
      return !value.endsWith(oth)
          ? message?.call(messages, value) ?? messages.startsWith(value, oth)
          : null;
    });
  }

  /// check if the value ends with [other]
  FieldValidator<T, String> endsWith(String other,
          [MessageCallBack<String>? message]) =>
      endsWithFn(() => other, message);

  /// check if the value is not empty
  FieldValidator<T, String> notEmpty([MessageCallBack<String>? message]) {
    return next(
      (messages, value) => value.isEmpty
          ? message?.call(messages, value) ?? messages.notEmpty
          : null,
    );
  }

  /// check if the value is not empty and not contains only white spaces
  FieldValidator<T, String> notEmptyOrWhiteSpace(
      [MessageCallBack<String>? message]) {
    return next(
      (messages, value) => value.isNullOrEmptyOrWhiteSpace
          ? message?.call(messages, value) ?? messages.notEmpty
          : null,
    );
  }

  /// check is the value matches [regExp]
  FieldValidator<T, String> matchesFn(ValueGetter<RegExp> regExp,
      [MessageCallBack<String>? message]) {
    return next((messages, value) {
      var rgEx = regExp();
      if (!rgEx.hasMatch(value)) {
        return message?.call(messages, value) ?? messages.regexp;
      }
      return null;
    });
  }

  /// check is the value matches [regExp]
  FieldValidator<T, String> matches(RegExp regExp,
          [MessageCallBack<String>? message]) =>
      matchesFn(() => regExp, message);

  /// check is the value has  length of [length]
  FieldValidator<T, String> hasLengthFn(ValueGetter<int> length,
      [MessageCallBack<String>? message]) {
    return next((messages, value) {
      var len = length();
      if (value.length != len) {
        return message?.call(messages, value) ?? messages.hasLength(value, len);
      }
      return null;
    });
  }

  /// check is the value has  length of [length]
  FieldValidator<T, String> hasLength(int length,
          [MessageCallBack<String>? message]) =>
      hasLengthFn(() => length, message);

  /// check is the value has min length of [min]
  FieldValidator<T, String> hasMinLengthFn(ValueGetter<int> min,
      [MessageCallBack<String>? message]) {
    return next((messages, value) {
      var minimum = min();
      if (value.length < minimum) {
        return message?.call(messages, value) ??
            messages.hasMinLength(value, minimum);
      }
      return null;
    });
  }

  /// check is the value has min length of [min]
  FieldValidator<T, String> hasMinLength(int min,
          [MessageCallBack<String>? message]) =>
      hasMinLengthFn(() => min, message);

  /// check is the value has max length of [max]
  FieldValidator<T, String> hasMaxLengthFn(ValueGetter<int> max,
      [MessageCallBack<String>? message]) {
    return next((messages, value) {
      var maximum = max();
      if (value.length > maximum) {
        return message?.call(messages, value) ??
            messages.hasMaxLength(value, maximum);
      }
      return null;
    });
  }

  /// check is the value has max length of [max]
  FieldValidator<T, String> hasMaxLength(int max,
          [MessageCallBack<String>? message]) =>
      hasMaxLengthFn(() => max, message);

  /// check is the value length is between [min] and [max]
  FieldValidator<T, String> hasRangeFn(
      ValueGetter<int> min, ValueGetter<int> max,
      [MessageCallBack<String>? message]) {
    return next((messages, value) {
      var minimum = min();
      var maximum = max();
      if (value.length < minimum || value.length > maximum) {
        return message?.call(messages, value) ??
            messages.hasRange(value, minimum, maximum);
      }
      return null;
    });
  }

  /// check is the value length is between [min] and [max]
  FieldValidator<T, String> hasRange(int min, int max,
          [MessageCallBack<String>? message]) =>
      hasRangeFn(() => min, () => max, message);

  /// check is the value is number
  FieldValidator<T, num> isNumber([MessageCallBack<String>? message]) {
    return next((messages, value) {
      if (num.tryParse(value) == null) {
        return message?.call(messages, value) ?? messages.isNumber(value);
      }
      return null;
    }).transform((value) => num.parse(value));
  }

  /// check is the value is [int]
  FieldValidator<T, int> isInteger([MessageCallBack<String>? message]) {
    return next((messages, value) {
      if (int.tryParse(value) == null) {
        return message?.call(messages, value) ?? messages.isInteger(value);
      }
      return null;
    }).transform((value) => int.parse(value));
  }

  /// check is the value is [double]
  FieldValidator<T, int> isDecimal([MessageCallBack<String>? message]) {
    return next((messages, value) {
      if (double.tryParse(value) == null) {
        return message?.call(messages, value) ?? messages.isDecimal(value);
      }
      return null;
    }).transform((value) => int.parse(value));
  }

  /// check is the value is [DateTime]
  FieldValidator<T, DateTime> isDateTime([MessageCallBack<String>? message]) {
    return next((messages, value) {
      if (DateTime.tryParse(value) == null) {
        return message?.call(messages, value) ?? messages.isDateTime(value);
      }
      return null;
    }).transform((value) => DateTime.parse(value));
  }

  /// check is the value is [TimeOfDay]
  FieldValidator<T, TimeOfDay> isTimeOfDay([MessageCallBack<String>? message]) {
    return next((messages, value) {
      if (!value.isTimeOfDay) {
        return message?.call(messages, value) ?? messages.isTimeOfDay(value);
      }
      return null;
    }).transform((value) => value.toTimeOfDay()!);
  }

  ///TODO: create fn validations fo social media
  ///
  ///
  /// check string is angel company valid url
  FieldValidator<T, String> isAngelCompany({
    MessageCallBack<String>? message,
    String? company,
  }) {
    return next((messages, value) {
      if (!value.isAngelCompany(company)) {
        return message?.call(messages, value) ??
            messages.invalidAngelCompanyUrl(value, company ?? '_');
      }
      return null;
    });
  }

  /// check string is angel job valid url
  FieldValidator<T, String> isAngelJob({
    MessageCallBack<String>? message,
    String? jobId,
  }) {
    return next((messages, value) {
      if (!value.isAngelJob(jobId)) {
        return message?.call(messages, value) ??
            messages.invalidAngelJobUrl(value, jobId ?? '_');
      }
      return null;
    });
  }

  /// check string is crunchbase organization url
  FieldValidator<T, String> isCrunchbaseOrganization({
    MessageCallBack<String>? message,
    String? organization,
  }) {
    return next((messages, value) {
      if (!value.isCrunchbaseOrganization(organization)) {
        return message?.call(messages, value) ??
            messages.invalidCrunchbaseOrganizationUrl(
                value, organization ?? '_');
      }
      return null;
    });
  }

  /// check string is crunchbase person url
  FieldValidator<T, String> isCrunchbasePerson({
    MessageCallBack<String>? message,
    String? person,
  }) {
    return next((messages, value) {
      if (!value.isCrunchbasePerson(person)) {
        return message?.call(messages, value) ??
            messages.invalidCrunchbasePersonUrl(value, person ?? '_');
      }
      return null;
    });
  }

  /// Check string is facebook url
  FieldValidator<T, String> isFacebookUrl({
    MessageCallBack<String>? message,
    String? name,
    String? id,
  }) {
    return next((messages, value) {
      if (!value.isFacebookUrl(
        name: name,
        id: id,
      )) {
        return message?.call(messages, value) ??
            messages.invalidFacebookUrl(
              value,
              name ?? '_',
              id ?? '_',
            );
      }
      return null;
    });
  }

  /// Check string is github url
  FieldValidator<T, String> isGitHubUrl({
    MessageCallBack<String>? message,
    String? user,
    String? repository,
  }) {
    return next((messages, value) {
      if (!value.isGitHubUrl(
        user: user,
        repository: repository,
      )) {
        return message?.call(messages, value) ??
            messages.invalidGitHubUrl(
              value,
              user ?? '_',
              repository ?? '_',
            );
      }
      return null;
    });
  }

  /// Check string is google plus url
  FieldValidator<T, String> isGooglePlusUrl({
    MessageCallBack<String>? message,
    String? userName,
    String? id,
  }) {
    return next((messages, value) {
      if (!value.isGooglePlusUrl(
        userName: userName,
        id: id,
      )) {
        return message?.call(messages, value) ??
            messages.invalidGooglePlusUrl(
              value,
              userName ?? '_',
              id ?? '_',
            );
      }
      return null;
    });
  }

  /// Check string is hacker news user url
  FieldValidator<T, String> isHackerNewsUserUrl({
    MessageCallBack<String>? message,
    String? id,
  }) {
    return next((messages, value) {
      if (!value.isHackerNewsUserUrl(id: id)) {
        return message?.call(messages, value) ??
            messages.invalidHackerNewsUserUrl(value, id ?? '_');
      }
      return null;
    });
  }

  /// Check string is hacker news url
  FieldValidator<T, String> isHackerNewsItemUrl({
    MessageCallBack<String>? message,
    String? id,
  }) {
    return next((messages, value) {
      if (!value.isHackerNewsItemUrl(id: id)) {
        return message?.call(messages, value) ??
            messages.invalidHackerNewsItemUrl(value, id ?? '_');
      }
      return null;
    });
  }

  /// Check string is instagram url
  FieldValidator<T, String> isInstagramUrl({
    MessageCallBack<String>? message,
    String? user,
  }) {
    return next((messages, value) {
      if (!value.isInstagramUrl(user: user)) {
        return message?.call(messages, value) ??
            messages.invalidInstagramUrl(value, user ?? '_');
      }
      return null;
    });
  }

  /// Check string is linkedin profile url
  FieldValidator<T, String> isLinkedInProfile({
    MessageCallBack<String>? message,
    String? permalink,
  }) {
    return next((messages, value) {
      if (!value.isLinkedInProfile(permalink: permalink)) {
        return message?.call(messages, value) ??
            messages.invalidLinkedInProfileUrl(value, permalink ?? '_');
      }
      return null;
    });
  }

  /// Check string is linkedin company url
  FieldValidator<T, String> isLinkedInCompany({
    MessageCallBack<String>? message,
    String? permalink,
  }) {
    return next((messages, value) {
      if (!value.isLinkedInCompany(permalink: permalink)) {
        return message?.call(messages, value) ??
            messages.invalidAngelCompanyUrl(value, permalink ?? '_');
      }
      return null;
    });
  }

  /// Check string is linkedin post url
  FieldValidator<T, String> isLinkedInPost({
    MessageCallBack<String>? message,
    String? id,
  }) {
    return next((messages, value) {
      if (!value.isLinkedInPost(id: id)) {
        return message?.call(messages, value) ??
            messages.invalidLinkedInPostUrl(value, id ?? '_');
      }
      return null;
    });
  }

  /// Check string is reddit url
  FieldValidator<T, String> isRedditUrl({
    MessageCallBack<String>? message,
    String? user,
  }) {
    return next((messages, value) {
      if (!value.isRedditUrl(user: user)) {
        return message?.call(messages, value) ??
            messages.invalidRedditUrl(value, user ?? '_');
      }
      return null;
    });
  }

  /// Check string is snapchat url
  FieldValidator<T, String> isSnapchatUrl({
    MessageCallBack<String>? message,
    String? user,
  }) {
    return next((messages, value) {
      if (!value.isSnapchatUrl(user: user)) {
        return message?.call(messages, value) ??
            messages.invalidSnapchatUrl(value, user ?? '_');
      }
      return null;
    });
  }

  /// Check string is stack exchange url
  FieldValidator<T, String> isStackexchangeUrl({
    MessageCallBack<String>? message,
    String? user,
    String? id,
    String? community,
  }) {
    return next((messages, value) {
      if (!value.isStackexchangeUrl(user: user, id: id, community: community)) {
        return message?.call(messages, value) ??
            messages.invalidStackexchangeUrl(value, user ?? '_', id ?? '_');
      }
      return null;
    });
  }

  /// Check string is stackoverflow question url
  FieldValidator<T, String> isStackoverflowQuestionUrl({
    MessageCallBack<String>? message,
    String? id,
  }) {
    return next((messages, value) {
      if (!value.isStackoverflowQuestionUrl(id: id)) {
        return message?.call(messages, value) ??
            messages.invalidStackoverflowQuestionUrl(value, id ?? '_');
      }
      return null;
    });
  }

  /// Check string is stackoverflow user url
  FieldValidator<T, String> isStackoverflowUserUrl({
    MessageCallBack<String>? message,
    String? id,
  }) {
    return next((messages, value) {
      if (!value.isStackoverflowUserUrl(id: id)) {
        return message?.call(messages, value) ??
            messages.invalidStackoverflowUserUrl(value, id ?? '_');
      }
      return null;
    });
  }

  /// Check string is telegram profile  url
  FieldValidator<T, String> isTelegramProfileUrl({
    MessageCallBack<String>? message,
    String? userName,
  }) {
    return next((messages, value) {
      if (!value.isTelegramProfileUrl(userName: userName)) {
        return message?.call(messages, value) ??
            messages.invalidTelegramProfileUrl(value, userName ?? '_');
      }
      return null;
    });
  }

  /// Check string is  medium post url
  FieldValidator<T, String> isMediumPostUrl({
    MessageCallBack<String>? message,
    String? postId,
  }) {
    return next((messages, value) {
      if (!value.isMediumPostUrl(postId: postId)) {
        return message?.call(messages, value) ??
            messages.invalidMediumPostUrl(value, postId ?? '_');
      }
      return null;
    });
  }

  /// Check string is  medium user url
  FieldValidator<T, String> isMediumUserUrl({
    MessageCallBack<String>? message,
    String? userName,
    String? id,
  }) {
    return next((messages, value) {
      if (!value.isMediumUserUrl(
        userName: userName,
        id: id,
      )) {
        return message?.call(messages, value) ??
            messages.invalidMediumUserUrl(
              value,
              userName ?? '_',
              id ?? '_',
            );
      }
      return null;
    });
  }

  /// Check string is twitter status  url
  FieldValidator<T, String> isTwitterStatusUrl({
    MessageCallBack<String>? message,
    String? userName,
    String? tweetId,
  }) {
    return next((messages, value) {
      if (!value.isTwitterStatusUrl(
        userName: userName,
        tweetId: userName,
      )) {
        return message?.call(messages, value) ??
            messages.invalidTwitterStatusUrl(
              value,
              userName ?? '_',
              tweetId ?? '_',
            );
      }
      return null;
    });
  }

  /// Check string is twitter user  url
  FieldValidator<T, String> isTwitterUserUrl({
    MessageCallBack<String>? message,
    String? userName,
  }) {
    return next((messages, value) {
      if (!value.isTwitterUserUrl(userName: userName)) {
        return message?.call(messages, value) ??
            messages.invalidTwitterUserUrl(value, userName ?? '_');
      }
      return null;
    });
  }

  /// Check string is youtube channel  url
  FieldValidator<T, String> isYoutubeChannelUrl({
    MessageCallBack<String>? message,
    String? id,
  }) {
    return next((messages, value) {
      if (!value.isYoutubeChannelUrl(id: id)) {
        return message?.call(messages, value) ??
            messages.invalidYoutubeChannelUrl(value, id ?? '_');
      }
      return null;
    });
  }

  /// Check string is youtube video  url
  FieldValidator<T, String> isYoutubeVideoUrl({
    MessageCallBack<String>? message,
    String? id,
  }) {
    return next((messages, value) {
      if (!value.isYoutubeVideoUrl(id: id)) {
        return message?.call(messages, value) ??
            messages.invalidYoutubeVideoUrl(value, id ?? '_');
      }
      return null;
    });
  }

  /// Check string is youtube user  url
  FieldValidator<T, String> isYoutubeUserUrl({
    MessageCallBack<String>? message,
    String? username,
  }) {
    return next((messages, value) {
      if (!value.isYoutubeUserUrl(username: username)) {
        return message?.call(messages, value) ??
            messages.invalidYoutubeUserUrl(value, username ?? '_');
      }
      return null;
    });
  }
}
