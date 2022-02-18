part of controllers;

abstract class ListLoadingHandler<T> {
  /// used to load initial data
  Future loadInitialData(int pageSize);

  ///used to refresh data
  Future refreshData(int pageSize);

  /// used to load next data
  Future nextData(int pageSize);
}

/// this is default handler for loading data into [ReadyListController]
class DefaultListLoadingHandler<T> extends ListLoadingHandler<T> {
  final Future<ReadyListResponse<T>> Function(
      int skip, int pageSize, ICancelToken? cancelToken) loadData;
  final ICancelToken Function()? generateCancelToken;
  final ReadyListController<T> controller;
  DefaultListLoadingHandler({
    required this.loadData,
    required this.controller,
    this.generateCancelToken,
  });

  ReadyListState<T> get state => controller.state;
  Function(ReadyListState<T> state) get emit => controller.emit;

  void _emitSuccess(_Success<T> result) {
    state.whenOrNull(
      initialLoading: (cancelToken) {
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
      ReadyListResponse<T> result, ReadyListState<T> previousState) {
    if (result is _Success<T>) {
      _emitSuccess(result);
    } else if (result is _Cancel<T>) {
      emit(previousState);
    } else if (result is _Error<T>) {
      emit(state.error(result.error));
    } else {
      throw UnsupportedError('Unsupported response');
    }
  }

  void _checkDuplicatedLoading() {
    state.whenOrNull(
      initialLoading: (cancelToken) {
        if (cancelToken != null) {
          throw Exception(
              "You can not make multiple load you should cancel running one first");
        }
      },
      loadingNext: (items, total, cancelToken) {
        if (cancelToken != null) {
          throw Exception(
              "You can not make multiple load you should cancel running one first");
        }
      },
      refreshing: (items, total, cancelToken) {
        if (cancelToken != null) {
          throw Exception(
              "You can not make multiple load you should cancel running one first");
        }
      },
    );
  }

  @override
  Future loadInitialData(int pageSize) async {
    _checkDuplicatedLoading();
    var previousState = state;
    var _cancelToken = generateCancelToken?.call();
    emit(state.initialLoading(_cancelToken));
    try {
      var results = await loadData(0, pageSize, _cancelToken);
      _emitResults(results, previousState);
    } catch (e) {
      emit(previousState);
      rethrow;
    }
  }

  @override
  Future refreshData(int pageSize) async {
    _checkDuplicatedLoading();
    var previousState = state;
    if (previousState.type != ListStateType.loaded) {
      throw Exception(
          "Refreshing must be called when state is Loaded try call loadInitial");
    }
    var _cancelToken = generateCancelToken?.call();

    emit(state.refreshing(_cancelToken));
    try {
      var results = await loadData(0, pageSize, _cancelToken);
      _emitResults(results, previousState);
    } catch (e) {
      emit(previousState);
      rethrow;
    }
  }

  @override
  Future nextData(int pageSize) async {
    _checkDuplicatedLoading();
    var previousState = state;
    if (previousState.type != ListStateType.loaded) {
      throw Exception(
          "Load next must be called when state is Loaded try call loadInitial");
    }
    if (previousState.items.length >= previousState.total) {
      throw Exception("There is no data to load");
    }
    var _cancelToken = generateCancelToken?.call();

    emit(state.loadingNext(_cancelToken));
    try {
      var results =
          await loadData(previousState.items.length, pageSize, _cancelToken);
      _emitResults(results, previousState);
    } catch (e) {
      emit(previousState);
      rethrow;
    }
  }
}
