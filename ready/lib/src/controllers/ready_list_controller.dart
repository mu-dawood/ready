part of controllers;

abstract class ReadyListController<T> {
  /// The current state
  ReadyListState<T> get state;

  /// The stream to listen please use broadcast stream to allow multiple listeners
  Stream<ReadyListState<T>> get stream;

  /// emitting new state to stream
  void emit(ReadyListState<T> state);
}

extension CurrentDataExt<T> on CurrentData<T> {
  CurrentData<T> add(Iterable<T> items) {
    return copyWith(
      items: [...this.items, ...items],
      totalCount: totalCount + items.length,
    );
  }

  CurrentData<T> insert(Iterable<T> items) {
    return copyWith(
      items: [...items, ...this.items],
      totalCount: totalCount + items.length,
    );
  }

  CurrentData<T> remove(Iterable<T> items) {
    var oldLength = this.items.length;
    var newItems = this.items.where((element) => !items.contains(element));
    var newLength = newItems.length;
    var removedLength = oldLength - newLength;
    return copyWith(
      items: newItems,
      totalCount: totalCount - removedLength,
    );
  }

  CurrentData<T> removeWhere(bool Function(T element) test) {
    var oldLength = items.length;
    var newItems = items.where((element) => !test(element));
    var newLength = newItems.length;
    var removedLength = oldLength - newLength;
    return copyWith(
      items: newItems,
      totalCount: totalCount - removedLength,
    );
  }

  CurrentData<T> removeAt(List<int> indexes) {
    var oldLength = items.length;
    List<T> newItems = [];
    for (var i = 0; i < items.length; i++) {
      if (!indexes.contains(i)) {
        newItems.add(items.elementAt(i));
      }
    }
    var newLength = newItems.length;
    var removedLength = oldLength - newLength;
    return copyWith(
      items: newItems,
      totalCount: totalCount - removedLength,
    );
  }

  CurrentData<T> updateItems(T Function(T) mapper) {
    return copyWith(items: items.map(mapper));
  }

  CurrentData<T> clear() {
    return copyWith(
      items: [],
      totalCount: totalCount - items.length,
    );
  }
}

extension ReadyListStateExt<T> on ReadyListState<T> {
  ReadyListState<T> add(Iterable<T> items) {
    return map(
      isLoaded: (state) {
        return state.copyWith(
          items: [...state.items, ...items],
          totalCount: state.totalCount + items.length,
        );
      },
      initializing: (state) {
        return ReadyListState.isLoaded(
          items: items,
          totalCount: items.length,
          args: state.args,
        );
      },
      requestFirstLoading: (state) {
        return state.copyWith(currentData: state.currentData?.add(items));
      },
      error: (ErrorState<T> state) {
        return state.copyWith(
          currentData: state.currentData?.add(items),
        );
      },
      isLoadingFirst: (FirstLoading<T> state) {
        return state.copyWith(
          currentData: state.currentData?.add(items),
        );
      },
      isLoadingNext: (LoadingNext<T> state) {
        return state.copyWith(
          currentData: state.currentData.add(items),
        );
      },
      isRefreshing: (Refreshing<T> state) {
        return state.copyWith(
          currentData: state.currentData.add(items),
        );
      },
      requestNext: (RequestNext<T> state) {
        return state.copyWith(
          currentData: state.currentData.add(items),
        );
      },
      requestRefresh: (RequestRefresh<T> state) {
        return state.copyWith(
          currentData: state.currentData.add(items),
        );
      },
    );
  }

  ReadyListState<T> insert(Iterable<T> items) {
    return map(
      isLoaded: (state) {
        return state.copyWith(
          items: [...items, ...state.items],
          totalCount: state.totalCount + items.length,
        );
      },
      initializing: (state) {
        return ReadyListState.isLoaded(
          items: items,
          totalCount: items.length,
          args: args,
        );
      },
      requestFirstLoading: (state) {
        return state.copyWith(
          currentData: state.currentData?.insert(items),
        );
      },
      error: (ErrorState<T> state) {
        return state.copyWith(
          currentData: state.currentData?.insert(items),
        );
      },
      isLoadingFirst: (FirstLoading<T> state) {
        return state.copyWith(
          currentData: state.currentData?.insert(items),
        );
      },
      isLoadingNext: (LoadingNext<T> state) {
        return state.copyWith(
          currentData: state.currentData.insert(items),
        );
      },
      isRefreshing: (Refreshing<T> state) {
        return state.copyWith(
          currentData: state.currentData.insert(items),
        );
      },
      requestNext: (RequestNext<T> state) {
        return state.copyWith(
          currentData: state.currentData.insert(items),
        );
      },
      requestRefresh: (RequestRefresh<T> state) {
        return state.copyWith(
          currentData: state.currentData.insert(items),
        );
      },
    );
  }

  ReadyListState<T> remove(Iterable<T> items) {
    return map(
      isLoaded: (state) {
        var oldLength = state.items.length;
        var newItems = state.items.where((element) => !items.contains(element));
        var newLength = newItems.length;
        var removedLength = oldLength - newLength;
        return state.copyWith(
          items: newItems,
          totalCount: state.totalCount - removedLength,
        );
      },
      initializing: (state) => state,
      requestFirstLoading: (state) {
        return state.copyWith(
          currentData: state.currentData?.remove(items),
        );
      },
      error: (ErrorState<T> state) => state.copyWith(
        currentData: state.currentData?.remove(items),
      ),
      isLoadingFirst: (FirstLoading<T> state) {
        return state.copyWith(
          currentData: state.currentData?.remove(items),
        );
      },
      isLoadingNext: (LoadingNext<T> state) {
        return state.copyWith(
          currentData: state.currentData.remove(items),
        );
      },
      isRefreshing: (Refreshing<T> state) {
        return state.copyWith(
          currentData: state.currentData.remove(items),
        );
      },
      requestNext: (RequestNext<T> state) {
        return state.copyWith(
          currentData: state.currentData.remove(items),
        );
      },
      requestRefresh: (RequestRefresh<T> state) {
        return state.copyWith(
          currentData: state.currentData.remove(items),
        );
      },
    );
  }

  ReadyListState<T> removeWhere(bool Function(T element) test) {
    return map(
      isLoaded: (state) {
        var oldLength = state.items.length;
        var newItems = state.items.where((element) => !test(element));
        var newLength = newItems.length;
        var removedLength = oldLength - newLength;
        return state.copyWith(
          items: newItems,
          totalCount: state.totalCount - removedLength,
        );
      },
      initializing: (state) => state,
      requestFirstLoading: (state) {
        return state.copyWith(
          currentData: state.currentData?.removeWhere(test),
        );
      },
      error: (ErrorState<T> state) => state,
      isLoadingFirst: (FirstLoading<T> state) {
        return state.copyWith(
          currentData: state.currentData?.removeWhere(test),
        );
      },
      isLoadingNext: (LoadingNext<T> state) {
        return state.copyWith(
          currentData: state.currentData.removeWhere(test),
        );
      },
      isRefreshing: (Refreshing<T> state) {
        return state.copyWith(
          currentData: state.currentData.removeWhere(test),
        );
      },
      requestNext: (RequestNext<T> state) {
        return state.copyWith(
          currentData: state.currentData.removeWhere(test),
        );
      },
      requestRefresh: (RequestRefresh<T> state) {
        return state.copyWith(
          currentData: state.currentData.removeWhere(test),
        );
      },
    );
  }

  ReadyListState<T> removeAt(List<int> indexes) {
    return map(
      isLoaded: (state) {
        var oldLength = state.items.length;
        List<T> newItems = [];
        for (var i = 0; i < state.items.length; i++) {
          if (!indexes.contains(i)) {
            newItems.add(state.items.elementAt(i));
          }
        }
        var newLength = newItems.length;
        var removedLength = oldLength - newLength;
        return state.copyWith(
          items: newItems,
          totalCount: state.totalCount - removedLength,
        );
      },
      initializing: (state) => state,
      requestFirstLoading: (state) {
        return state.copyWith(
          currentData: state.currentData?.removeAt(indexes),
        );
      },
      error: (ErrorState<T> state) => state,
      isLoadingFirst: (FirstLoading<T> state) {
        return state.copyWith(
          currentData: state.currentData?.removeAt(indexes),
        );
      },
      isLoadingNext: (LoadingNext<T> state) {
        return state.copyWith(
          currentData: state.currentData.removeAt(indexes),
        );
      },
      isRefreshing: (Refreshing<T> state) {
        return state.copyWith(
          currentData: state.currentData.removeAt(indexes),
        );
      },
      requestNext: (RequestNext<T> state) {
        return state.copyWith(
          currentData: state.currentData.removeAt(indexes),
        );
      },
      requestRefresh: (RequestRefresh<T> state) {
        return state.copyWith(
          currentData: state.currentData.removeAt(indexes),
        );
      },
    );
  }

  ReadyListState<T> updateItems(T Function(T) mapper) {
    return map(
      isLoaded: (state) {
        return state.copyWith(items: state.items.map(mapper));
      },
      initializing: (state) => state,
      requestFirstLoading: (state) {
        return state.copyWith(
          currentData: state.currentData?.updateItems(mapper),
        );
      },
      error: (ErrorState<T> state) => state.copyWith(
        currentData: state.currentData?.updateItems(mapper),
      ),
      isLoadingFirst: (FirstLoading<T> state) {
        return state.copyWith(
          currentData: state.currentData?.updateItems(mapper),
        );
      },
      isLoadingNext: (LoadingNext<T> state) {
        return state.copyWith(
          currentData: state.currentData.updateItems(mapper),
        );
      },
      isRefreshing: (Refreshing<T> state) {
        return state.copyWith(
          currentData: state.currentData.updateItems(mapper),
        );
      },
      requestNext: (RequestNext<T> state) {
        return state.copyWith(
          currentData: state.currentData.updateItems(mapper),
        );
      },
      requestRefresh: (RequestRefresh<T> state) {
        return state.copyWith(
          currentData: state.currentData.updateItems(mapper),
        );
      },
    );
  }

  ReadyListState<T> clear() {
    return map(
      isLoaded: (state) {
        return state.copyWith(
          items: [],
          totalCount: state.totalCount - state.items.length,
        );
      },
      initializing: (state) => state,
      requestFirstLoading: (state) {
        return state.copyWith(
          currentData: state.currentData?.clear(),
        );
      },
      error: (ErrorState<T> state) => state.copyWith(
        currentData: state.currentData?.clear(),
      ),
      isLoadingFirst: (FirstLoading<T> state) {
        return state.copyWith(
          currentData: state.currentData?.clear(),
        );
      },
      isLoadingNext: (LoadingNext<T> state) {
        return state.copyWith(
          currentData: state.currentData.clear(),
        );
      },
      isRefreshing: (Refreshing<T> state) {
        return state.copyWith(
          currentData: state.currentData.clear(),
        );
      },
      requestNext: (RequestNext<T> state) {
        return state.copyWith(
          currentData: state.currentData.clear(),
        );
      },
      requestRefresh: (RequestRefresh<T> state) {
        return state.copyWith(
          currentData: state.currentData.clear(),
        );
      },
    );
  }
}

extension ReadyListControllerExt<T> on ReadyListController<T> {
  void addItem(T item) {
    emit(state.add([item]));
  }

  void addItems(Iterable<T> items) {
    emit(state.add(items));
  }

  void insertItem(T item) {
    emit(state.insert([item]));
  }

  void insertItems(Iterable<T> items) {
    emit(state.insert(items));
  }

  void removeItem(T item) {
    emit(state.remove([item]));
  }

  void removeItems(Iterable<T> items) {
    emit(state.remove(items));
  }

  void removeItemAt(int index) {
    emit(state.removeAt([index]));
  }

  void removeItemsAt(List<int> indexes) {
    emit(state.removeAt(indexes));
  }

  void removeWhere(bool Function(T) test) {
    emit(state.removeWhere(test));
  }

  void updateItems(T Function(T) test) {
    emit(state.updateItems(test));
  }

  void clear() {
    emit(state.clear());
  }
}
