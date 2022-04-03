library duration_extension;

part 'default_formatter.dart';
part 'formatter_base.dart';

extension DurationExtensions on Duration {
  /// Format duration to readable string
  /// you can choose one of our formatters `DefaultDurationFormatter` or `TranslatedDurationFormatter`
  /// or you can implement `DurationFormatter` and create your own
  String format({
    int maxParts = 2,
    int secondsToShowNow = 0,
    DurationFormatter formatter = const DefaultDurationFormatter(),
  }) {
    var delta = inSeconds;
    if (delta <= (secondsToShowNow)) return formatter.getNow();
    var years = (delta / (2592000 * 12)).floor();
    delta -= years * (2592000 * 12);
    var months = (delta / 2592000).floor();
    delta -= months * 2592000;
    var weeks = (delta / 86400).floor() ~/ 7;
    delta -= weeks * 7 * 86400;
    var days = (delta / 86400).floor();
    delta -= days * 86400;
    var hours = (delta / 3600).floor() % 24;
    delta -= hours * 3600;
    var minutes = (delta / 60).floor() % 60;
    delta -= minutes * 60;
    var seconds = delta % 60;
    var text;
    var parts = 0;
    if (years > 0) {
      if (text == null) {
        text = formatter.getYears(years);
      } else {
        text += formatter.getSeparator() + formatter.getYears(years);
      }
      parts++;
      if (parts >= maxParts) return text;
    }
    if (months > 0) {
      if (text == null) {
        text = formatter.getMonths(months);
      } else {
        text += formatter.getSeparator() + formatter.getMonths(months);
      }
      parts++;
      if (parts >= maxParts) return text;
    }
    if (weeks > 0) {
      if (text == null) {
        text = formatter.getWeeks(weeks);
      } else {
        text += formatter.getSeparator() + formatter.getWeeks(days);
      }
      parts++;
      if (parts >= maxParts) return text;
    }
    if (days > 0) {
      if (text == null) {
        text = formatter.getDays(days);
      } else {
        text += formatter.getSeparator() + formatter.getDays(days);
      }
      parts++;
      if (parts >= maxParts) return text;
    }
    if (hours > 0) {
      if (text == null) {
        text = formatter.getHours(hours);
      } else {
        text += formatter.getSeparator() + formatter.getHours(hours);
      }
      parts++;
      if (parts >= maxParts) return text;
    }
    if (minutes > 0) {
      if (text == null) {
        text = formatter.getMinutes(minutes);
      } else {
        text += formatter.getSeparator() + formatter.getMinutes(minutes);
      }
      parts++;
      if (parts >= maxParts) return text;
    }
    if (seconds > 0) {
      if (text == null) {
        text = formatter.getSeconds(seconds);
      } else {
        text += formatter.getSeparator() + formatter.getSeconds(seconds);
      }
      parts++;
      if (parts >= maxParts) return text;
    }
    return text ?? '';
  }

  /// count down this duration with 1 microsecond
  Duration countDownMicroseconds() {
    return this - Duration(microseconds: 1);
  }

  /// count down this duration with 1 millisecond
  Duration countDownMilliseconds() {
    return this - Duration(milliseconds: 1);
  }

  /// count down this duration with 1 seconds
  Duration countDownSeconds() {
    return this - Duration(seconds: 1);
  }

  /// count down this duration with 1 minute
  Duration countDownMinutes() {
    return this - Duration(minutes: 1);
  }

  /// count down this duration with 1 hour
  Duration countDownHours() {
    return this - Duration(minutes: 1);
  }

  /// count down this duration with 1 day
  Duration countDownDays() {
    return this - Duration(days: 1);
  }

  /// count up this duration with 1 microsecond
  Duration countUpMicroseconds() {
    return this + Duration(microseconds: 1);
  }

  /// count up this duration with 1 millisecond
  Duration countUpMilliseconds() {
    return this + Duration(milliseconds: 1);
  }

  /// count up this duration with 1 seconds
  Duration countUpSeconds() {
    return this + Duration(seconds: 1);
  }

  /// count up this duration with 1 minute
  Duration countUpMinutes() {
    return this + Duration(minutes: 1);
  }

  /// count up this duration with 1 hour
  Duration countUpHours() {
    return this + Duration(minutes: 1);
  }

  /// count up this duration with 1 day
  Duration countUpnDays() {
    return this + Duration(days: 1);
  }
}
