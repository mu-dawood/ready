part of controllers;

@freezed
class RemoteResult<T> with _$RemoteResult<T> {
  const factory RemoteResult.error(ErrorDisplayCallBack display) =
      ErrorResult<T>;

  const factory RemoteResult.success(Iterable<T> items, int totalCount) =
      SuccessResult<T>;
}

mixin ReadyRemoteController<T> on ReadyListController<T> {
  Future<RemoteResult<T>> loadData(int skip, int? pageSize,
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
      currentData: state.currentData,
      args: state.args,
    ));
    try {
      var results = await loadData(0, state.pageSize, cancelToken);
      emit(results.map(
        error: (ErrorResult<T> value) {
          return ReadyListState.error(
            value.display,
            state.currentData?.copyWith(pageSize: state.pageSize),
            state.args,
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
        (context) => e.toString(),
        state.currentData?.copyWith(pageSize: state.pageSize),
        state.args,
      ));
    }
  }

  void _loadNext(RequestNext<T> state) async {
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
            args: state.currentData.args,
          );
        },
        success: (SuccessResult<T> value) {
          return ReadyListState.isLoaded(
            items: [...state.currentData.items, ...value.items],
            totalCount: value.totalCount,
            pageSize: state.pageSize,
            args: state.currentData.args,
          );
        },
      ));
    } catch (e) {
      emit(ReadyListState.isLoaded(
        items: state.currentData.items,
        totalCount: state.currentData.totalCount,
        pageSize: state.currentData.pageSize,
        args: state.currentData.args,
      ));
    }
  }

  void _refresh(RequestRefresh<T> state) async {
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
            args: state.currentData.args,
          );
        },
        success: (SuccessResult<T> value) {
          return ReadyListState.isLoaded(
            items: value.items,
            totalCount: value.totalCount,
            pageSize: state.pageSize,
            args: state.currentData.args,
          );
        },
      ));
    } catch (e) {
      emit(ReadyListState.isLoaded(
        items: state.currentData.items,
        totalCount: state.currentData.totalCount,
        pageSize: state.currentData.pageSize,
        args: state.currentData.args,
      ));
    }
  }

  void requestRefresh() {
    state.mapOrNull(
      initializing: (state) =>
          emit(ReadyListState.requestFirstLoading(args: state.args)),
      error: (state) => emit(ReadyListState.requestFirstLoading(
        pageSize: state.currentData?.pageSize,
        currentData: state.currentData,
        args: state.args,
      )),
      isLoaded: (state) => emit(ReadyListState.requestRefresh(
          pageSize: state.pageSize,
          args: state.args,
          currentData: CurrentData(
            items: state.items,
            totalCount: state.totalCount,
            pageSize: state.pageSize,
            args: state.args,
          ))),
    );
  }
}
