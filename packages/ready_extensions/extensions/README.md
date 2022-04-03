Before you start if you need to use localizations you have to add package delegate to your material app

```dart
  return MaterialApp(
    localizationsDelegates: [
      ReadyExtensionLocalizations.delegate,
      ...other delegates
    ],
    home: MyApplicationHome(),
  );
```

-> supported locales are `ar`  `en`  `fr`  `ur`

-> if you need to add other language feel free to send its arb file like this [one](https://github.com/mo-ah-dawood/ready/blob/main/packages/ready_extensions/extensions/lib/l10n/app_en.arb)

# how to use

1- all extensions in [ready_extensions_dart](https://pub.dev/packages/ready_extensions_dart) are included
2- in addition to it there another extensions

## duration extension

in package `ready_extensions_dart` there is an extension called format for Duration
now you can use translated messages

```dart
  print(Duration(minutes).formatWith(context))
```

## color extensions

```dart

 /// This will return the lighter color of current
  /// amount must be between 0 & 1
  Color lighten([double amount = 0.1]);

  /// This will return the darker color of current
  /// amount must be between 0 & 1
  Color darken([double amount = 0.1]);
```

## DateTime extensions

```dart
 /// Format date with DateFormat.d intl format
  String d(BuildContext context);

  /// Format date with DateFormat.E intl format
  String E(BuildContext context);

  /// Format date with DateFormat.EEEE intl format
  String EEEE(BuildContext context);

  /// Format date with DateFormat.LLL intl format
  String LLL(BuildContext context);

  /// Format date with DateFormat.LLLL intl format
  String LLLL(BuildContext context);

  /// Format date with DateFormat.M intl format
  String M(BuildContext context);

  /// Format date with DateFormat.Md intl format
  String Md(BuildContext context);

  /// Format date with DateFormat.MEd intl format
  String MEd(BuildContext context);

  /// Format date with DateFormat.MMM intl format
  String MMM(BuildContext context);

  /// Format date with DateFormat.MMMd intl format
  String MMMd(BuildContext context);

  /// Format date with DateFormat.MMMEd intl format
  String MMMEd(BuildContext context);

  /// Format date with DateFormat.MMMM intl format
  String MMMM(BuildContext context)

  /// Format date with DateFormat.MMMd intl format
  String MMMMd(BuildContext context);

  /// Format date with DateFormat.MMMMEEEEd intl format
  String MMMMEEEEd(BuildContext context);

  /// Format date with DateFormat.QQQ intl format
  String QQQ(BuildContext context);

  /// Format date with DateFormat.QQQQ intl format
  String QQQQ(BuildContext context);

  /// Format date with DateFormat.y intl format
  String y(BuildContext context);

  /// Format date with DateFormat.yM intl format
  String yM(BuildContext context);

  /// Format date with DateFormat.yMd intl format
  String yMd(BuildContext context);

  /// Format date with DateFormat.yMEd intl format
  String yMEd(BuildContext context);

  /// Format date with DateFormat.yMMM intl format
  String yMMM(BuildContext context);

  /// Format date with DateFormat.yMMMd intl format
  String yMMMd(BuildContext context) ;

  /// Format date with DateFormat.yMMMEd intl format
  String yMMMEd(BuildContext context);

  /// Format date with DateFormat.yMMMM intl format
  String yMMMM(BuildContext context);

  /// Format date with DateFormat.yMMMMd intl format
  String yMMMMd(BuildContext context);

  /// Format date with DateFormat.yMMMMEEEEd intl format
  String yMMMMEEEEd(BuildContext context);

  /// Format date with DateFormat.yQQQ intl format
  String yQQQ(BuildContext context);

  /// Format date with DateFormat.yQQQQ intl format
  String yQQQQ(BuildContext context) ;

  /// Format date with DateFormat.H intl format
  String H(BuildContext context);

  /// Format date with DateFormat.Hm intl format
  String Hm(BuildContext context);

  /// Format date with DateFormat.Hms intl format
  String Hms(BuildContext context);

  /// Format date with DateFormat.j intl format
  String j(BuildContext context);

  /// Format date with DateFormat.jm intl format
  String jm(BuildContext context);

  /// Format date with DateFormat.jms intl format
  String jms(BuildContext context);

  /// Format date with DateFormat.m intl format
  String m(BuildContext context);

  /// Format date with DateFormat.ms intl format
  String ms(BuildContext context);

  /// Format date with DateFormat.s intl format
  String s(BuildContext context);

  /// Format date with DateFormat(patterns) intl format
  String format(BuildContext context, String pattern) ;;

  /// If the date did not exceed 24 hours will format jms else will format yMMMEd
  String format24(BuildContext context);
```

## string extensions

```dart
 /// will parse string to time of days
  /// example 19:16 or 07:18 pm
  TimeOfDay? toTimeOfDay();

  /// check the string can be timeousDay
  bool get isTimeOfDay;

  /// converts string to text widget
  Text toTextWidget();
```
