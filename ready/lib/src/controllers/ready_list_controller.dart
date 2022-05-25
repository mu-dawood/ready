part of controllers;

abstract class ReadyListController<T> {
  /// The current state
  ReadyListState<T> get state;

  /// The stream to listen
  Stream<ReadyListState<T>> get stream;

  /// emitting new state to stream
  void emit(ReadyListState<T> state);

  /// called on every change of state
  void notifyListeners();
}

extension ReadyListControllerExt<T> on ReadyListController<T> {
  void addItem(T item) {
    state.whenOrNull(
      isLoaded: (items, total, _) {
        emit(
            ReadyListState.isLoaded(items: [...items, item], total: total + 1));
      },
    );
  }

  void addItems(Iterable<T> items) {
    state.whenOrNull(
      isLoaded: (itm, total, _) {
        emit(ReadyListState.isLoaded(
            items: [...itm, ...items], total: total + items.length));
      },
    );
  }

  void insertItem(T item) {
    state.whenOrNull(
      isLoaded: (items, total, _) {
        emit(
            ReadyListState.isLoaded(items: [item, ...items], total: total + 1));
      },
    );
  }

  void insertItems(Iterable<T> items) {
    state.whenOrNull(
      isLoaded: (itm, total, _) {
        emit(ReadyListState.isLoaded(
          items: [...items, ...itm],
          total: total + items.length,
        ));
      },
    );
  }

  void removeItem(T item) {
    state.whenOrNull(
      isLoaded: (items, total, _) {
        var newValue = items.where((element) => element != item);
        if (newValue.isEmpty) {
          emit(const ReadyListState.isEmpty());
        } else {
          emit(ReadyListState.isLoaded(items: newValue, total: total - 1));
        }
      },
    );
  }

  void removeItems(Iterable<T> items) {
    state.whenOrNull(
      isLoaded: (itm, total, _) {
        var newValue = itm.where((a) => !items.any((b) => a == b));
        if (newValue.isEmpty) {
          emit(const ReadyListState.isEmpty());
        } else {
          emit(ReadyListState.isLoaded(
              items: newValue, total: total - items.length));
        }
      },
    );
  }

  void removeItemAt(int index) {
    state.whenOrNull(
      isLoaded: (items, total, _) {
        var newValue =
            items.where((element) => element != items.elementAt(index));
        if (newValue.isEmpty) {
          emit(const ReadyListState.isEmpty());
        } else {
          emit(ReadyListState.isLoaded(items: newValue, total: total - 1));
        }
      },
    );
  }

  void removeItemsAt(List<int> indexes) {
    state.whenOrNull(
      isLoaded: (items, total, _) {
        var newValue =
            items.where((a) => !indexes.any((i) => a == items.elementAt(i)));
        if (newValue.isEmpty) {
          emit(const ReadyListState.isEmpty());
        } else {
          emit(ReadyListState.isLoaded(
              items: newValue, total: total - items.length));
        }
      },
    );
  }

  void removeWhere(bool Function(T) test) {
    state.whenOrNull(
      isLoaded: (items, total, _) {
        var newValue = items.where((a) => !test(a));
        if (newValue.isEmpty) {
          emit(const ReadyListState.isEmpty());
        } else {
          emit(ReadyListState.isLoaded(
              items: newValue, total: total - items.length));
        }
      },
    );
  }

  void mapTo(T Function(T) test) {
    state.whenOrNull(
      isLoaded: (items, total, _) {
        var newValue = items.map((a) => test(a));
        if (newValue.isEmpty) {
          emit(const ReadyListState.isEmpty());
        } else {
          emit(ReadyListState.isLoaded(
              items: newValue, total: total - items.length));
        }
      },
    );
  }

  void empty(List<int> indexes) {
    state.whenOrNull(
      isLoaded: (items, total, _) {
        emit(const ReadyListState.isEmpty());
      },
    );
  }
}
