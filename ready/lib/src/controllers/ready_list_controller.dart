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
        emit(ReadyListState.loaded(items: [...items, item], total: total + 1));
      },
    );
  }

  void addItems(Iterable<T> items) {
    state.whenOrNull(
      loaded: (itm, total) {
        emit(ReadyListState.loaded(
            items: [...itm, ...items], total: total + items.length));
      },
    );
  }

  void insertItem(T item) {
    state.whenOrNull(
      loaded: (items, total) {
        emit(ReadyListState.loaded(items: [item, ...items], total: total + 1));
      },
    );
  }

  void insertItems(Iterable<T> items) {
    state.whenOrNull(
      loaded: (itm, total) {
        emit(ReadyListState.loaded(
          items: [...items, ...itm],
          total: total + items.length,
        ));
      },
    );
  }

  void removeItem(T item) {
    state.whenOrNull(
      loaded: (items, total) {
        var newValue = items.where((element) => element != item);
        if (newValue.isEmpty) {
          emit(const ReadyListState.empty());
        } else {
          emit(ReadyListState.loaded(items: newValue, total: total - 1));
        }
      },
    );
  }

  void removeItems(Iterable<T> items) {
    state.whenOrNull(
      loaded: (itm, total) {
        var newValue = itm.where((a) => !items.any((b) => a == b));
        if (newValue.isEmpty) {
          emit(const ReadyListState.empty());
        } else {
          emit(ReadyListState.loaded(
              items: newValue, total: total - items.length));
        }
      },
    );
  }

  void removeItemAt(int index) {
    state.whenOrNull(
      loaded: (items, total) {
        var newValue =
            items.where((element) => element != items.elementAt(index));
        if (newValue.isEmpty) {
          emit(const ReadyListState.empty());
        } else {
          emit(ReadyListState.loaded(items: newValue, total: total - 1));
        }
      },
    );
  }

  void removeItemsAt(List<int> indexes) {
    state.whenOrNull(
      loaded: (items, total) {
        var newValue =
            items.where((a) => !indexes.any((i) => a == items.elementAt(i)));
        if (newValue.isEmpty) {
          emit(const ReadyListState.empty());
        } else {
          emit(ReadyListState.loaded(
              items: newValue, total: total - items.length));
        }
      },
    );
  }

  void removeWhere(bool Function(T) test) {
    state.whenOrNull(
      loaded: (items, total) {
        var newValue = items.where((a) => !test(a));
        if (newValue.isEmpty) {
          emit(const ReadyListState.empty());
        } else {
          emit(ReadyListState.loaded(
              items: newValue, total: total - items.length));
        }
      },
    );
  }

  void mapTo(T Function(T) test) {
    state.whenOrNull(
      loaded: (items, total) {
        var newValue = items.map((a) => test(a));
        if (newValue.isEmpty) {
          emit(const ReadyListState.empty());
        } else {
          emit(ReadyListState.loaded(
              items: newValue, total: total - items.length));
        }
      },
    );
  }

  void empty(List<int> indexes) {
    state.whenOrNull(
      loaded: (items, total) {
        emit(const ReadyListState.empty());
      },
    );
  }
}
