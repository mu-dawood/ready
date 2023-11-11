# Complete list that
 - Handle pull to refresh
 - Infinite scroll
 - Making grids
 

# usage


## First create controller

```dart

class ReadyListCubit extends DefaultReadyRemoteCubit<FakeItem> {
  ReadyListCubit() : super(ReadyListState.initial());

  @override
  Future<RemoteResult<FakeItem>> loadData(int skip, int? pageSize,
      [ICancelToken? cancelToken]) async {
    var list = await FakeRepo.asyncList(pageSize ?? 20);
    return RemoteResult.success(list, 100);
  }
}

```


# Some times you need to use stage-management rather than bloc
# if so see this example of how to use ValueNotifier as statemangement
```dart

class OtherController<T> extends ValueNotifier<ReadyListState<FakeItem>> {
  DefaultReadyListController controller =
      DefaultReadyListController(ReadyListState.initial());

  OtherController(ReadyListState<FakeItem> value) : super(value);

  @override
  void notifyListeners() {
    controller.setState(value);
    super.notifyListeners();
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }
}

```

## List
```dart
return ReadyList.list(
  key: Key(DateTime.now().toIso8601String()),
  buildItem: (FakeItem? item, int index) {
    return _buildItem(item, index);
  },
  controller: ReadyListCubit(),
);
```

## Grid

```dart
return ReadyList.grid(
  gridDelegate: Grids.columns_2,
  buildItem: (FakeItem? item, int index) {
    /// build item
  },
  controller: ReadyListCubit(),
);
```


## Slivers

```dart
return ReadyList.slivers(
  controller: ReadyListCubit(),
  slivers: (ReadyListState<dynamic> state) {
    /// build your own slivers
  },
);
```


Property | Description  | Nullable
-- | ------ | -
scrollController |  List scroll controller | ✓
controller |  The list state controller | 
keepAlive |  Whether to keep a live or not | 
headerSlivers |  Slivers at the top of the list or grid | ✓
footerSlivers |  Slivers at the end | ✓
innerFooterSlivers |  Sliver at the end but before the infinite loading| ✓
filterItems |  Filter the list items , this will not affect the list of the controller | ✓
placeholdersConfig | Config for placeholders when list is empty or has error | ✓
allowRefresh | whether to allow pull to refresh or not | ✓
allowLoadNext |  whether to allow infinite scroll or not | ✓
noMoreText | The text to displayed when no more items | ✓
loadMoreText | The text to display when  items loaded but not fill the screen | ✓
padding | padding of the list | ✓
reverse | whether to reverse the list or not | ✓
showNoMoreText | if false we will not show 'No more text' at the end of the list | ✓
shimmerScopeGradient | gradient of shimmer scope | ✓
allowFakeItems | if this is true the the item that passed to builder item may be null, useful to display shimmer | ✓
shrinkWrap | whether to shrink-wrap or not | ✓
axis | axis of the list | ✓
physics | physics of the list | ✓
topLevelFooterSlivers | The first items in the list | ✓
topLevelHeaderSlivers | The last items in the list | ✓
pageSize |  page size to be passed to controller loadData| ✓


# Global config

> you can config your all list with global config

```dart
ReadyListConfig(
  showNoMoreText: false,
  child: MaterialApp(),
)
```