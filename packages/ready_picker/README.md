# usage
* First you need to add [ready](https://pub.dev/packages/ready) package to your app

* create `ReadyListController`

```dart
class ReadyListCubit extends Cubit<ReadyListState<FakeItem>> implements ReadyListController<FakeItem> with ReadyPickerController {
  ReadyListCubit() : super(const ReadyListState.firstState());
  /// if you don't need to use loading features you can return null
  /// ListLoadingHandler<FakeItem>? get handler =>null
  @override
  ListLoadingHandler<FakeItem>? get handler => DefaultListLoadingHandler(
        loadData: (skip, pageSize, cancelToken) async {
           /// Fetch your data
        },
        controller: this,
      );

  @override
  bool checkSelected(String left, String right) {
    return left == right;
  }

  @override
  String getDisplay(BuildContext context, String item) {
    return item;
  }
}
```

* now you can use this controller 

```dart 
ReadyPicker(

    controller: context.read<ReadyListCubit>(),
    onSaved: ///...

 )

```

# Note
* its up to you how you create your controller package accept any controller that implements `ReadyListController` with `ReadyPickerController`
* `ReadyPickerController` is mixin of `ReadyListController` so you can use the same instance of `ReadyListController` with a picker or ReadyList
# Search 
if you want to add search box to the top of items 
override the optional method getSearchOptions

```dart
@override
  SearchOptions<T>? getSearchOptions(BuildContext context) {
    return SearchOptions<T>(
      callback: (String? value) {
          /// its up to you how to make your search
          /// example emit(ReadyListState.loaded(items:[1,2,3],total:3))
      },
    );
  }
```
