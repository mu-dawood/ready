

import 'package:intl/intl.dart' as intl;
import 'simple_localizations.dart';

/// The translations for Arabic (`ar`).
class SimpleLocalizationsAr extends SimpleLocalizations {
  SimpleLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String yearsPlural(int count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'عام واحد',
      two: 'عامين',
      few: '$count أعوام',
      other: '$count عام',
    );
  }

  @override
  String monthsPlural(int count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'شهر واحد',
      two: 'شهرين',
      few: '$count أشهر',
      other: '$count شهر',
    );
  }

  @override
  String daysPlural(int count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'يوم واحد',
      two: 'يومين',
      few: '$count أيام',
      other: '$count يوم',
    );
  }

  @override
  String weeksPlural(int count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'أسبوع واحد',
      two: 'أسبوعين',
      few: '$count أسابيع',
      other: '$count أسبوع',
    );
  }

  @override
  String hoursPlural(int count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'ساعة واحدة',
      two: 'ساعتين',
      few: '$count ساعات',
      other: '$count ساعة',
    );
  }

  @override
  String minutesPlural(int count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'دقيقة واحدة',
      two: 'دقيقتين',
      few: '$count دقائق',
      other: '$count دقيقة',
    );
  }

  @override
  String socondsPlural(int count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'ثانية واحدة',
      two: 'ثانيتين',
      few: '$count ثواني',
      other: '$count ثانية',
    );
  }

  @override
  String get now => 'الآن';

  @override
  String get formatSeperator => ' ، ';

  @override
  String get required => 'عذرا! هذا الحقل مطلوب';

  @override
  String stringMaxLength(String value, int max) {
    return 'يجب أن لا يزيد طول النص عن $max';
  }

  @override
  String stringMinLength(String value, int min) {
    return 'يجب أن لا يقل طول النص عن $min';
  }

  @override
  String stringMustBeInRange(String value, int min, int max) {
    return 'يجب إدخال نص  لايقل طوله عن $min ولا يزيد عن $max';
  }

  @override
  String stringMustBeDateTime(String value) {
    return 'يجب إدخال تاريخ صحيح';
  }

  @override
  String stringMustBeTimeOfDay(String value) {
    return 'يجب إدخال وقت صحيح';
  }

  @override
  String mustBeDateAfter(DateTime value, DateTime after) {
    final intl.DateFormat valueDateFormat = intl.DateFormat.yMMMEd(localeName);
    final String valueString = valueDateFormat.format(value);
    final intl.DateFormat afterDateFormat = intl.DateFormat.yMMMEd(localeName);
    final String afterString = afterDateFormat.format(after);

    return 'يجب إدخال تاريخ لاحق ل $afterString';
  }

  @override
  String mustBeDateBefore(DateTime value, DateTime before) {
    final intl.DateFormat valueDateFormat = intl.DateFormat.yMMMEd(localeName);
    final String valueString = valueDateFormat.format(value);
    final intl.DateFormat beforeDateFormat = intl.DateFormat.yMMMEd(localeName);
    final String beforeString = beforeDateFormat.format(before);

    return 'يجب إدخال تاريخ سابق ل $beforeString';
  }

  @override
  String mustBeTimeOfDayAfter(dynamic value, dynamic after) {
    return 'يجب إدخال وقت لاحق ل $after';
  }

  @override
  String mustBeTimeOfDayBefore(dynamic value, dynamic before) {
    return 'يجب إدخال وقت سابق ل $before';
  }

  @override
  String mustBeDateBetween(dynamic value, DateTime min, DateTime max) {
    final intl.DateFormat minDateFormat = intl.DateFormat.yMMMEd(localeName);
    final String minString = minDateFormat.format(min);
    final intl.DateFormat maxDateFormat = intl.DateFormat.yMMMEd(localeName);
    final String maxString = maxDateFormat.format(max);

    return 'يجب إختيار تاريخ بين $minString و $maxString';
  }

  @override
  String mustBeTimeOfDayBetween(dynamic value, dynamic min, dynamic max) {
    return 'يجب إختيار وقت بين $min و $max';
  }

  @override
  String mustBeNumber(String value) {
    return 'يجب إدخال رقم';
  }

  @override
  String mustBeInteger(String value) {
    return 'يجب إدخال رقم غير عشري';
  }

  @override
  String mustBeDecimal(String value) {
    return 'يجب إدخال رقم عشري';
  }

  @override
  String mustBeGithubUrl(String value) {
    return 'يجب إدخال رابط حساب Github';
  }

  @override
  String mustBeRedditUrl(String value) {
    return 'يجب إدخال رابط حساب Reddit';
  }

  @override
  String mustBeInstagramUrl(String value) {
    return 'يجب إدخال رابط حساب Instagram';
  }

  @override
  String mustBeLinkedinProfile(String value) {
    return 'يجب إدخال رابط حساب Linkedin';
  }

  @override
  String mustBeTwitterUser(String value) {
    return 'يجب إدخال رابط حساب Twitter';
  }

  @override
  String mustBeYoutubeVideoUrl(String value) {
    return 'يجب إدخال رابط لفيديو Youtube';
  }

  @override
  String mustBeFacbookPageOrProfile(String value) {
    return 'يجب إدخال رابط  Facbook';
  }

  @override
  String mustBeSnapchatProfile(String value) {
    return 'يجب إدخال رابط حساب Snapchat';
  }

  @override
  String mustBeUrl(String value) {
    return 'يجب إدخال رابط صحيح';
  }

  @override
  String mustBeEmail(String value) {
    return 'يجب إدخال بريد إلكتروني صحيح';
  }

  @override
  String mustBeHexColor(String value) {
    return 'يجب إدخال لون صحيح مثل (#ff0000)';
  }

  @override
  String mustBeLocalEgyptianPhone(String value) {
    return 'يجب إدخال رقم مصري محلي مثل (015xxxxxxxx)';
  }

  @override
  String mustBeInternationalEgyptianPhone(String value) {
    return 'يجب إدخال رقم مصري بالصيغة الدولية مثل (2015xxxxxxxx)';
  }

  @override
  String mustBeLocalKsaPhone(String value) {
    return 'يجب إدخال رقم سعودي محلي مثل (05xxxxxxxx)';
  }

  @override
  String mustBeInternationalKsaPhone(String value) {
    return 'يجب إدخال رقم سعودي بالصيغة الدولية مثل (96605xxxxxxxx)';
  }
}
