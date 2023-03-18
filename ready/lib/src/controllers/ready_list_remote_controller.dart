part of controllers;

@freezed
class RemoteResult<T> with _$RemoteResult<T> {
  const factory RemoteResult.error(ErrorDisplayCallBack display) =
      ErrorResult<T>;

  const factory RemoteResult.success(Iterable<T> items, int totalCount) =
      SuccessResult<T>;
}

mixin ReadyRemoteController<T, Args> on BaseReadyListController<T, Args> {
  Future<RemoteResult<T>> loadData(int skip, int? pageSize,
      [ICancelToken? cancelToken]);

  @override
  void emit(ReadyListState<T, Args> state) {
    state.mapOrNull(
      requestFirstLoading: _firstLoading,
      requestNext: _loadNext,
      requestRefresh: _refresh,
    );
    super.emit(state);
  }

  ICancelToken? generateCancelToken() => null;
  void _firstLoading(RequestFirstLoading<T, Args> state) async {
    var cancelToken = generateCancelToken();
    emit(ReadyListState.isLoadingFirst(
      cancelToken: cancelToken,
      pageSize: state.pageSize,
      currentData: state.currentData,
      args: state.args,
    ));
    try {
      var results = await loadData(0, state.pageSize, cancelToken);
      emit(results.map(
        error: (ErrorResult<T> value) {
          return ReadyListState.error(
            display: value.display,
            currentData: state.currentData?.copyWith(pageSize: state.pageSize),
            args: state.args,
          );
        },
        success: (SuccessResult<T> value) {
          return ReadyListState.isLoaded(
            items: value.items,
            totalCount: value.totalCount,
            pageSize: state.pageSize,
            args: state.args,
          );
        },
      ));
    } catch (e) {
      emit(ReadyListState.error(
        display: (context) => e.toString(),
        currentData: state.currentData?.copyWith(pageSize: state.pageSize),
        args: state.args,
      ));
    }
  }

  void _loadNext(RequestNext<T, Args> state) async {
    var cancelToken = generateCancelToken();
    emit(ReadyListState.isLoadingNext(
      cancelToken: cancelToken,
      pageSize: state.pageSize,
      currentData: state.currentData,
      args: state.args,
    ));
    try {
      var results = await loadData(
        state.currentData.items.length,
        state.pageSize,
        cancelToken,
      );
      emit(results.map(
        error: (ErrorResult<T> value) {
          return ReadyListState.isLoaded(
            items: state.currentData.items,
            totalCount: state.currentData.totalCount,
            pageSize: state.currentData.pageSize,
            args: state.args,
          );
        },
        success: (SuccessResult<T> value) {
          return ReadyListState.isLoaded(
            items: [...state.currentData.items, ...value.items],
            totalCount: value.totalCount,
            pageSize: state.pageSize,
            args: state.args,
          );
        },
      ));
    } catch (e) {
      emit(ReadyListState.isLoaded(
        items: state.currentData.items,
        totalCount: state.currentData.totalCount,
        pageSize: state.currentData.pageSize,
        args: state.args,
      ));
    }
  }

  void _refresh(RequestRefresh<T, Args> state) async {
    var cancelToken = generateCancelToken();
    emit(ReadyListState.isRefreshing(
      cancelToken: cancelToken,
      pageSize: state.pageSize,
      currentData: state.currentData,
      args: state.args,
    ));

    try {
      var results = await loadData(0, state.pageSize, cancelToken);
      emit(results.map(
        error: (ErrorResult<T> value) {
          return ReadyListState.isLoaded(
            items: state.currentData.items,
            totalCount: state.currentData.totalCount,
            pageSize: state.currentData.pageSize,
            args: state.args,
          );
        },
        success: (SuccessResult<T> value) {
          return ReadyListState.isLoaded(
            items: value.items,
            totalCount: value.totalCount,
            pageSize: state.pageSize,
            args: state.args,
          );
        },
      ));
    } catch (e) {
      emit(ReadyListState.isLoaded(
        items: state.currentData.items,
        totalCount: state.currentData.totalCount,
        pageSize: state.currentData.pageSize,
        args: state.args,
      ));
    }
  }
}
