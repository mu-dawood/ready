part of 'validations.dart';

extension DateTimeFeildValidatorExt on FieldValidator<DateTime> {
  FieldValidator<DateTime> required() {
    return add((context) => context.required<DateTime>());
  }

  FieldValidator<DateTime> isDateAfter(DateTime after, [bool canBeSame = false]) => add((context) => context.isDateAfter(after, canBeSame));
  FieldValidator<DateTime> isDateBefore(DateTime before, [bool canBeSame = false]) => add((context) => context.isDateBefore(before, canBeSame));
  FieldValidator<DateTime> isDateBetween(DateTime min, DateTime max) => add((context) => context.isDateBetween(min, max));
}

extension TimeOfDayFeildValidatorExt on FieldValidator<TimeOfDay> {
  FieldValidator<TimeOfDay> required() {
    return add((context) => context.required<TimeOfDay>());
  }

  FieldValidator<TimeOfDay> isTimeOfDayAfter(TimeOfDay after, [bool canBeSame = false]) => add((context) => context.isTimeOfDayAfter(after, canBeSame));
  FieldValidator<TimeOfDay> isTimeOfDayBefore(TimeOfDay before, [bool canBeSame = false]) => add((context) => context.isTimeOfDayBefore(before, canBeSame));
  FieldValidator<TimeOfDay> isTimeOfDayBetween(TimeOfDay min, TimeOfDay max) => add((context) => context.isTimeOfDayBetween(min, max));
}

extension StringFeildValidatorExt on FieldValidator<String> {
  FieldValidator<String> required() {
    return add((context) => context.required<String>());
  }

  FieldValidator<String> maxLength(int max) => add((context) => context.maxLength(max));
  FieldValidator<String> minLength(int min) => add((context) => context.minLength(min));
  FieldValidator<String> lengthInRange(int min, int max) => add((context) => context.lengthInRange(min, max));
  FieldValidator<String> dateTime() => add((context) => context.dateTime());
  FieldValidator<String> timeOfDay() => add((context) => context.timeOfDay());
  FieldValidator<String> dateAfter(DateTime after, [bool canBeSame = false]) => add((context) => context.dateAfter(after, canBeSame));
  FieldValidator<String> dateBefore(DateTime before, [bool canBeSame = false]) => add((context) => context.dateBefore(before, canBeSame));
  FieldValidator<String> dateBetween(DateTime min, DateTime max) => add((context) => context.dateBetween(min, max));
  FieldValidator<String> timeOfDayAfter(TimeOfDay after, [bool canBeSame = false]) => add((context) => context.timeOfDayAfter(after, canBeSame));
  FieldValidator<String> timeOfDayBefore(TimeOfDay before, [bool canBeSame = false]) => add((context) => context.timeOfDayBefore(before, canBeSame));
  FieldValidator<String> timeOfDayBetween(TimeOfDay min, TimeOfDay max) => add((context) => context.timeOfDayBetween(min, max));
  FieldValidator<String> number() => add((context) => context.number());
  FieldValidator<String> integer() => add((context) => context.integer());
  FieldValidator<String> decimal() => add((context) => context.decimal());
  FieldValidator<String> url({
    List<String> protocols = const ['http', 'https', 'ftp'],
    bool requireTld = true,
    bool requireProtocol = false,
    bool allowUnderscore = false,
    List<String> hostWhitelist = const [],
    List<String> hostBlacklist = const [],
  }) =>
      add((context) => context.url(
            protocols: protocols,
            requireProtocol: requireProtocol,
            allowUnderscore: allowUnderscore,
            hostBlacklist: hostBlacklist,
            hostWhitelist: hostWhitelist,
            requireTld: requireTld,
          ));

  FieldValidator<String> email() => add((context) => context.email());
  FieldValidator<String> hexColor() => add((context) => context.hexColor());
  FieldValidator<String> localEgyptianPhone() => add((context) => context.localEgyptianPhone());
  FieldValidator<String> internationalEgyptianPhone() => add((context) => context.internationalEgyptianPhone());
  FieldValidator<String> localKsaPhone() => add((context) => context.localKsaPhone());
  FieldValidator<String> internationalKsaPhone() => add((context) => context.internationalKsaPhone());
  FieldValidator<String> githubUrl({String? user, String? repositry}) => add((context) => context.githubUrl(user: user, repositry: repositry));
  FieldValidator<String> redditUrl([String? user]) => add((context) => context.redditUrl(user));
  FieldValidator<String> instagramUrl([String? user]) => add((context) => context.instagramUrl(user));
  FieldValidator<String> linkedinProfileUrl([String? permalink]) => add((context) => context.linkedinProfileUrl(permalink));
  FieldValidator<String> twitterUserUrl([String? userName]) => add((context) => context.twitterUserUrl(userName));
  FieldValidator<String> youtubeUrl([String? id]) => add((context) => context.youtubeUrl(id));
  FieldValidator<String> snapchatProfileUrl([String? user]) => add((context) => context.snapchatProfileUrl(user));
}
