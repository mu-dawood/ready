part of controllers;

abstract class ReadyListController<T> {
  /// The current state
  ReadyListState<T> get state;

  /// The stream to listen please use broadcast stream to allow multiple listeners
  Stream<ReadyListState<T>> get stream;

  /// emitting new state to stream
  void emit(ReadyListState<T> state);
}

extension ReadyListControllerExt<T> on ReadyListController<T> {
  void addItem(T item) {
    state.whenOrNull(
      isLoaded: (items, totalCount, _) {
        emit(ReadyListState.isLoaded(
            items: [...items, item], totalCount: totalCount + 1));
      },
    );
  }

  void addItems(Iterable<T> items) {
    state.whenOrNull(
      isLoaded: (itm, totalCount, _) {
        emit(ReadyListState.isLoaded(
            items: [...itm, ...items], totalCount: totalCount + items.length));
      },
    );
  }

  void insertItem(T item) {
    state.whenOrNull(
      isLoaded: (items, totalCount, _) {
        emit(ReadyListState.isLoaded(
            items: [item, ...items], totalCount: totalCount + 1));
      },
    );
  }

  void insertItems(Iterable<T> items) {
    state.whenOrNull(
      isLoaded: (itm, totalCount, _) {
        emit(ReadyListState.isLoaded(
          items: [...items, ...itm],
          totalCount: totalCount + items.length,
        ));
      },
    );
  }

  void removeItem(T item) {
    state.whenOrNull(
      isLoaded: (items, totalCount, _) {
        var newValue = items.where((element) => element != item);
        if (newValue.isEmpty) {
          emit(const ReadyListState.isEmpty());
        } else {
          emit(ReadyListState.isLoaded(
              items: newValue, totalCount: totalCount - 1));
        }
      },
    );
  }

  void removeItems(Iterable<T> items) {
    state.whenOrNull(
      isLoaded: (itm, totalCount, _) {
        var newValue = itm.where((a) => !items.any((b) => a == b));
        if (newValue.isEmpty) {
          emit(const ReadyListState.isEmpty());
        } else {
          emit(ReadyListState.isLoaded(
              items: newValue, totalCount: totalCount - items.length));
        }
      },
    );
  }

  void removeItemAt(int index) {
    state.whenOrNull(
      isLoaded: (items, totalCount, _) {
        var newValue =
            items.where((element) => element != items.elementAt(index));
        if (newValue.isEmpty) {
          emit(const ReadyListState.isEmpty());
        } else {
          emit(ReadyListState.isLoaded(
              items: newValue, totalCount: totalCount - 1));
        }
      },
    );
  }

  void removeItemsAt(List<int> indexes) {
    state.whenOrNull(
      isLoaded: (items, totalCount, _) {
        var newValue =
            items.where((a) => !indexes.any((i) => a == items.elementAt(i)));
        if (newValue.isEmpty) {
          emit(const ReadyListState.isEmpty());
        } else {
          emit(ReadyListState.isLoaded(
              items: newValue, totalCount: totalCount - items.length));
        }
      },
    );
  }

  void removeWhere(bool Function(T) test) {
    state.whenOrNull(
      isLoaded: (items, totalCount, _) {
        var newValue = items.where((a) => !test(a));
        if (newValue.isEmpty) {
          emit(const ReadyListState.isEmpty());
        } else {
          emit(ReadyListState.isLoaded(
              items: newValue, totalCount: totalCount - items.length));
        }
      },
    );
  }

  void mapTo(T Function(T) test) {
    state.whenOrNull(
      isLoaded: (items, totalCount, _) {
        var newValue = items.map((a) => test(a));
        if (newValue.isEmpty) {
          emit(const ReadyListState.isEmpty());
        } else {
          emit(ReadyListState.isLoaded(
              items: newValue, totalCount: totalCount - items.length));
        }
      },
    );
  }

  void clear(List<int> indexes) {
    state.whenOrNull(
      isLoaded: (items, totalCount, _) {
        emit(const ReadyListState.isEmpty());
      },
    );
  }
}
