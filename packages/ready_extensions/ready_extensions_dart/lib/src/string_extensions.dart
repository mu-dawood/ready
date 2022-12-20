class _Parser {
  final String? input;

  _Parser(this.input);

  /// will convert from english numbers to arabic numbers
  String? englishToArabicNumbers() {
    return input
        ?.replaceAll('0', '٠')
        .replaceAll('1', '١')
        .replaceAll('2', '٢')
        .replaceAll('3', '٣')
        .replaceAll('4', '٤')
        .replaceAll('5', '٥')
        .replaceAll('6', '٦')
        .replaceAll('7', '٧')
        .replaceAll('8', '٨')
        .replaceAll('9', '٩');
  }

  /// will convert from arabic numbers to english numbers
  String? arabicToEnglishNumbers() {
    return input
        ?.replaceAll('٠', '0')
        .replaceAll('١', '1')
        .replaceAll('٢', '2')
        .replaceAll('٣', '3')
        .replaceAll('٤', '4')
        .replaceAll('٥', '5')
        .replaceAll('٦', '6')
        .replaceAll('٧', '7')
        .replaceAll('٨', '8')
        .replaceAll('٩', '9');
  }

  String? _replace(String? input, String v) =>
      input?.replaceFirst(v, '').replaceFirst(',', '.');

  /// convert  ISO_8601 duration to dart duration
  /// copied from iso_duration_parser package
  Duration? parseIsoDuration() {
    if (input == null) return null;
    final regExp = RegExp(
        r'^(-)?P(?!$)(\d+(?:[.,]\d+)?Y)?(\d+(?:[.,]\d+)?M)?(\d+(?:[.,]\d+)?W)?(\d+(?:[.,]\d+)?D)?(T(?=\d)(\d+(?:[.,]\d+)?H)?(\d+(?:[.,]\d+)?M)?(\d+(?:[.,]\d+)?S)?)?$');
    final matches = regExp.matchAsPrefix(input!);

    if (matches != null) {
      final y = _replace(matches.group(2), 'Y');
      final m = _replace(matches.group(3), 'M');
      final w = _replace(matches.group(4), 'W');

      final d = _replace(matches.group(5), 'D');
      final hrs = _replace(matches.group(7), 'H');
      final min = _replace(matches.group(8), 'M');
      final sec = _replace(matches.group(9), 'S');

      // additional check if some input was wrongly matched
      if (<String?>[y, m, w, d, hrs, min, sec].any(
        (element) {
          if (element == null) return false;
          if (int.tryParse(element) == null) return true;
          return false;
        },
      )) {
        return null;
      }

      var years = double.parse(y ?? '0');
      var months = double.parse(m ?? '0');
      var weeks = double.parse(w ?? '0');
      var days = double.parse(d ?? '0');
      var hours = double.parse(hrs ?? '0');
      var minutes = double.parse(min ?? '0');
      var seconds = double.parse(sec ?? '0');

      days += years * 365;
      days += months * 30;
      days += weeks * 7;

      final isNegative = matches.group(1) == '-';
      if (isNegative) {
        days *= -1;
        hours *= -1;
        minutes *= -1;
        seconds *= -1;
      }
      return Duration(
        days: days.toInt(),
        hours: hours.toInt(),
        minutes: minutes.toInt(),
        seconds: seconds.toInt(),
      );
    }
    return null;
  }

  /// check the string can be double
  bool get isDouble {
    return double.tryParse(input ?? '') != null;
  }

  /// check the string is null or empty or whitespace
  bool get isNullOrEmptyOrWhiteSpace {
    return input == null || (input ?? '').trim() == '';
  }

  /// check the string is null or empty
  bool get isNullOrEmpty {
    return input == null || input == '';
  }

  /// check string is local egyptian phone
  bool get isLocalEgyptianPhone {
    return RegExp(r'^(01|1)([0-9]{9})$').hasMatch(input ?? '');
  }

  /// check string is international egyptian phone
  bool get isInternationalEgyptianPhone {
    return RegExp(r'^(00201|201|\+201)([0-9]{9})$').hasMatch(input ?? '');
  }

  /// check string is local ksa phone

  bool get isLocalKsaPhone {
    return RegExp(r'^(05)(5|0|3|6|4|9|1|8|7)([0-9]{7})$').hasMatch(input ?? '');
  }

  // check string is international ksa phone
  bool get isInternationalKsaPhone {
    return RegExp(
            r'^(009665|0096605|9665|96605|\+9665|\+96605|05|5)(5|0|3|6|4|9|1|8|7)([0-9]{7})$')
        .hasMatch(input ?? '');
  }

  /// return `true` if the are equals with case matching
  bool equal(String? str) {
    return input == str;
  }

  /// return `true` if the are equals without case matching
  bool equalIgnoreCase(String? str) {
    return input?.toLowerCase() == str?.toLowerCase();
  }

  /// return `Sting` without any spaces
  String? get hardTrim {
    return input?.replaceAll(' ', '');
  }

  /// `queen` will return ['q','u','e','e','n']
  List<String> toChars() {
    final charsList = <String>[];
    for (final char in charsList) {
      charsList.add(char);
    }
    return charsList;
  }

  /// check the string can be DateTime
  bool get isDateTime {
    if (input == null) return false;
    return DateTime.tryParse(input!) != null;
  }

  /// convert `String` to `DateTime` if is possible
  /// else will return null
  DateTime? toDate() {
    if (input != null) return DateTime.tryParse(input!);
    return null;
  }

  /// convert `String` to `double` if is possible
  /// else will return null
  double? toDouble() {
    if (input != null) return double.tryParse(input!);
    return null;
  }

  /// convert `String` to `int` if is possible
  /// else will return null
  int? toInt() {
    if (input != null) return int.tryParse(input!);
    return null;
  }

  /// convert `String` to `num` if is possible
  /// else will return null
  num? toNumber() {
    if (input != null) return num.tryParse(input!);
    return null;
  }
}

extension StringExtensions on String? {
  /// will convert from english numbers to arabic numbers
  String? englishToArabicNumbers() {
    return _Parser(this).englishToArabicNumbers();
  }

  /// will convert from arabic numbers to english numbers
  String? arabicToEnglishNumbers() {
    return _Parser(this).arabicToEnglishNumbers();
  }

  /// convert  ISO_8601 duration to dart duration
  /// copied from iso_duration_parser package
  Duration? parseIsoDuration() {
    return _Parser(this).parseIsoDuration();
  }

  /// check the string can be double
  bool get isDouble => _Parser(this).isDouble;

  /// check the string is null or empty or whitespace
  bool get isNullOrEmptyOrWhiteSpace => _Parser(this).isNullOrEmptyOrWhiteSpace;

  /// check the string is null or empty
  bool get isNullOrEmpty => _Parser(this).isNullOrEmpty;

  /// check string is local egyptian phone
  bool get isLocalEgyptianPhone => _Parser(this).isLocalEgyptianPhone;

  /// check string is international egyptian phone
  bool get isInternationalEgyptianPhone =>
      _Parser(this).isInternationalEgyptianPhone;

  /// check string is local ksa phone

  bool get isLocalKsaPhone => _Parser(this).isLocalKsaPhone;

  // check string is international ksa phone
  bool get isInternationalKsaPhone => _Parser(this).isInternationalKsaPhone;

  /// return `true` if the are equals with case matching
  bool equal(String? str) => _Parser(this).equal(str);

  /// return `true` if the are equals without case matching
  bool equalIgnoreCase(String? str) => _Parser(this).equalIgnoreCase(str);

  /// return `Sting` without any spaces
  String? get hardTrim => _Parser(this).hardTrim;

  /// `queen` will return ['q','u','e','e','n']
  List<String> toChars() => _Parser(this).toChars();

  /// check the string can be DateTime
  bool get isDateTime => _Parser(this).isDateTime;

  /// convert `String` to `DateTime` if is possible
  /// else will return null
  DateTime? toDate() => _Parser(this).toDate();

  /// convert `String` to `double` if is possible
  /// else will return null
  double? toDouble() => _Parser(this).toDouble();

  /// convert `String` to `int` if is possible
  /// else will return null
  int? toInt() => _Parser(this).toInt();

  /// convert `String` to `num` if is possible
  /// else will return null
  num? toNumber() => _Parser(this).toNumber();
}

extension NotNullStringExtensions on String {
  /// will convert from english numbers to arabic numbers
  String englishToArabicNumbers() {
    return _Parser(this).englishToArabicNumbers() ?? '';
  }

  /// will convert from arabic numbers to english numbers
  String arabicToEnglishNumbers() {
    return _Parser(this).arabicToEnglishNumbers() ?? '';
  }

  /// convert  ISO_8601 duration to dart duration
  /// copied from iso_duration_parser package
  Duration parseIsoDuration() {
    var res = _Parser(this).parseIsoDuration();
    if (res == null) {
      throw Exception('$this is not a valid ISO_8601 duration');
    }
    return res;
  }

  /// convert  ISO_8601 duration to dart duration
  /// copied from iso_duration_parser package
  Duration? tryParseIsoDuration() {
    return _Parser(this).parseIsoDuration();
  }
}
