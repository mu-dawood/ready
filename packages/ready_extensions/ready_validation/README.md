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
1- it get the validator for `String?` values
2- it check if the value is not null and convert the validator to `String` instead of `String?`

   > at this point we can use non nullable string validations
3- checks that string is not empty
4- check the max length of string
4- check the min length of string
4- check if string is number and if it pass transform validator to `num` validator
   > at this point we can use all number validations like `greaterThan`
5- check if the transformed number is greater than 10

* is any of the validations fails it will return its validation message and will not continue validations

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
* required
* notEqual
* equal
* isIn
* isNotIn
* validate with
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
        .when((x) => x.isNotEmpty) /// at this point if string is not empty it will validate next lines or it will return null so that the FormField read it as valid
        .hasMaxLength(10)
        .hasMinLength(15)
        .isNumber()
        .greaterThan(10),
```
