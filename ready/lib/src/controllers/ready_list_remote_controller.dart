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
      previousState: state,
    ));
    try {
      var results = await loadData(0, state.pageSize, cancelToken);
      emit(results.map(
        error: (ErrorResult<T> value) {
          return ReadyListState.error(value.display);
        },
        success: (SuccessResult<T> value) {
          return ReadyListState.isLoaded(
            items: value.items,
            totalCount: value.totalCount,
          );
        },
      ));
    } catch (e) {
      emit(ReadyListState.error((context) => e.toString()));
    }
  }

  void _loadNext(RequestNext<T> state) async {
    var cancelToken = generateCancelToken();
    emit(ReadyListState.isLoadingNext(
      cancelToken: cancelToken,
      previousState: state,
    ));
    try {
      var results = await loadData(
        state.previousState.items.length,
        state.pageSize,
        cancelToken,
      );
      emit(results.map(
        error: (ErrorResult<T> value) {
          return state.previousState();
        },
        success: (SuccessResult<T> value) {
          if (value.items.isEmpty) {
            return state.previousState();
          } else {
            return ReadyListState.isLoaded(
              items: [...state.previousState.items, ...value.items],
              totalCount: value.totalCount,
            );
          }
        },
      ));
    } catch (e) {
      emit(state.previousState());
    }
  }

  void _refresh(RequestRefresh<T> state) async {
    var cancelToken = generateCancelToken();
    emit(ReadyListState.isRefreshing(
        cancelToken: cancelToken, previousState: state));
    try {
      var results = await loadData(0, state.pageSize, cancelToken);
      emit(results.map(
        error: (ErrorResult<T> value) {
          return state.previousState();
        },
        success: (SuccessResult<T> value) {
          return ReadyListState.isLoaded(
            items: value.items,
            totalCount: value.totalCount,
          );
        },
      ));
    } catch (e) {
      emit(state.previousState());
    }
  }
}
