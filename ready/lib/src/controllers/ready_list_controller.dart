part of controllers;

abstract class ReadyListController<T> {
  /// The current state
  ReadyListState<T> get state;

  /// The stream to listen
  Stream<ReadyListState<T>> get stream;

  /// emitting new state to stream
  void emit(ReadyListState<T> state);

  /// this will manage loading and refreshing data
  /// you can use  [DefaultListLoadingHandler]
  ListLoadingHandler<T>? get handler;
}

extension ReadyListRemoteControllerExt<T> on ReadyListController<T> {
  bool get hasHandler => handler != null;

  ReadyListController<T> withHandler(ListLoadingHandler<T>? handler) =>
      _ReadyListControllerWithHandler(this, handler);

  void addItem(T item) {
    state.whenOrNull(
      loaded: (items, total) {
        emit(state.loaded([...items, item], total + 1));
      },
    );
  }

  void addItems(Iterable<T> items) {
    state.whenOrNull(
      loaded: (_items, total) {
        emit(state.loaded([..._items, ...items], total + items.length));
      },
    );
  }

  void insertItem(T item) {
    state.whenOrNull(
      loaded: (items, total) {
        emit(state.loaded([item, ...items], total + 1));
      },
    );
  }

  void insertItems(Iterable<T> items) {
    state.whenOrNull(
      loaded: (_items, total) {
        emit(state.loaded([...items, ..._items], total + items.length));
      },
    );
  }

  void removeItem(T item) {
    state.whenOrNull(
      loaded: (items, total) {
        var _new = items.where((element) => element != item);
        if (_new.isEmpty) {
          emit(state.empty());
        } else {
          emit(state.loaded(_new, total - 1));
        }
      },
    );
  }

  void removeItems(Iterable<T> items) {
    state.whenOrNull(
      loaded: (_items, total) {
        var _new = _items.where((a) => !items.any((b) => a == b));
        if (_new.isEmpty) {
          emit(state.empty());
        } else {
          emit(state.loaded(_new, total - items.length));
        }
      },
    );
  }

  void removeItemAt(int index) {
    state.whenOrNull(
      loaded: (items, total) {
        var _new = items.where((element) => element != items.elementAt(index));
        if (_new.isEmpty) {
          emit(state.empty());
        } else {
          emit(state.loaded(_new, total - 1));
        }
      },
    );
  }

  void removeItemsAt(List<int> indexes) {
    state.whenOrNull(
      loaded: (items, total) {
        var _new =
            items.where((a) => !indexes.any((i) => a == items.elementAt(i)));
        if (_new.isEmpty) {
          emit(state.empty());
        } else {
          emit(state.loaded(_new, total - items.length));
        }
      },
    );
  }

  void empty(List<int> indexes) {
    state.whenOrNull(
      loaded: (items, total) {
        emit(state.empty());
      },
    );
  }
}
