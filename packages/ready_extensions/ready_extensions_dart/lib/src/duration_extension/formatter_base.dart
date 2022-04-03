part of duration_extension;

abstract class DurationFormatter {
  String getSeparator();
  String getYears(int years);
  String getMonths(int months);

  String getDays(int days);
  String getWeeks(int weeks);

  String getHours(int hours);

  String getMinutes(int minutes);

  String getSeconds(int seconds);

  String getNow();
}
