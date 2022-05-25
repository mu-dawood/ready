part of controllers;

mixin ReadyRemoteController<T> on ReadyListController<T> {
  Future<IRemoteResult<T>> loadData(int skip, int? pageSize,
      [ICancelToken? cancelToken]);
  @override
  @mustCallSuper
  void notifyListeners() {
    state.mapOrNull(
      requestFirstLoading: _firstLoading,
      requestNext: _loadNext,
      requestRefresh: _refresh,
    );
  }

  ICancelToken? generateCancelToken() => null;
  void _firstLoading(RequestFirstLoading<T> state) async {
    var cancelToken = generateCancelToken();
    emit(ReadyListState.isLoadingFirst(
      cancelToken: cancelToken,
      oldState: state,
    ));
    try {
      var results = await loadData(0, state.pageSize, cancelToken);
      emit(results);
    } catch (e) {
      emit(state.oldState);
    }
  }

  void _loadNext(RequestNext<T> state) async {
    var cancelToken = generateCancelToken();
    emit(ReadyListState.isLoadingNext(
      cancelToken: cancelToken,
      oldState: state,
    ));
    try {
      var results = await loadData(
        state.oldState.items.length,
        state.pageSize,
        cancelToken,
      );
      emit(results);
    } catch (e) {
      emit(state.oldState);
    }
  }

  void _refresh(RequestRefresh<T> state) async {
    var cancelToken = generateCancelToken();
    emit(ReadyListState.isRefreshing(
      cancelToken: cancelToken,
      oldState: state,
    ));
    try {
      var results = await loadData(0, state.pageSize, cancelToken);
      emit(results);
    } catch (e) {
      emit(state.oldState);
    }
  }
}
