# Complete list that

 - Handle pull to refresh
 - Infinite scroll
 - Making grids
 

# usage

## First create controller

```dart

class ReadyListCubit extends Cubit<ReadyListState<FakeItem>> implements ReadyListController<FakeItem> {
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
  
}

```

# if you want to use your own class or change notifier

```dart
class ReadyListCubit extends ChangeNotifier implements ReadyRemoteController<FakeItem> {
  ReadyListState<FakeItem> _state = ReadyListState<FakeItem>();
  @override
  ReadyListState<FakeItem> get state => _state;

  final StreamController<ReadyListState<FakeItem>> _controller = StreamController<ReadyListState<FakeItem>>.broadcast();
  @override
  Stream<ReadyListState<FakeItem>> get stream => _controller.stream;

  @override
  void emit(ReadyListState<FakeItem> state) {
    _state = state;
    _controller.add(state);
  }

  @override
  Future<ReadyListState<FakeItem>> loadData({
    ICancelToken? cancelToken,
    required int skip,
    required int pageSize,
  }) async {
    /// Fetch your data
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
