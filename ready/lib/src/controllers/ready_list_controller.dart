part of controllers;

abstract class ReadyListController<T> {
  /// The current state
  ReadyListState<T> get state;

  /// The stream to listen please use broadcast stream to allow multiple listeners
  Stream<ReadyListState<T>> get stream;

  /// emitting new state to stream
  void emit(ReadyListState<T> state);
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
        return ReadyListState.isLoaded(items: items, totalCount: items.length);
      },
      requestFirstLoading: (state) {
        return state.copyWith(previousState: state.previousState?.add(items));
      },
      error: (ErrorState<T> state) {
        return ReadyListState.isLoaded(items: items, totalCount: items.length);
      },
      isLoadingFirst: (FirstLoading<T> state) {
        return state.copyWith(
            previousState:
                state.previousState().add(items) as RequestFirstLoading<T>);
      },
      isLoadingNext: (LoadingNext<T> state) {
        var previous = state.previousState();
        return state.copyWith(
          previousState: previous.copyWith(
            previousState: previous.previousState().add(items) as Loaded<T>,
          ),
        );
      },
      isRefreshing: (Refreshing<T> state) {
        var previous = state.previousState();
        return state.copyWith(
          previousState: previous.copyWith(
            previousState: previous.previousState().add(items) as Loaded<T>,
          ),
        );
      },
      requestNext: (RequestNext<T> state) {
        var previous = state.previousState();
        return state.copyWith(
          previousState: previous.add(items) as Loaded<T>,
        );
      },
      requestRefresh: (RequestRefresh<T> state) {
        var previous = state.previousState();
        return state.copyWith(
          previousState: previous.add(items) as Loaded<T>,
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
        return ReadyListState.isLoaded(items: items, totalCount: items.length);
      },
      requestFirstLoading: (state) {
        return state.copyWith(
            previousState: state.previousState?.insert(items));
      },
      error: (ErrorState<T> state) {
        return ReadyListState.isLoaded(items: items, totalCount: items.length);
      },
      isLoadingFirst: (FirstLoading<T> state) {
        return state.copyWith(
            previousState:
                state.previousState().insert(items) as RequestFirstLoading<T>);
      },
      isLoadingNext: (LoadingNext<T> state) {
        var previous = state.previousState();
        return state.copyWith(
          previousState: previous.copyWith(
            previousState: previous.previousState().insert(items) as Loaded<T>,
          ),
        );
      },
      isRefreshing: (Refreshing<T> state) {
        var previous = state.previousState();
        return state.copyWith(
          previousState: previous.copyWith(
            previousState: previous.previousState().insert(items) as Loaded<T>,
          ),
        );
      },
      requestNext: (RequestNext<T> state) {
        var previous = state.previousState();
        return state.copyWith(
          previousState: previous.insert(items) as Loaded<T>,
        );
      },
      requestRefresh: (RequestRefresh<T> state) {
        var previous = state.previousState();
        return state.copyWith(
          previousState: previous.insert(items) as Loaded<T>,
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
            previousState: state.previousState?.remove(items));
      },
      error: (ErrorState<T> state) => state,
      isLoadingFirst: (FirstLoading<T> state) {
        return state.copyWith(
            previousState:
                state.previousState().remove(items) as RequestFirstLoading<T>);
      },
      isLoadingNext: (LoadingNext<T> state) {
        var previous = state.previousState();
        return state.copyWith(
          previousState: previous.copyWith(
            previousState: previous.previousState().remove(items) as Loaded<T>,
          ),
        );
      },
      isRefreshing: (Refreshing<T> state) {
        var previous = state.previousState();
        return state.copyWith(
          previousState: previous.copyWith(
            previousState: previous.previousState().remove(items) as Loaded<T>,
          ),
        );
      },
      requestNext: (RequestNext<T> state) {
        var previous = state.previousState();
        return state.copyWith(
          previousState: previous.remove(items) as Loaded<T>,
        );
      },
      requestRefresh: (RequestRefresh<T> state) {
        var previous = state.previousState();
        return state.copyWith(
          previousState: previous.remove(items) as Loaded<T>,
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
            previousState: state.previousState?.removeWhere(test));
      },
      error: (ErrorState<T> state) => state,
      isLoadingFirst: (FirstLoading<T> state) {
        return state.copyWith(
            previousState: state.previousState().removeWhere(test)
                as RequestFirstLoading<T>);
      },
      isLoadingNext: (LoadingNext<T> state) {
        var previous = state.previousState();
        return state.copyWith(
          previousState: previous.copyWith(
            previousState:
                previous.previousState().removeWhere(test) as Loaded<T>,
          ),
        );
      },
      isRefreshing: (Refreshing<T> state) {
        var previous = state.previousState();
        return state.copyWith(
          previousState: previous.copyWith(
            previousState:
                previous.previousState().removeWhere(test) as Loaded<T>,
          ),
        );
      },
      requestNext: (RequestNext<T> state) {
        var previous = state.previousState();
        return state.copyWith(
          previousState: previous.removeWhere(test) as Loaded<T>,
        );
      },
      requestRefresh: (RequestRefresh<T> state) {
        var previous = state.previousState();
        return state.copyWith(
          previousState: previous.removeWhere(test) as Loaded<T>,
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
            previousState: state.previousState?.removeAt(indexes));
      },
      error: (ErrorState<T> state) => state,
      isLoadingFirst: (FirstLoading<T> state) {
        return state.copyWith(
            previousState: state.previousState().removeAt(indexes)
                as RequestFirstLoading<T>);
      },
      isLoadingNext: (LoadingNext<T> state) {
        var previous = state.previousState();
        return state.copyWith(
          previousState: previous.copyWith(
            previousState:
                previous.previousState().removeAt(indexes) as Loaded<T>,
          ),
        );
      },
      isRefreshing: (Refreshing<T> state) {
        var previous = state.previousState();
        return state.copyWith(
          previousState: previous.copyWith(
            previousState:
                previous.previousState().removeAt(indexes) as Loaded<T>,
          ),
        );
      },
      requestNext: (RequestNext<T> state) {
        var previous = state.previousState();
        return state.copyWith(
          previousState: previous.removeAt(indexes) as Loaded<T>,
        );
      },
      requestRefresh: (RequestRefresh<T> state) {
        var previous = state.previousState();
        return state.copyWith(
          previousState: previous.removeAt(indexes) as Loaded<T>,
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
            previousState: state.previousState?.updateItems(mapper));
      },
      error: (ErrorState<T> state) => state,
      isLoadingFirst: (FirstLoading<T> state) {
        return state.copyWith(
            previousState: state.previousState().updateItems(mapper)
                as RequestFirstLoading<T>);
      },
      isLoadingNext: (LoadingNext<T> state) {
        var previous = state.previousState();
        return state.copyWith(
          previousState: previous.copyWith(
            previousState:
                previous.previousState().updateItems(mapper) as Loaded<T>,
          ),
        );
      },
      isRefreshing: (Refreshing<T> state) {
        var previous = state.previousState();
        return state.copyWith(
          previousState: previous.copyWith(
            previousState:
                previous.previousState().updateItems(mapper) as Loaded<T>,
          ),
        );
      },
      requestNext: (RequestNext<T> state) {
        var previous = state.previousState();
        return state.copyWith(
          previousState: previous.updateItems(mapper) as Loaded<T>,
        );
      },
      requestRefresh: (RequestRefresh<T> state) {
        var previous = state.previousState();
        return state.copyWith(
          previousState: previous.updateItems(mapper) as Loaded<T>,
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
        return state.copyWith(previousState: state.previousState?.clear());
      },
      error: (ErrorState<T> state) => state,
      isLoadingFirst: (FirstLoading<T> state) {
        return state.copyWith(
            previousState:
                state.previousState().clear() as RequestFirstLoading<T>);
      },
      isLoadingNext: (LoadingNext<T> state) {
        var previous = state.previousState();
        return state.copyWith(
          previousState: previous.copyWith(
            previousState: previous.previousState().clear() as Loaded<T>,
          ),
        );
      },
      isRefreshing: (Refreshing<T> state) {
        var previous = state.previousState();
        return state.copyWith(
          previousState: previous.copyWith(
            previousState: previous.previousState().clear() as Loaded<T>,
          ),
        );
      },
      requestNext: (RequestNext<T> state) {
        var previous = state.previousState();
        return state.copyWith(
          previousState: previous.clear() as Loaded<T>,
        );
      },
      requestRefresh: (RequestRefresh<T> state) {
        var previous = state.previousState();
        return state.copyWith(
          previousState: previous.clear() as Loaded<T>,
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
