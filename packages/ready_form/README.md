# ReadyForm 

widget that wrap flutter form to simplify working with it

## Features

[x] Validate children 
[x] Scroll to first invalid item if validation failed
[x] Ability to add reveal effect
[x] ProgressButton that work smoothly with it

## usage 

```dart
     return ReadyForm(
      onPostData: () async {
        /// submit your data
      },
      child: ListView(
        children: [
          TextFormField(),
          TextFormField(),
          TextFormField(),
          TextFormField(),
          ProgressButton(child: Text(TR.of(context).login)),
        ],
      ),
    );
```

* as you can see when you press the progress button the form will be submitted after check validations

### so what if you need to submit your form by your self or you don't want to use the `ProgressButton`

> then you have to use `ReadyFormKey`

```dart

final ReadyFormKey formKey=ReadyFormKey();

 Widget build(BuildContext context) {
     return ReadyForm(
      onPostData: () async {
        /// submit your data
      },
      child: ListView(
        children: [
          TextFormField(),
          TextFormField(),
          TextFormField(),
          TextFormField(),
          ElevatedButton(
              onPressed:(){
                  formKey.onSubmit();
              },
              child: Text(TR.of(context).login),
          ),
        ],
      ),
    );
}
```

> you can also use `ReadyForm.of(context)`

## usage 

```dart
     return ReadyForm(
      onPostData: () async {
        /// submit your data
      },
      child: ListView(
        children: [
          TextFormField(),
          TextFormField(),
          TextFormField(),
          TextFormField(),
          Builder(builder: (context) {
              // the context of the builder can now access the parent form
            return ElevatedButton(
              onPressed: () {
                ReadyForm.of(context)!.onSubmit();
              },
              child: Text(TR.of(context).login),
            );
          }),
        ],
      ),
    );
```

## global configuration

you can also configure all forms in your app using `ReadyFormConfig`

## KeyboardActions

there is a widget called `KeyboardActions` witch add three buttons on the top of keyboard when it was opened
`next`  `prev`  `hide keyboard` , these icons are useful in ios as the ios keyboard does not contains a button to hide it

> - ReadyForm by default use this widget but you can disable it globally or in single form
> - You can also use this widget without the form its up to you 

* to make sure this widget works perfect you have to pass your preferred `FocusTraversalPolicy` i suggest `OrderedTraversalPolicy`

and wrap each field with `FocusTraversalOrder`

```dart
FocusTraversalOrder(
  order: NumericFocusOrder(1),
  child: ...
),
```

## validation mode

every form can has the validation mode instead of  flutter [AutoValidateMode] enum
you can use [FormAutoValidateMode] which contains `onSubmit`

* it can be also configured globally

## scrolling to invalid field visibility

without any configuration this package scrolls to the first invalid field when [onSubmit]

but some time you want to override this behavior

to do that you have to use `ensureFieldVisible` property

```dart
EnsureFieldVisible(
  after:(field) async{
     /// this will be called after the default behaviour
  }
  before:(field) async{
     /// this will be called after the default behaviour
  }
);
```

```dart
EnsureFieldVisible.override((field) async{
     /// this will override the default behaviour
  }
);
```

* if your wrap a single field
