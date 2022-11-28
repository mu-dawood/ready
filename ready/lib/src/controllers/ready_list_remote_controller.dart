part of controllers;

mixin ReadyRemoteController<T> on ReadyListController<T> {
  Future<ReadyListState<T>> loadData(int skip, int? pageSize,
      [ICancelToken? cancelToken]);

  @override
  void emit(ReadyListState<T> state) {
    state.mapOrNull(
      requestFirstLoading: _firstLoading,
      requestNext: _loadNext,
      requestRefresh: _refresh,
    );
    super.emit(state);
  }

  ICancelToken? generateCancelToken() => null;
  void _firstLoading(RequestFirstLoading<T> state) async {
    var cancelToken = generateCancelToken();
    emit(ReadyListState.isLoadingFirst(
      cancelToken: cancelToken,
      pageSize: state.pageSize,
    ));
    try {
      var results = await loadData(0, state.pageSize, cancelToken);
      emit(results);
    } catch (e) {
      emit(state);
    }
  }

  void _loadNext(RequestNext<T> state) async {
    var cancelToken = generateCancelToken();
    emit(ReadyListState.isLoadingNext(
      cancelToken: cancelToken,
      pageSize: state.pageSize,
      items: state.items,
      totalCount: state.totalCount,
    ));
    try {
      var results = await loadData(
        state.items.length,
        state.pageSize,
        cancelToken,
      );
      emit(results);
    } catch (e) {
      emit(state);
    }
  }

  void _refresh(RequestRefresh<T> state) async {
    var cancelToken = generateCancelToken();
    emit(ReadyListState.isRefreshing(
      cancelToken: cancelToken,
      pageSize: state.pageSize,
      items: state.items,
      totalCount: state.totalCount,
    ));
    try {
      var results = await loadData(0, state.pageSize, cancelToken);
      emit(results);
    } catch (e) {
      emit(state);
    }
  }
}
