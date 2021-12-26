part of ready_list;

abstract class ReadyListController<T> {
  /// The current state
  ReadyListState<T> get state;

  /// The stream to listen
  Stream<ReadyListState<T>> get stream;

  /// emitting new state to stream
  void emit(ReadyListState<T> state);

  /// use current state.copyWith to return the
  @visibleForOverriding
  Future<ReadylistResponse<T>> loadData({
    ICancelToken? cancelToken,
    required int skip,
    required int pageSize,
  });
}

mixin CancelHandlerMixin<T> on ReadyListController<T> {
  ICancelToken generateCancelToken();
  void cancelRunning([dynamic reason]) {
    state.whenOrNull<ICancelToken?>(
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
          emit(ReadyListState<T>.empty());
        } else {
          emit(ReadyListState<T>.items(items: result.items, total: result.total, intial: true));
        }
      },
      refreshing: (items, total, cancelToken) {
        if (result.items.isEmpty) {
          emit(ReadyListState<T>.empty());
        } else {
          emit(ReadyListState<T>.items(items: result.items, total: result.total, intial: false));
        }
      },
      loadingNext: (items, total, cancelToken) {
        if (result.items.isEmpty) {
          emit(ReadyListState<T>.items(items: items, total: total));
        } else {
          emit(ReadyListState<T>.items(items: [...items, ...result.items], total: result.total, intial: false));
        }
      },
    );
  }

  void _emitResults(ReadylistResponse<T> results, ReadyListState<T> prevoisState) {
    results.map(
      success: _emitSuccess,
      cancel: (value) {
        emit(prevoisState);
      },
      error: (_Error<T> value) {
        emit(ReadyListState<T>.error(value.message));
      },
    );
  }

  void _checkDublicateLoading() {
    state.whenOrNull<ICancelToken?>(
      intialLoading: (cancelToken) {
        if (cancelToken != null) throw Exception("You can not make multible load you shoald cancel running one first");
      },
      loadingNext: (items, total, cancelToken) {
        if (cancelToken != null) throw Exception("You can not make multible load you shoald cancel running one first");
      },
      refreshing: (items, total, cancelToken) {
        if (cancelToken != null) throw Exception("You can not make multible load you shoald cancel running one first");
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
    emit(ReadyListState<T>.intialLoading(_cancelToken));
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
    var prevoisState = state.mapOrNull(items: (_) => _);
    if (prevoisState == null) {
      throw Exception("Load next must be called when state is Loaded");
    }
    var _cancelToken = _getcancelToken();

    emit(ReadyListState<T>.refreshing(items: prevoisState.items, total: prevoisState.total, cancelToken: _cancelToken));
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
    var prevoisState = state.mapOrNull(items: (_) => _);
    if (prevoisState == null) {
      throw Exception("Load next must be called when state is Loaded");
    }
    if (prevoisState.items.length >= prevoisState.total) {
      throw Exception("There is no data to load");
    }
    var _cancelToken = _getcancelToken();

    emit(
        ReadyListState<T>.loadingNext(items: prevoisState.items, total: prevoisState.total, cancelToken: _cancelToken));
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
}
