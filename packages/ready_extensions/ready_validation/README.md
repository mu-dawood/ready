# how to use

### first if you are using localizations you must add localization delegate to your material app or we will use arabic

```dart
  return MaterialApp(
    localizationsDelegates: [
      ReadyValidationMessages.delegate,
      ...other delegates
    ],
    home: MyApplicationHome(),
  );
```

### if you want to use specified messages across the app you can do so

```dart
ValidationMessagesConfig(
  messages: ReadyValidationMessagesAr(),
  child: // screen or material app
);
```

don't worry every validation has a parameter for custom message

# usage

```dart 
/// its very simple

TextFormField(

    validator: context
        .string()
        .required()
        .notEmpty()
        .hasMaxLength(10)
        .hasMinLength(15)
        .isNumber()
        .greaterThan(10),

  ); 

```

### explanation

1. it get the validator for `String?` values
2. it check if the value is not null and convert the validator to `String` instead of `String?`
   > at this point we can use non nullable string validations
3. checks that string is not empty
4. check the max length of string
5. check the min length of string
6. check if string is number and if it pass transform validator to `num` validator
   > at this point we can use all number validations like `greaterThan`
7. check if the transformed number is greater than 10

8. is any of the validations fails it will return its validation message and will not continue validations

# non context validation
`BuildContext` is used to apply localization and global config localization but some times you need to check if is valid 
this is also supported and this time you don't need to validate required is the value is non nullable as we already know its not null

```dart
 var testValue = "test";
  bool isValid = testValue.isValid(
    validate: (v) => v
        .hasMaxLength(10)
        .hasMinLength(11)
        .isNumber()
        .greaterThan(100),
  );
```

# validators

```dart
  /// string validators
  context.string();

  /// number validators
  context.number();

  /// integer validators
  context.integer();

  /// decimal validators
  context.decimal(); // for doubles

  /// boolean validators
  context.boolean();

   /// dateTime validators
  context.dateTime();

    /// dateTime validators
  context.timeOfDay(); // will be added soon

  /// list validators
  context.list<T>(); 

  /// map validators
  context.map<K,V>(); 

  /// other validators
  context.validatorFor<T>(); 
```

* any  validator contains  these validators plus its own validators
  + required
  + notEqual
  + equal
  + isIn
  + isNotIn
  + validate with
# transforming 

in any step you can transform your validator to another type and it can still be used with field

imagine we created a validator for our `TextFormField` which accepts a validator of type string

so our validator will be

```dart
  context.string();
```

now we need to transform it number validator

```dart
       context
        .string()
        .required() // this to ensure it not null
        .transform((v)=>int.parse(v))
```

now you can use any number validation like `greaterThan` but you cant use `hasMaxLength` as it for string till you transform its again to the string validator

# when & whenNot

```dart
context
        .string()
        .required()
        .hasMaxLength(10)
        .hasMinLength(15)
        .when((x) => false) /// at this point `hasMinLength` is ignored
        .isNumber()
        .greaterThan(10),
  /// so the validations will be
  /// `required` => `hasMaxLength` => `isNumber` => `greaterThan`
```

# Advanced

Some times you want to use your own messages to that you has to create your own delegate and classes

the default delegate look like this

```dart

class _ReadyValidationMessagesDelegate
    extends LocalizationsDelegate<ReadyValidationMessages> {
  const _ReadyValidationMessagesDelegate();

  @override
  Future<ReadyValidationMessages> load(Locale locale) {
    return SynchronousFuture<ReadyValidationMessages>(
        lookupReadyValidationMessages(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en', 'fr', 'ur'].contains(locale.languageCode);

  @override
  bool shouldReload(_ReadyValidationMessagesDelegate old) => false;
}

ReadyValidationMessages lookupReadyValidationMessages(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return ReadyValidationMessagesAr();
    case 'en':
      return ReadyValidationMessagesEn();
    case 'fr':
      return ReadyValidationMessagesFr();
    case 'ur':
      return ReadyValidationMessagesUr();
  }

  throw FlutterError(
      'ReadyValidationMessages.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}

```

you also need to create your custom `ReadyValidationMessages` classes 
now instead of using our delegate use your own

```dart
  return MaterialApp(
    localizationsDelegates: [
      CustomReadyValidationMessages(),
      ...other delegates
    ],
    home: MyApplicationHome(),
  );
```
