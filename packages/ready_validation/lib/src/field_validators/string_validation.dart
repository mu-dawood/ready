part of '../context_extension.dart';

extension NullStringValidationExtension on FieldValidator<String?, String?> {
  /// check if the value is email address
  FieldValidator<String?, String?> email([MessageCallBack<String>? message]) {
    return next(
      (messages, value) => value != null && !Utils.isEmail(value)
          ? message?.call(messages, value) ?? messages.isEmail
          : null,
    );
  }

  /// check if the value is email address
  FieldValidator<String?, String?> creditCard(
      [MessageCallBack<String>? message]) {
    return next(
      (messages, value) => value != null && !Utils.isCreditCard(value)
          ? message?.call(messages, value) ?? messages.isCreditCard
          : null,
    );
  }

  /// check if the value starts with [pattern]
  FieldValidator<String?, String?> startsWithFn(ValueGetter<Pattern> pattern,
      [MessageCallBack<String>? message]) {
    return next((messages, value) {
      var ptr = pattern();
      return value != null && !value.startsWith(ptr)
          ? message?.call(messages, value) ??
              messages.startsWith(ptr.toString())
          : null;
    });
  }

  /// check if the value starts with [pattern]
  FieldValidator<String?, String?> startsWith(Pattern pattern,
      [MessageCallBack<String>? message]) {
    return startsWithFn(() => pattern, message);
  }

  /// check if the value contains [pattern]
  FieldValidator<String?, String?> containsFn(ValueGetter<Pattern> pattern,
      [MessageCallBack<String>? message]) {
    return next((messages, value) {
      var ptr = pattern();
      return value != null && !value.contains(ptr)
          ? message?.call(messages, value) ?? messages.contains(ptr.toString())
          : null;
    });
  }

  /// check if the value contains [pattern]
  FieldValidator<String?, String?> contains(Pattern pattern,
      [MessageCallBack<String>? message]) {
    return containsFn(() => pattern, message);
  }

  /// check if the value ends with [other]
  FieldValidator<String?, String?> endsWithFn(ValueGetter<String> other,
      [MessageCallBack<String>? message]) {
    return next((messages, value) {
      var oth = other();
      return value != null && !value.endsWith(oth)
          ? message?.call(messages, value) ?? messages.startsWith(oth)
          : null;
    });
  }

  /// check if the value ends with [other]
  FieldValidator<String?, String?> endsWith(String other,
      [MessageCallBack<String>? message]) {
    return endsWithFn(() => other, message);
  }

  /// check if the value is not empty
  FieldValidator<String?, String> notEmpty({
    MessageCallBack<String>? message,
    bool allowWhiteSpace = true,
  }) {
    return this.required().next(
          (messages, value) => (allowWhiteSpace ? value : value.trim()).isEmpty
              ? message?.call(messages, value) ?? messages.notEmpty
              : null,
        );
  }

  /// check is the value matches [regExp]
  FieldValidator<String?, String?> matchesFn(ValueGetter<RegExp> regExp,
      [MessageCallBack<String>? message]) {
    return next((messages, value) {
      var rgEx = regExp();
      if (value != null && !rgEx.hasMatch(value)) {
        return message?.call(messages, value) ?? messages.regexp;
      }
      return null;
    });
  }

  /// check is the value matches [regExp]
  FieldValidator<String?, String?> matches(RegExp regExp,
          [MessageCallBack<String>? message]) =>
      matchesFn(() => regExp, message);

  /// check is the value has  length of [length]
  FieldValidator<String?, String?> hasLengthFn(ValueGetter<int> length,
      [MessageCallBack<String>? message]) {
    return next((messages, value) {
      var len = length();
      if (value != null && value.length != len) {
        return message?.call(messages, value) ?? messages.hasLength(len);
      }
      return null;
    });
  }

  /// check is the value has  length of [length]
  FieldValidator<String?, String?> hasLength(int length,
          [MessageCallBack<String>? message]) =>
      hasLengthFn(() => length, message);

  /// check is the value has min length of [min]
  FieldValidator<String?, String?> hasMinLengthFn(ValueGetter<int> min,
      [MessageCallBack<String>? message]) {
    return next((messages, value) {
      var minimum = min();
      if (value != null && value.length < minimum) {
        return message?.call(messages, value) ?? messages.hasMinLength(minimum);
      }
      return null;
    });
  }

  /// check is the value has min length of [min]
  FieldValidator<String?, String?> hasMinLength(int min,
          [MessageCallBack<String>? message]) =>
      hasMinLengthFn(() => min, message);

  /// check is the value has max length of [max]
  FieldValidator<String?, String?> hasMaxLengthFn(ValueGetter<int> max,
      [MessageCallBack<String>? message]) {
    return next((messages, value) {
      var maximum = max();
      if (value != null && value.length > maximum) {
        return message?.call(messages, value) ?? messages.hasMaxLength(maximum);
      }
      return null;
    });
  }

  /// check is the value has max length of [max]
  FieldValidator<String?, String?> hasMaxLength(int max,
          [MessageCallBack<String>? message]) =>
      hasMaxLengthFn(() => max, message);

  /// check is the value length is between [min] and [max]
  FieldValidator<String?, String?> hasRangeFn(
      ValueGetter<int> min, ValueGetter<int> max,
      [MessageCallBack<String>? message]) {
    return next((messages, value) {
      var minimum = min();
      var maximum = max();
      if (value != null && (value.length < minimum || value.length > maximum)) {
        return message?.call(messages, value) ??
            messages.hasRange(minimum, maximum);
      }
      return null;
    });
  }

  /// check is the value length is between [min] and [max]
  FieldValidator<String?, String?> hasRange(int min, int max,
          [MessageCallBack<String>? message]) =>
      hasRangeFn(() => min, () => max, message);

  /// check is the value is number
  FieldValidator<String?, num?> isNumber([MessageCallBack<String>? message]) {
    return next((messages, value) {
      if (value != null && num.tryParse(value) == null) {
        return message?.call(messages, value) ?? messages.isNumber;
      }
      return null;
    }).transform((value) => num.tryParse(value ?? ""));
  }

  /// check is the value is [int]
  FieldValidator<String?, int?> isInteger([MessageCallBack<String>? message]) {
    return next((messages, value) {
      if (value != null && int.tryParse(value) == null) {
        return message?.call(messages, value) ?? messages.isInteger;
      }
      return null;
    }).transform((value) => int.tryParse(value ?? ""));
  }

  /// check is the value is [double]
  FieldValidator<String?, double?> isDecimal(
      [MessageCallBack<String>? message]) {
    return next((messages, value) {
      if (value != null && double.tryParse(value) == null) {
        return message?.call(messages, value) ?? messages.isDecimal;
      }
      return null;
    }).transform((value) => double.tryParse(value ?? ""));
  }

  /// check is the value is [DateTime]
  FieldValidator<String?, DateTime?> isDateTime(
      [MessageCallBack<String>? message]) {
    return next((messages, value) {
      if (value != null && DateTime.tryParse(value) == null) {
        return message?.call(messages, value) ?? messages.isDateTime;
      }
      return null;
    }).transform((value) => DateTime.tryParse(value ?? ""));
  }

  /// check is the value is [Boolean]
  FieldValidator<String?, bool?> isBoolean([MessageCallBack<String>? message]) {
    return next((messages, value) {
      if (value != null &&
          value.toLowerCase() != 'true' &&
          value.toLowerCase() != 'false') {
        return message?.call(messages, value) ?? messages.isBoolean;
      }
      return null;
    }).transform(
        (value) => value == null ? null : value.toLowerCase() == 'true');
  }

  /// check is the value is [TimeOfDay]
  FieldValidator<String?, TimeOfDay?> isTimeOfDay(
      [MessageCallBack<String>? message]) {
    return next((messages, value) {
      if (value != null && !value.isTimeOfDay) {
        return message?.call(messages, value) ?? messages.isTimeOfDay;
      }
      return null;
    }).transform((value) => value.toTimeOfDay()!);
  }

  /// check string is valid url
  FieldValidator<String?, String?> isValidUrl({
    MessageCallBack<String>? message,
    String? company,
  }) {
    return next((messages, value) {
      if (value != null && !value.isAngelCompany(company)) {
        return message?.call(messages, value) ??
            messages.invalidAngelCompanyUrl(company ?? 'empty');
      }
      return null;
    });
  }

  /// check string is angel company valid url
  FieldValidator<String?, String?> isAngelCompany({
    MessageCallBack<String>? message,
    String? company,
  }) {
    return next((messages, value) {
      if (value != null && !value.isAngelCompany(company)) {
        return message?.call(messages, value) ??
            messages.invalidAngelCompanyUrl(company ?? 'empty');
      }
      return null;
    });
  }

  /// check string is angel job valid url
  FieldValidator<String?, String?> isAngelJob({
    MessageCallBack<String>? message,
    String? jobId,
  }) {
    return next((messages, value) {
      if (value != null && !value.isAngelJob(jobId)) {
        return message?.call(messages, value) ??
            messages.invalidAngelJobUrl(jobId ?? 'empty');
      }
      return null;
    });
  }

  /// check string is crunchbase organization url
  FieldValidator<String?, String?> isCrunchbaseOrganization({
    MessageCallBack<String>? message,
    String? organization,
  }) {
    return next((messages, value) {
      if (value != null && !value.isCrunchbaseOrganization(organization)) {
        return message?.call(messages, value) ??
            messages.invalidCrunchbaseOrganizationUrl(organization ?? 'empty');
      }
      return null;
    });
  }

  /// check string is crunchbase person url
  FieldValidator<String?, String?> isCrunchbasePerson({
    MessageCallBack<String>? message,
    String? person,
  }) {
    return next((messages, value) {
      if (value != null && !value.isCrunchbasePerson(person)) {
        return message?.call(messages, value) ??
            messages.invalidCrunchbasePersonUrl(person ?? 'empty');
      }
      return null;
    });
  }

  /// Check string is facebook url
  FieldValidator<String?, String?> isFacebookUrl({
    MessageCallBack<String>? message,
    String? name,
    String? id,
  }) {
    return next((messages, value) {
      if (value != null &&
          !value.isFacebookUrl(
            name: name,
            id: id,
          )) {
        return message?.call(messages, value) ??
            messages.invalidFacebookUrl(
              name ?? 'empty',
              id ?? 'empty',
            );
      }
      return null;
    });
  }

  /// Check string is github url
  FieldValidator<String?, String?> isGitHubUrl({
    MessageCallBack<String>? message,
    String? user,
    String? repository,
  }) {
    return next((messages, value) {
      if (value != null &&
          !value.isGitHubUrl(
            user: user,
            repository: repository,
          )) {
        return message?.call(messages, value) ??
            messages.invalidGitHubUrl(
              user ?? 'empty',
              repository ?? 'empty',
            );
      }
      return null;
    });
  }

  /// Check string is google plus url
  FieldValidator<String?, String?> isGooglePlusUrl({
    MessageCallBack<String>? message,
    String? userName,
    String? id,
  }) {
    return next((messages, value) {
      if (value != null &&
          !value.isGooglePlusUrl(
            userName: userName,
            id: id,
          )) {
        return message?.call(messages, value) ??
            messages.invalidGooglePlusUrl(
              userName ?? 'empty',
              id ?? 'empty',
            );
      }
      return null;
    });
  }

  /// Check string is hacker news user url
  FieldValidator<String?, String?> isHackerNewsUserUrl({
    MessageCallBack<String>? message,
    String? id,
  }) {
    return next((messages, value) {
      if (value != null && !value.isHackerNewsUserUrl(id: id)) {
        return message?.call(messages, value) ??
            messages.invalidHackerNewsUserUrl(id ?? 'empty');
      }
      return null;
    });
  }

  /// Check string is hacker news url
  FieldValidator<String?, String?> isHackerNewsItemUrl({
    MessageCallBack<String>? message,
    String? id,
  }) {
    return next((messages, value) {
      if (value != null && !value.isHackerNewsItemUrl(id: id)) {
        return message?.call(messages, value) ??
            messages.invalidHackerNewsItemUrl(id ?? 'empty');
      }
      return null;
    });
  }

  /// Check string is instagram url
  FieldValidator<String?, String?> isInstagramUrl({
    MessageCallBack<String>? message,
    String? user,
  }) {
    return next((messages, value) {
      if (value != null && !value.isInstagramUrl(user: user)) {
        return message?.call(messages, value) ??
            messages.invalidInstagramUrl(user ?? 'empty');
      }
      return null;
    });
  }

  /// Check string is linkedin profile url
  FieldValidator<String?, String?> isLinkedInProfile({
    MessageCallBack<String>? message,
    String? permalink,
  }) {
    return next((messages, value) {
      if (value != null && !value.isLinkedInProfile(permalink: permalink)) {
        return message?.call(messages, value) ??
            messages.invalidLinkedInProfileUrl(permalink ?? 'empty');
      }
      return null;
    });
  }

  /// Check string is linkedin company url
  FieldValidator<String?, String?> isLinkedInCompany({
    MessageCallBack<String>? message,
    String? permalink,
  }) {
    return next((messages, value) {
      if (value != null && !value.isLinkedInCompany(permalink: permalink)) {
        return message?.call(messages, value) ??
            messages.invalidAngelCompanyUrl(permalink ?? 'empty');
      }
      return null;
    });
  }

  /// Check string is linkedin post url
  FieldValidator<String?, String?> isLinkedInPost({
    MessageCallBack<String>? message,
    String? id,
  }) {
    return next((messages, value) {
      if (value != null && !value.isLinkedInPost(id: id)) {
        return message?.call(messages, value) ??
            messages.invalidLinkedInPostUrl(id ?? 'empty');
      }
      return null;
    });
  }

  /// Check string is reddit url
  FieldValidator<String?, String?> isRedditUrl({
    MessageCallBack<String>? message,
    String? user,
  }) {
    return next((messages, value) {
      if (value != null && !value.isRedditUrl(user: user)) {
        return message?.call(messages, value) ??
            messages.invalidRedditUrl(user ?? 'empty');
      }
      return null;
    });
  }

  /// Check string is snapchat url
  FieldValidator<String?, String?> isSnapchatUrl({
    MessageCallBack<String>? message,
    String? user,
  }) {
    return next((messages, value) {
      if (value != null && !value.isSnapchatUrl(user: user)) {
        return message?.call(messages, value) ??
            messages.invalidSnapchatUrl(user ?? 'empty');
      }
      return null;
    });
  }

  /// Check string is stack exchange url
  FieldValidator<String?, String?> isStackexchangeUrl({
    MessageCallBack<String>? message,
    String? user,
    String? id,
    String? community,
  }) {
    return next((messages, value) {
      if (value != null &&
          !value.isStackexchangeUrl(user: user, id: id, community: community)) {
        return message?.call(messages, value) ??
            messages.invalidStackexchangeUrl(user ?? 'empty', id ?? 'empty');
      }
      return null;
    });
  }

  /// Check string is stackoverflow question url
  FieldValidator<String?, String?> isStackoverflowQuestionUrl({
    MessageCallBack<String>? message,
    String? id,
  }) {
    return next((messages, value) {
      if (value != null && !value.isStackoverflowQuestionUrl(id: id)) {
        return message?.call(messages, value) ??
            messages.invalidStackoverflowQuestionUrl(id ?? 'empty');
      }
      return null;
    });
  }

  /// Check string is stackoverflow user url
  FieldValidator<String?, String?> isStackoverflowUserUrl({
    MessageCallBack<String>? message,
    String? id,
  }) {
    return next((messages, value) {
      if (value != null && !value.isStackoverflowUserUrl(id: id)) {
        return message?.call(messages, value) ??
            messages.invalidStackoverflowUserUrl(id ?? 'empty');
      }
      return null;
    });
  }

  /// Check string is telegram profile  url
  FieldValidator<String?, String?> isTelegramProfileUrl({
    MessageCallBack<String>? message,
    String? userName,
  }) {
    return next((messages, value) {
      if (value != null && !value.isTelegramProfileUrl(userName: userName)) {
        return message?.call(messages, value) ??
            messages.invalidTelegramProfileUrl(userName ?? 'empty');
      }
      return null;
    });
  }

  /// Check string is  medium post url
  FieldValidator<String?, String?> isMediumPostUrl({
    MessageCallBack<String>? message,
    String? postId,
  }) {
    return next((messages, value) {
      if (value != null && !value.isMediumPostUrl(postId: postId)) {
        return message?.call(messages, value) ??
            messages.invalidMediumPostUrl(postId ?? 'empty');
      }
      return null;
    });
  }

  /// Check string is  medium user url
  FieldValidator<String?, String?> isMediumUserUrl({
    MessageCallBack<String>? message,
    String? userName,
    String? id,
  }) {
    return next((messages, value) {
      if (value != null &&
          !value.isMediumUserUrl(
            userName: userName,
            id: id,
          )) {
        return message?.call(messages, value) ??
            messages.invalidMediumUserUrl(
              userName ?? 'empty',
              id ?? 'empty',
            );
      }
      return null;
    });
  }

  /// Check string is twitter status  url
  FieldValidator<String?, String?> isTwitterStatusUrl({
    MessageCallBack<String>? message,
    String? userName,
    String? tweetId,
  }) {
    return next((messages, value) {
      if (value != null &&
          !value.isTwitterStatusUrl(
            userName: userName,
            tweetId: userName,
          )) {
        return message?.call(messages, value) ??
            messages.invalidTwitterStatusUrl(
                userName ?? 'empty', tweetId ?? 'empty');
      }
      return null;
    });
  }

  /// Check string is twitter user  url
  FieldValidator<String?, String?> isTwitterUserUrl({
    MessageCallBack<String>? message,
    String? userName,
  }) {
    return next((messages, value) {
      if (value != null && !value.isTwitterUserUrl(userName: userName)) {
        return message?.call(messages, value) ??
            messages.invalidTwitterUserUrl(userName ?? 'empty');
      }
      return null;
    });
  }

  /// Check string is youtube channel  url
  FieldValidator<String?, String?> isYoutubeChannelUrl({
    MessageCallBack<String>? message,
    String? id,
  }) {
    return next((messages, value) {
      if (value != null && !value.isYoutubeChannelUrl(id: id)) {
        return message?.call(messages, value) ??
            messages.invalidYoutubeChannelUrl(id ?? 'empty');
      }
      return null;
    });
  }

  /// Check string is youtube video  url
  FieldValidator<String?, String?> isYoutubeVideoUrl({
    MessageCallBack<String>? message,
    String? id,
  }) {
    return next((messages, value) {
      if (value != null && !value.isYoutubeVideoUrl(id: id)) {
        return message?.call(messages, value) ??
            messages.invalidYoutubeVideoUrl(id ?? 'empty');
      }
      return null;
    });
  }

  /// Check string is youtube user  url
  FieldValidator<String?, String?> isYoutubeUserUrl({
    MessageCallBack<String>? message,
    String? username,
  }) {
    return next((messages, value) {
      if (value != null && !value.isYoutubeUserUrl(username: username)) {
        return message?.call(messages, value) ??
            messages.invalidYoutubeUserUrl(username ?? 'empty');
      }
      return null;
    });
  }
}

extension StringValidationExtension<T> on FieldValidator<String?, String> {
  /// check if the value is email address
  FieldValidator<String?, String> email([MessageCallBack<String>? message]) {
    return next(
      (messages, value) => !Utils.isEmail(value)
          ? message?.call(messages, value) ?? messages.isEmail
          : null,
    );
  }

  /// check if the value is email address
  FieldValidator<String?, String> creditCard(
      [MessageCallBack<String>? message]) {
    return next(
      (messages, value) => !Utils.isCreditCard(value)
          ? message?.call(messages, value) ?? messages.isCreditCard
          : null,
    );
  }

  /// check if the value starts with [pattern]
  FieldValidator<String?, String> startsWithFn(ValueGetter<Pattern> pattern,
      [MessageCallBack<String>? message]) {
    return next((messages, value) {
      var ptr = pattern();
      return !value.startsWith(ptr)
          ? message?.call(messages, value) ??
              messages.startsWith(ptr.toString())
          : null;
    });
  }

  /// check if the value starts with [pattern]
  FieldValidator<String?, String> startsWith(Pattern pattern,
      [MessageCallBack<String>? message]) {
    return startsWithFn(() => pattern, message);
  }

  /// check if the value contains [pattern]
  FieldValidator<String?, String> containsFn(ValueGetter<Pattern> pattern,
      [MessageCallBack<String>? message]) {
    return next((messages, value) {
      var ptr = pattern();
      return !value.contains(ptr)
          ? message?.call(messages, value) ?? messages.contains(ptr.toString())
          : null;
    });
  }

  /// check if the value contains [pattern]
  FieldValidator<String?, String> contains(Pattern pattern,
      [MessageCallBack<String>? message]) {
    return containsFn(() => pattern, message);
  }

  /// check if the value ends with [other]
  FieldValidator<String?, String> endsWithFn(ValueGetter<String> other,
      [MessageCallBack<String>? message]) {
    return next((messages, value) {
      var oth = other();
      return !value.endsWith(oth)
          ? message?.call(messages, value) ?? messages.startsWith(oth)
          : null;
    });
  }

  /// check if the value ends with [other]
  FieldValidator<String?, String> endsWith(String other,
      [MessageCallBack<String>? message]) {
    return endsWithFn(() => other, message);
  }

  /// check if the value is not empty
  FieldValidator<String?, String> notEmpty([MessageCallBack<String>? message]) {
    return next(
      (messages, value) => value.isEmpty
          ? message?.call(messages, value) ?? messages.notEmpty
          : null,
    );
  }

  /// check if the value is not empty and not contains only white spaces
  FieldValidator<String?, String> notEmptyOrWhiteSpace(
      [MessageCallBack<String>? message]) {
    return next(
      (messages, value) => value.isNullOrEmptyOrWhiteSpace
          ? message?.call(messages, value) ?? messages.notEmpty
          : null,
    );
  }

  /// check is the value matches [regExp]
  FieldValidator<String?, String> matchesFn(ValueGetter<RegExp> regExp,
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
  FieldValidator<String?, String> matches(RegExp regExp,
      [MessageCallBack<String>? message]) {
    return matchesFn(() => regExp, message);
  }

  /// check is the value has  length of [length]
  FieldValidator<String?, String> hasLengthFn(ValueGetter<int> length,
      [MessageCallBack<String>? message]) {
    return next((messages, value) {
      var len = length();
      if (value.length != len) {
        return message?.call(messages, value) ?? messages.hasLength(len);
      }
      return null;
    });
  }

  /// check is the value has  length of [length]
  FieldValidator<String?, String> hasLength(int length,
      [MessageCallBack<String>? message]) {
    return hasLengthFn(() => length, message);
  }

  /// check is the value has min length of [min]
  FieldValidator<String?, String> hasMinLengthFn(ValueGetter<int> min,
      [MessageCallBack<String>? message]) {
    return next((messages, value) {
      var minimum = min();
      if (value.length < minimum) {
        return message?.call(messages, value) ?? messages.hasMinLength(minimum);
      }
      return null;
    });
  }

  /// check is the value has min length of [min]
  FieldValidator<String?, String> hasMinLength(int min,
      [MessageCallBack<String>? message]) {
    return hasMinLengthFn(() => min, message);
  }

  /// check is the value has max length of [max]
  FieldValidator<String?, String> hasMaxLengthFn(ValueGetter<int> max,
      [MessageCallBack<String>? message]) {
    return next((messages, value) {
      var maximum = max();
      if (value.length > maximum) {
        return message?.call(messages, value) ?? messages.hasMaxLength(maximum);
      }
      return null;
    });
  }

  /// check is the value has max length of [max]
  FieldValidator<String?, String> hasMaxLength(int max,
      [MessageCallBack<String>? message]) {
    return hasMaxLengthFn(() => max, message);
  }

  /// check is the value length is between [min] and [max]
  FieldValidator<String?, String> hasRangeFn(
      ValueGetter<int> min, ValueGetter<int> max,
      [MessageCallBack<String>? message]) {
    return next((messages, value) {
      var minimum = min();
      var maximum = max();
      if (value.length < minimum || value.length > maximum) {
        return message?.call(messages, value) ??
            messages.hasRange(minimum, maximum);
      }
      return null;
    });
  }

  /// check is the value length is between [min] and [max]
  FieldValidator<String?, String> hasRange(int min, int max,
      [MessageCallBack<String>? message]) {
    return hasRangeFn(() => min, () => max, message);
  }

  /// check is the value is number
  FieldValidator<String?, num> isNumber([MessageCallBack<String>? message]) {
    return next((messages, value) {
      if (num.tryParse(value) == null) {
        return message?.call(messages, value) ?? messages.isNumber;
      }
      return null;
    }).transform((value) => num.parse(value));
  }

  /// check is the value is [int]
  FieldValidator<String?, int> isInteger([MessageCallBack<String>? message]) {
    return next((messages, value) {
      if (int.tryParse(value) == null) {
        return message?.call(messages, value) ?? messages.isInteger;
      }
      return null;
    }).transform((value) => int.parse(value));
  }

  /// check is the value is [double]
  FieldValidator<String?, double> isDecimal(
      [MessageCallBack<String>? message]) {
    return next((messages, value) {
      if (double.tryParse(value) == null) {
        return message?.call(messages, value) ?? messages.isDecimal;
      }
      return null;
    }).transform((value) => double.parse(value));
  }

  /// check is the value is [DateTime]
  FieldValidator<String?, DateTime> isDateTime(
      [MessageCallBack<String>? message]) {
    return next((messages, value) {
      if (DateTime.tryParse(value) == null) {
        return message?.call(messages, value) ?? messages.isDateTime;
      }
      return null;
    }).transform((value) => DateTime.parse(value));
  }

  /// check is the value is [TimeOfDay]
  FieldValidator<String?, TimeOfDay> isTimeOfDay(
      [MessageCallBack<String>? message]) {
    return next((messages, value) {
      if (!value.isTimeOfDay) {
        return message?.call(messages, value) ?? messages.isTimeOfDay;
      }
      return null;
    }).transform((value) => value.toTimeOfDay()!);
  }

  /// check string is angel company valid url
  FieldValidator<String?, String> isAngelCompany({
    MessageCallBack<String>? message,
    String? company,
  }) {
    return next((messages, value) {
      if (!value.isAngelCompany(company)) {
        return message?.call(messages, value) ??
            messages.invalidAngelCompanyUrl(company ?? 'empty');
      }
      return null;
    });
  }

  /// check string is angel job valid url
  FieldValidator<String?, String> isAngelJob({
    MessageCallBack<String>? message,
    String? jobId,
  }) {
    return next((messages, value) {
      if (!value.isAngelJob(jobId)) {
        return message?.call(messages, value) ??
            messages.invalidAngelJobUrl(jobId ?? 'empty');
      }
      return null;
    });
  }

  /// check string is crunchbase organization url
  FieldValidator<String?, String> isCrunchbaseOrganization({
    MessageCallBack<String>? message,
    String? organization,
  }) {
    return next((messages, value) {
      if (!value.isCrunchbaseOrganization(organization)) {
        return message?.call(messages, value) ??
            messages.invalidCrunchbaseOrganizationUrl(organization ?? 'empty');
      }
      return null;
    });
  }

  /// check string is crunchbase person url
  FieldValidator<String?, String> isCrunchbasePerson({
    MessageCallBack<String>? message,
    String? person,
  }) {
    return next((messages, value) {
      if (!value.isCrunchbasePerson(person)) {
        return message?.call(messages, value) ??
            messages.invalidCrunchbasePersonUrl(person ?? 'empty');
      }
      return null;
    });
  }

  /// Check string is facebook url
  FieldValidator<String?, String> isFacebookUrl({
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
              name ?? 'empty',
              id ?? 'empty',
            );
      }
      return null;
    });
  }

  /// Check string is github url
  FieldValidator<String?, String> isGitHubUrl({
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
              user ?? 'empty',
              repository ?? 'empty',
            );
      }
      return null;
    });
  }

  /// Check string is google plus url
  FieldValidator<String?, String> isGooglePlusUrl({
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
              userName ?? 'empty',
              id ?? 'empty',
            );
      }
      return null;
    });
  }

  /// Check string is hacker news user url
  FieldValidator<String?, String> isHackerNewsUserUrl({
    MessageCallBack<String>? message,
    String? id,
  }) {
    return next((messages, value) {
      if (!value.isHackerNewsUserUrl(id: id)) {
        return message?.call(messages, value) ??
            messages.invalidHackerNewsUserUrl(id ?? 'empty');
      }
      return null;
    });
  }

  /// Check string is hacker news url
  FieldValidator<String?, String> isHackerNewsItemUrl({
    MessageCallBack<String>? message,
    String? id,
  }) {
    return next((messages, value) {
      if (!value.isHackerNewsItemUrl(id: id)) {
        return message?.call(messages, value) ??
            messages.invalidHackerNewsItemUrl(id ?? 'empty');
      }
      return null;
    });
  }

  /// Check string is instagram url
  FieldValidator<String?, String> isInstagramUrl({
    MessageCallBack<String>? message,
    String? user,
  }) {
    return next((messages, value) {
      if (!value.isInstagramUrl(user: user)) {
        return message?.call(messages, value) ??
            messages.invalidInstagramUrl(user ?? 'empty');
      }
      return null;
    });
  }

  /// Check string is linkedin profile url
  FieldValidator<String?, String> isLinkedInProfile({
    MessageCallBack<String>? message,
    String? permalink,
  }) {
    return next((messages, value) {
      if (!value.isLinkedInProfile(permalink: permalink)) {
        return message?.call(messages, value) ??
            messages.invalidLinkedInProfileUrl(permalink ?? 'empty');
      }
      return null;
    });
  }

  /// Check string is linkedin company url
  FieldValidator<String?, String> isLinkedInCompany({
    MessageCallBack<String>? message,
    String? permalink,
  }) {
    return next((messages, value) {
      if (!value.isLinkedInCompany(permalink: permalink)) {
        return message?.call(messages, value) ??
            messages.invalidAngelCompanyUrl(permalink ?? 'empty');
      }
      return null;
    });
  }

  /// Check string is linkedin post url
  FieldValidator<String?, String> isLinkedInPost({
    MessageCallBack<String>? message,
    String? id,
  }) {
    return next((messages, value) {
      if (!value.isLinkedInPost(id: id)) {
        return message?.call(messages, value) ??
            messages.invalidLinkedInPostUrl(id ?? 'empty');
      }
      return null;
    });
  }

  /// Check string is reddit url
  FieldValidator<String?, String> isRedditUrl({
    MessageCallBack<String>? message,
    String? user,
  }) {
    return next((messages, value) {
      if (!value.isRedditUrl(user: user)) {
        return message?.call(messages, value) ??
            messages.invalidRedditUrl(user ?? 'empty');
      }
      return null;
    });
  }

  /// Check string is snapchat url
  FieldValidator<String?, String> isSnapchatUrl({
    MessageCallBack<String>? message,
    String? user,
  }) {
    return next((messages, value) {
      if (!value.isSnapchatUrl(user: user)) {
        return message?.call(messages, value) ??
            messages.invalidSnapchatUrl(user ?? 'empty');
      }
      return null;
    });
  }

  /// Check string is stack exchange url
  FieldValidator<String?, String> isStackexchangeUrl({
    MessageCallBack<String>? message,
    String? user,
    String? id,
    String? community,
  }) {
    return next((messages, value) {
      if (!value.isStackexchangeUrl(user: user, id: id, community: community)) {
        return message?.call(messages, value) ??
            messages.invalidStackexchangeUrl(user ?? 'empty', id ?? 'empty');
      }
      return null;
    });
  }

  /// Check string is stackoverflow question url
  FieldValidator<String?, String> isStackoverflowQuestionUrl({
    MessageCallBack<String>? message,
    String? id,
  }) {
    return next((messages, value) {
      if (!value.isStackoverflowQuestionUrl(id: id)) {
        return message?.call(messages, value) ??
            messages.invalidStackoverflowQuestionUrl(id ?? 'empty');
      }
      return null;
    });
  }

  /// Check string is stackoverflow user url
  FieldValidator<String?, String> isStackoverflowUserUrl({
    MessageCallBack<String>? message,
    String? id,
  }) {
    return next((messages, value) {
      if (!value.isStackoverflowUserUrl(id: id)) {
        return message?.call(messages, value) ??
            messages.invalidStackoverflowUserUrl(id ?? 'empty');
      }
      return null;
    });
  }

  /// Check string is telegram profile  url
  FieldValidator<String?, String> isTelegramProfileUrl({
    MessageCallBack<String>? message,
    String? userName,
  }) {
    return next((messages, value) {
      if (!value.isTelegramProfileUrl(userName: userName)) {
        return message?.call(messages, value) ??
            messages.invalidTelegramProfileUrl(userName ?? 'empty');
      }
      return null;
    });
  }

  /// Check string is  medium post url
  FieldValidator<String?, String> isMediumPostUrl({
    MessageCallBack<String>? message,
    String? postId,
  }) {
    return next((messages, value) {
      if (!value.isMediumPostUrl(postId: postId)) {
        return message?.call(messages, value) ??
            messages.invalidMediumPostUrl(postId ?? 'empty');
      }
      return null;
    });
  }

  /// Check string is  medium user url
  FieldValidator<String?, String> isMediumUserUrl({
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
              userName ?? 'empty',
              id ?? 'empty',
            );
      }
      return null;
    });
  }

  /// Check string is twitter status  url
  FieldValidator<String?, String> isTwitterStatusUrl({
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
              userName ?? 'empty',
              tweetId ?? 'empty',
            );
      }
      return null;
    });
  }

  /// Check string is twitter user  url
  FieldValidator<String?, String> isTwitterUserUrl({
    MessageCallBack<String>? message,
    String? userName,
  }) {
    return next((messages, value) {
      if (!value.isTwitterUserUrl(userName: userName)) {
        return message?.call(messages, value) ??
            messages.invalidTwitterUserUrl(userName ?? 'empty');
      }
      return null;
    });
  }

  /// Check string is youtube channel  url
  FieldValidator<String?, String> isYoutubeChannelUrl({
    MessageCallBack<String>? message,
    String? id,
  }) {
    return next((messages, value) {
      if (!value.isYoutubeChannelUrl(id: id)) {
        return message?.call(messages, value) ??
            messages.invalidYoutubeChannelUrl(id ?? 'empty');
      }
      return null;
    });
  }

  /// Check string is youtube video  url
  FieldValidator<String?, String> isYoutubeVideoUrl({
    MessageCallBack<String>? message,
    String? id,
  }) {
    return next((messages, value) {
      if (!value.isYoutubeVideoUrl(id: id)) {
        return message?.call(messages, value) ??
            messages.invalidYoutubeVideoUrl(id ?? 'empty');
      }
      return null;
    });
  }

  /// Check string is youtube user  url
  FieldValidator<String?, String> isYoutubeUserUrl({
    MessageCallBack<String>? message,
    String? username,
  }) {
    return next((messages, value) {
      if (!value.isYoutubeUserUrl(username: username)) {
        return message?.call(messages, value) ??
            messages.invalidYoutubeUserUrl(username ?? 'empty');
      }
      return null;
    });
  }
}
