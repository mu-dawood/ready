import 'package:flutter/material.dart';
import 'package:simple/src/gen_l10n/simple_localizations.dart';
import 'package:simple/src/gen_l10n/simple_localizations_ar.dart';
import 'package:simple_dart/simple_dart.dart';
import 'package:validators/validators.dart';

import '../string_extensions.dart';

part 'feild_extensions.dart';
part 'field_validator.dart';
part 'validatation_messages.dart';
part 'validation_messages_wrapper.dart';

extension ValidationExtensions on BuildContext {
  DefaultValidationMessages get messages => DefaultValidationMessages.of(this);

  /// Valiadate any form field
  FieldValidator<T> required<T>() {
    fn(T? value) {
      if (value == null) return messages.required;
      if (value is String && (value).trim().isEmpty) return messages.required;
    }

    return FieldValidator._(validate: fn, context: this);
  }

  FieldValidator<T> _validateIfExists<T>(String? Function(T v) validator) {
    fn(T? value) {
      if (value == null || value.toString().trim().isEmpty) return null;
      return validator(value);
    }

    return FieldValidator._(validate: fn, context: this);
  }

  ///Valiadate TextFormField
  FieldValidator<String> maxLength(int max) {
    assert(max > 0);
    return _validateIfExists<String>((v) {
      if (v.length > max) return messages.stringMaxLength(v, max);
    });
  }

  /// Valiadate TextFormField
  FieldValidator<String> minLength(int min) {
    assert(min >= 0);
    return _validateIfExists<String>((v) {
      if (v.length < min) return messages.stringMinLength(v, min);
    });
  }

  /// Valiadate TextFormField
  FieldValidator<String> lengthInRange(int min, int max) {
    assert(min >= 0);
    assert(max > min);
    return _validateIfExists<String>((v) {
      if (v.length < min || v.length > max) return messages.stringMustBeInRange(v, min, max);
    });
  }

  /// Valiadate TextFormField
  FieldValidator<String> dateTime() {
    return _validateIfExists<String>((v) {
      if (!v.isDateTime) return messages.stringMustBeDateTime(v);
    });
  }

  /// Valiadate TextFormField
  FieldValidator<String> timeOfDay() {
    return _validateIfExists<String>((v) {
      if (!v.isTimeOfDay) return messages.stringMustBeTimeOfDay(v);
    });
  }

  /// Valiadate TextFormField
  FieldValidator<String> dateAfter(DateTime after, [bool canBeSame = false]) {
    return _validateIfExists<String>((v) {
      var _date = v.toDate();
      if (_date == null) return messages.stringMustBeDateTime(v);
      if (canBeSame && _date.isAtSameMomentAs(after)) return null;
      if (!_date.isAfter(after)) return messages.mustBeDateAfter(_date, after);
    });
  }

  /// Valiadate FormFields that has type of DateTime
  FieldValidator<DateTime> isDateAfter(DateTime after, [bool canBeSame = false]) {
    return _validateIfExists<DateTime>((v) {
      if (canBeSame && v.isAtSameMomentAs(after)) return null;
      if (!v.isAfter(after)) return messages.mustBeDateAfter(v, after);
    });
  }

  /// Valiadate TextFormField
  FieldValidator<String> dateBefore(DateTime before, [bool canBeSame = false]) {
    return _validateIfExists<String>((v) {
      var _date = v.toDate();
      if (_date == null) return messages.stringMustBeDateTime(v);
      if (canBeSame && _date.isAtSameMomentAs(before)) return null;
      if (!_date.isBefore(before)) return messages.mustBeDateBefore(_date, before);
    });
  }

  /// Valiadate FormFields that has type of DateTime
  FieldValidator<DateTime> isDateBefore(DateTime before, [bool canBeSame = false]) {
    return _validateIfExists<DateTime>((v) {
      if (canBeSame && v.isAtSameMomentAs(before)) return null;
      if (!v.isBefore(before)) return messages.mustBeDateBefore(v, before);
    });
  }

  /// Valiadate TextFormField
  FieldValidator<String> dateBetween(DateTime min, DateTime max) {
    assert(min.isBefore(max));
    return _validateIfExists<String>((v) {
      var _date = v.toDate();
      if (_date == null) return messages.stringMustBeDateTime(v);
      if (_date.isBefore(min) || _date.isAfter(max)) return messages.mustBeDateBetween(_date, min, max);
    });
  }

  /// Valiadate FormFields that has type of DateTime
  FieldValidator<DateTime> isDateBetween(DateTime min, DateTime max) {
    assert(min.isBefore(max));
    return _validateIfExists<DateTime>((v) {
      if (v.isBefore(min) || v.isAfter(max)) return messages.mustBeDateBetween(v, min, max);
    });
  }

  /// Valiadate TextFormField
  FieldValidator<String> timeOfDayAfter(TimeOfDay after, [bool canBeSame = false]) {
    return _validateIfExists<String>((v) {
      var time = v.toTimeOfDay();
      if (time == null) return messages.stringMustBeTimeOfDay(v);
      var _time = time.hour * 60 + time.minute;
      var _after = after.hour * 60 + after.minute;
      if (canBeSame && _time == _after) return null;
      if (_time < _after) return messages.mustBeTimeOfDayAfter(time, after);
    });
  }

  /// Valiadate FormFields that has type of TimeOfDay
  FieldValidator<TimeOfDay> isTimeOfDayAfter(TimeOfDay after, [bool canBeSame = false]) {
    return _validateIfExists<TimeOfDay>((v) {
      var _time = v.hour * 60 + v.minute;
      var _after = after.hour * 60 + after.minute;
      if (canBeSame && _time == _after) return null;
      if (_time < _after) return messages.mustBeTimeOfDayAfter(v, after);
    });
  }

  /// Valiadate TextFormField
  FieldValidator<String> timeOfDayBefore(TimeOfDay before, [bool canBeSame = false]) {
    return _validateIfExists<String>((v) {
      var time = v.toTimeOfDay();
      if (time == null) return messages.stringMustBeTimeOfDay(v);
      var _time = time.hour * 60 + time.minute;
      var _before = before.hour * 60 + before.minute;
      if (canBeSame && _time == _before) return null;
      if (_time > _before) return messages.mustBeTimeOfDayBefore(time, before);
    });
  }

  /// Valiadate FormFields that has type of TimeOfDay
  FieldValidator<TimeOfDay> isTimeOfDayBefore(TimeOfDay before, [bool canBeSame = false]) {
    return _validateIfExists<TimeOfDay>((v) {
      var _time = v.hour * 60 + v.minute;
      var _before = before.hour * 60 + before.minute;
      if (canBeSame && _time == _before) return null;
      if (_time > _before) return messages.mustBeTimeOfDayBefore(v, before);
    });
  }

  /// Valiadate TextFormField
  FieldValidator<String> timeOfDayBetween(TimeOfDay min, TimeOfDay max) {
    return _validateIfExists<String>((v) {
      var time = v.toTimeOfDay();
      if (time == null) return messages.stringMustBeTimeOfDay(v);
      var _time = time.hour * 60 + time.minute;
      var _min = min.hour * 60 + min.minute;
      var _max = max.hour * 60 + max.minute;
      if (_time < _min || _time > _max) return messages.mustBeTimeOfDayBetween(time, min, max);
    });
  }

  /// Valiadate FormFields that has type of TimeOfDay
  FieldValidator<TimeOfDay> isTimeOfDayBetween(TimeOfDay min, TimeOfDay max) {
    return _validateIfExists<TimeOfDay>((v) {
      var _time = v.hour * 60 + v.minute;
      var _min = min.hour * 60 + min.minute;
      var _max = max.hour * 60 + max.minute;
      if (_time < _min || _time > _max) return messages.mustBeTimeOfDayBetween(v, min, max);
    });
  }

  /// Valiadate TextFormField
  FieldValidator<String> number() {
    return _validateIfExists<String>((v) {
      var n = double.tryParse(v);
      if (n == null) return messages.mustBeNumber(v);
    });
  }

  /// Valiadate TextFormField
  FieldValidator<String> integer() {
    return _validateIfExists<String>((v) {
      var n = int.tryParse(v);
      if (n == null) return messages.mustBeInteger(v);
    });
  }

  /// Valiadate TextFormField
  FieldValidator<String> decimal() {
    return _validateIfExists<String>((v) {
      var n = double.tryParse(v);
      if (n == null || !v.contains('.')) return messages.mustBeDecimal(v);
    });
  }

  /// Valiadate TextFormField user
  FieldValidator<String> url({
    List<String> protocols = const ['http', 'https', 'ftp'],
    bool requireTld = true,
    bool requireProtocol = false,
    bool allowUnderscore = false,
    List<String> hostWhitelist = const [],
    List<String> hostBlacklist = const [],
  }) {
    return _validateIfExists<String>((v) {
      if (!isURL(
        v,
        protocols: protocols,
        requireProtocol: requireProtocol,
        allowUnderscore: allowUnderscore,
        hostBlacklist: hostBlacklist,
        hostWhitelist: hostWhitelist,
        requireTld: requireTld,
      )) return messages.mustBeUrl(v);
    });
  }

  /// Valiadate TextFormField
  FieldValidator<String> email() {
    return _validateIfExists<String>((v) {
      if (!isEmail(v)) return messages.mustBeEmail(v);
    });
  }

  /// Valiadate TextFormField
  FieldValidator<String> hexColor() {
    return _validateIfExists<String>((v) {
      if (!isHexColor(v)) return messages.mustBeHexColor(v);
    });
  }

  /// Valiadate TextFormField
  FieldValidator<String> localEgyptianPhone() {
    return _validateIfExists<String>((v) {
      if (!v.isLocalEgyptianPhone) return messages.mustBeLocalEgyptianPhone(v);
    });
  }

  /// Valiadate TextFormField
  FieldValidator<String> internationalEgyptianPhone() {
    return _validateIfExists<String>((v) {
      if (!v.isInternationalEgyptianPhone) return messages.mustBeInternationalEgyptianPhone(v);
    });
  }

  /// Valiadate TextFormField
  FieldValidator<String> localKsaPhone() {
    return _validateIfExists<String>((v) {
      if (!v.isLocalKsaPhone) return messages.mustBeLocalKsaPhone(v);
    });
  }

  /// Valiadate TextFormField
  FieldValidator<String> internationalKsaPhone() {
    return _validateIfExists<String>((v) {
      if (!v.isInternationalKsaPhone) return messages.mustBeInternationalKsaPhone(v);
    });
  }

  /// Valiadate TextFormField
  FieldValidator<String> githubUrl({String? user, String? repositry}) {
    return _validateIfExists<String>((v) {
      if (!v.isGitHubUrl(user: user, repositry: repositry)) return messages.mustBeGithubUrl(v);
    });
  }

  /// Valiadate TextFormField
  FieldValidator<String> redditUrl([String? user]) {
    return _validateIfExists<String>((v) {
      if (!v.isRedditUrl(user: user)) return messages.mustBeRedditUrl(v);
    });
  }

  /// Valiadate TextFormField
  FieldValidator<String> instagramUrl([String? user]) {
    return _validateIfExists<String>((v) {
      if (!v.isInstagramUrl(user: user)) return messages.mustBeInstagramUrl(v);
    });
  }

  /// Valiadate TextFormField
  FieldValidator<String> linkedinProfileUrl([String? permalink]) {
    return _validateIfExists<String>((v) {
      if (!v.isLinkedInProfile(permalink: permalink)) return messages.mustBeLinkedinProfile(v);
    });
  }

  /// Valiadate TextFormField
  FieldValidator<String> twitterUserUrl([String? userName]) {
    return _validateIfExists<String>((v) {
      if (!v.isTwitterUserUrl(userName: userName)) return messages.mustBeTwitterUser(v);
    });
  }

  /// Valiadate TextFormField
  FieldValidator<String> youtubeUrl([String? id]) {
    return _validateIfExists<String>((v) {
      if (!v.isYoutubeVideoUrl(id: id)) return messages.mustBeYoutubeVideoUrl(v);
    });
  }

  /// Valiadate TextFormField
  FieldValidator<String> snapchatProfileUrl([String? user]) {
    return _validateIfExists<String>((v) {
      if (!v.isSnapchatUrl(user: user)) return messages.mustBeSnapchatProfile(v);
    });
  }
}
