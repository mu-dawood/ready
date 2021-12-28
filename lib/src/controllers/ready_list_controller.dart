part of controllers;

abstract class ReadyListController<T> {
  /// The current state
  ReadyListState<T> get state;

  /// The stream to listen
  Stream<ReadyListState<T>> get stream;

  /// emitting new state to stream
  void emit(ReadyListState<T> state);

  /// use current state.copyWith to return the
  @protected
  Future<ReadylistResponse<T>> loadData({
    ICancelToken? cancelToken,
    required int skip,
    required int pageSize,
  });
}

mixin CancelHandlerMixin<T> on ReadyListController<T> {
  ICancelToken generateCancelToken();
  void cancelRunning([dynamic reason]) {
    state.whenOrNull(
      intialLoading: (cancelToken) {
        cancelToken?.cancel(reason);
      },
      loadingNext: (items, total, cancelToken) {
        cancelToken?.cancel(reason);
      },
      refreshing: (items, total, cancelToken) {
        cancelToken?.cancel(reason);
      },
    );
  }
}

extension ReadyListRemoteControllerExt<T> on ReadyListController<T> {
  void _emitSuccess(_Success<T> result) {
    state.whenOrNull(
      intialLoading: (cancelToken) {
        if (result.items.isEmpty) {
          emit(state.empty());
        } else {
          emit(state.loaded(result.items, result.total));
        }
      },
      refreshing: (items, total, cancelToken) {
        if (result.items.isEmpty) {
          emit(state.empty());
        } else {
          emit(state.loaded(result.items, result.total));
        }
      },
      loadingNext: (items, total, cancelToken) {
        emit(state.loaded([...items, ...result.items], result.total));
      },
    );
  }

  void _emitResults(
      ReadylistResponse<T> result, ReadyListState<T> prevoisState) {
    if (result is _Success<T>) {
      _emitSuccess(result);
    } else if (result is _Cancel<T>) {
      emit(prevoisState);
    } else if (result is _Error<T>) {
      emit(state.error(result.error));
    } else {
      throw UnsupportedError('Unsupported response');
    }
  }

  void _checkDublicateLoading() {
    state.whenOrNull(
      intialLoading: (cancelToken) {
        if (cancelToken != null) {
          throw Exception(
              "You can not make multible load you shoald cancel running one first");
        }
      },
      loadingNext: (items, total, cancelToken) {
        if (cancelToken != null) {
          throw Exception(
              "You can not make multible load you shoald cancel running one first");
        }
      },
      refreshing: (items, total, cancelToken) {
        if (cancelToken != null) {
          throw Exception(
              "You can not make multible load you shoald cancel running one first");
        }
      },
    );
  }

  ICancelToken? _getcancelToken() {
    var controller = this;
    if (controller is CancelHandlerMixin<T>) {
      return controller.generateCancelToken();
    }
  }

  Future loadIntial(int pageSize) async {
    _checkDublicateLoading();
    var prevoisState = state;
    var _cancelToken = _getcancelToken();
    emit(state.intialLoading(_cancelToken));
    try {
      var results = await loadData(
        cancelToken: _cancelToken,
        skip: 0,
        pageSize: pageSize,
      );
      _emitResults(results, prevoisState);
    } catch (e) {
      emit(prevoisState);
      rethrow;
    }
  }

  Future refreshData(int pageSize) async {
    _checkDublicateLoading();
    var prevoisState = state;
    if (prevoisState.type != ListStateType.loaded) {
      throw Exception(
          "Refreshing must be called when state is Loaded try call loadIntial");
    }
    var _cancelToken = _getcancelToken();

    emit(state.refreshing(_cancelToken));
    try {
      var results = await loadData(
        cancelToken: _cancelToken,
        skip: 0,
        pageSize: pageSize,
      );
      _emitResults(results, prevoisState);
    } catch (e) {
      emit(prevoisState);
      rethrow;
    }
  }

  Future nextData(int pageSize) async {
    _checkDublicateLoading();
    var prevoisState = state;
    if (prevoisState.type != ListStateType.loaded) {
      throw Exception(
          "Load next must be called when state is Loaded try call loadIntial");
    }
    if (prevoisState.items.length >= prevoisState.total) {
      throw Exception("There is no data to load");
    }
    var _cancelToken = _getcancelToken();

    emit(state.loadingNext(_cancelToken));
    try {
      var results = await loadData(
        cancelToken: _cancelToken,
        skip: prevoisState.items.length,
        pageSize: pageSize,
      );
      _emitResults(results, prevoisState);
    } catch (e) {
      emit(prevoisState);
      rethrow;
    }
  }

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

  void removeItemsAt(List<int> indexs) {
    state.whenOrNull(
      loaded: (items, total) {
        var _new =
            items.where((a) => !indexs.any((i) => a == items.elementAt(i)));
        if (_new.isEmpty) {
          emit(state.empty());
        } else {
          emit(state.loaded(_new, total - items.length));
        }
      },
    );
  }

  void empty(List<int> indexs) {
    state.whenOrNull(
      loaded: (items, total) {
        emit(state.empty());
      },
    );
  }
}
