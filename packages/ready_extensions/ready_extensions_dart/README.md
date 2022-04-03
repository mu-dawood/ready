# String extensions
* englishToArabicNumbers

```dart
  print("number 123".englishToArabicNumbers()); \\ number ١٢٣
```

* arabicToEnglishNumbers

```dart
  print("number ١٢٣".arabicToEnglishNumbers()); \\ number 123
```

* isDouble

```dart
  print("123.0".isDouble); \\ true
  print("123".isDouble); \\ true
  print("123s".isDouble); \\ false
```

* isNullOrEmptyOrWhiteSpace

```dart
  print("text".isNullOrEmptyOrWhiteSpace); \\ false
  print("".isNullOrEmptyOrWhiteSpace); \\ true
  print(" ".isNullOrEmptyOrWhiteSpace); \\ true
  print(null.isNullOrEmptyOrWhiteSpace); \\ true
```

* isNullOrEmpty

```dart
  print("text".isNullOrEmpty); \\ false
  print("".isNullOrEmpty); \\ true
  print(" ".isNullOrEmpty); \\ false
  print(null.isNullOrEmpty); \\ true
```

* isLocaleEgyptianPhone

```dart
  print("01555555555".isLocaleEgyptianPhone); \\ true
  print("1555555555".isLocaleEgyptianPhone); \\ true
  print("201555555555".isLocaleEgyptianPhone); \\ false
  print("05555555555".isLocaleEgyptianPhone); \\ false
  print("text".isLocaleEgyptianPhone); \\ false
```

* isInternationalEgyptianPhone

```dart
  print("01555555555".isInternationalEgyptianPhone); \\ false
  print("1555555555".isInternationalEgyptianPhone); \\ false
  print("201555555555".isInternationalEgyptianPhone); \\ true
  print("+201555555555".isInternationalEgyptianPhone); \\ true
  print("00201555555555".isInternationalEgyptianPhone); \\ true
  print("05555555555".isInternationalEgyptianPhone); \\ false
  print("text".isInternationalEgyptianPhone); \\ false
```

* isLocaleKsaPhone

```dart
  print("0555555555".isLocaleKsaPhone); \\ true
  print("555555555".isLocaleKsaPhone); \\ true
  print("966555555555".isLocaleKsaPhone); \\ false
  print("01555555555".isLocaleKsaPhone); \\ false
  print("text".isLocaleKsaPhone); \\ false
```

* isInternationalKsaPhone

```dart
  print("0555555555".isInternationalKsaPhone); \\ false
  print("555555555".isInternationalKsaPhone); \\ false
  print("966555555555".isInternationalKsaPhone); \\ true
  print("+966555555555".isInternationalKsaPhone); \\ true
  print("00966555555555".isInternationalKsaPhone); \\ true
  print("01555555555".isInternationalKsaPhone); \\ false
  print("text".isInternationalKsaPhone); \\ false
```

* toTextWidget
converts string to text widget

## [Boolean extensions](https://github.com/mo-ah-dawood/simple/wiki/Boolean-extentions)

## [Color extensions](https://github.com/mo-ah-dawood/simple/wiki/Color-extentions)

## [Double extensions](https://github.com/mo-ah-dawood/simple/wiki/Double-extentions)

## [Duration extensions](https://github.com/mo-ah-dawood/simple/wiki/Duration-extentions)

## [Iterable extensions](https://github.com/mo-ah-dawood/simple/wiki/Iterable-extentions)

## [Timer extensions](https://github.com/mo-ah-dawood/simple/wiki/Timer-extentions)
