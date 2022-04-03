![Method Draw Image](https://user-images.githubusercontent.com/31937782/111893827-17e52300-8a0e-11eb-8284-818363d9d6e4.png)

## [String extensions](https://github.com/mo-ah-dawood/simple/wiki/String-extensions)

## [Boolean extensions](https://github.com/mo-ah-dawood/simple/wiki/Boolean-extentions)

## [Color extensions](https://github.com/mo-ah-dawood/simple/wiki/Color-extentions)

## [Context extensions](https://github.com/mo-ah-dawood/simple/wiki/Context-extentions)

## [Double extensions](https://github.com/mo-ah-dawood/simple/wiki/Double-extentions)

## [Duration extensions](https://github.com/mo-ah-dawood/simple/wiki/Duration-extentions)

## [Iterable extensions](https://github.com/mo-ah-dawood/simple/wiki/Iterable-extentions)

## [Timer extensions](https://github.com/mo-ah-dawood/simple/wiki/Timer-extentions)
## [Social links](https://github.com/mo-ah-dawood/simple/wiki/social-links)
## [Validation](https://github.com/mo-ah-dawood/simple/wiki/Validation)

## Localization

- some extensions need localization so to use localization extensions you have to add `SimpleLocalizations.delegate` in your `localizationsDelegates` 

```dart
  return MaterialApp(
    localizationsDelegates: [
      SimpleLocalizations.delegate,
      ...other delegates
    ],
    supportedLocales: SimpleLocalizations.supportedLocales,
    home: MyApplicationHome(),
  );
```
