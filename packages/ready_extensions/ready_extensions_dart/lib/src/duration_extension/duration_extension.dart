library duration_extension;

import '../num_extension.dart';

part 'default_formatter.dart';
part 'formatter_base.dart';

extension DurationExtensions on Duration {
  /// Format duration to readable string
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
    String? text;
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

  /// count down this duration with n microseconds
  Duration minusMicroSeconds([int v = 1]) {
    return this - Duration(microseconds: v);
  }

  /// count down this duration with n milliseconds
  Duration minusMilliSeconds([int v = 1]) {
    return this - Duration(milliseconds: v);
  }

  /// count down this duration with n seconds
  Duration minusSeconds([int v = 1]) {
    return this - Duration(seconds: v);
  }

  /// count down this duration with n minutes
  Duration minusMinutes([int v = 1]) {
    return this - Duration(minutes: v);
  }

  /// count down this duration with n hours
  Duration minusHours([int v = 1]) {
    return this - Duration(hours: v);
  }

  /// count down this duration with n days
  Duration minusDays([int v = 1]) {
    return this - Duration(days: v);
  }

  /// count up this duration with n microseconds
  Duration plusMicroSeconds([int v = 1]) {
    return this + Duration(microseconds: v);
  }

  /// count up this duration with n milliseconds
  Duration plusMilliSeconds([int v = 1]) {
    return this + Duration(milliseconds: v);
  }

  /// count up this duration with n seconds
  Duration plusSeconds([int v = 1]) {
    return this + Duration(seconds: v);
  }

  /// count up this duration with n minutes
  Duration plusMinutes([int v = 1]) {
    return this + Duration(minutes: v);
  }

  /// count up this duration with n hours
  Duration plusHours([int v = 1]) {
    return this + Duration(hours: v);
  }

  /// count up this duration with n days
  Duration plusDays([int v = 1]) {
    return this + Duration(days: v);
  }

  /// convert duration to  ISO_8601  format
  String toIso() => inSeconds.toISODuration();
}
