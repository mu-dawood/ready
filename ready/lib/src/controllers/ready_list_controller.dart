part of controllers;

abstract class ReadyListController<T, S extends BaseReadyListState<T>>
    extends Cubit<S> {
  ReadyListController(super.initialState);
  void setState(S state) {
    emit(state);
  }

  /// emit requestFirstLoading state
  void requestFirstLoading(int pageSize, [ICancelToken? cancelToken]);

  /// emit isLoadingFirstTime state
  void isLoadingFirstTime();

  /// emit loaded
  void loaded({required Iterable<T> items, required int totalCount});

  /// emit error
  void error({required ErrorDisplayCallBack display});

  /// emit requestNextLoading
  void requestNextLoading(int pageSize, [ICancelToken? cancelToken]);

  /// emit isLoadingNext
  void isLoadingNext();

  /// emit requestRefreshing
  void requestRefreshing(int pageSize, [ICancelToken? cancelToken]);

  /// emit isRefreshing
  void isRefreshing();
}

mixin ReadyListControllerMixin<T, S extends ICopyWith<T, S>>
    on ReadyListController<T, S> {
  /// emit requestFirstLoading state
  @override
  void requestFirstLoading(int pageSize, [ICancelToken? cancelToken]) {
    return emit(state.copyWith(
      stateType: StateType.requestFirstLoading,
      cancelToken: cancelToken,
      pageSize: pageSize,
    ));
  }

  /// emit isLoadingFirstTime state
  @override
  void isLoadingFirstTime() {
    return emit(state.copyWith(stateType: StateType.isLoadingFirstTime));
  }

  /// emit loaded
  @override
  void loaded({required Iterable<T> items, required int totalCount}) {
    return emit(state.copyWith(
      stateType: StateType.loaded,
      items: items,
      totalCount: totalCount,
    ));
  }

  /// emit error
  @override
  void error({required ErrorDisplayCallBack display}) {
    return emit(
        state.copyWith(stateType: StateType.error, errorDisplay: display));
  }

  /// emit requestNextLoading
  @override
  void requestNextLoading(int pageSize, [ICancelToken? cancelToken]) {
    return emit(state.copyWith(
      stateType: StateType.requestNextLoading,
      cancelToken: cancelToken,
      pageSize: pageSize,
    ));
  }

  /// emit isLoadingNext
  @override
  void isLoadingNext() {
    return emit(state.copyWith(stateType: StateType.isLoadingNext));
  }

  /// emit requestRefreshing
  @override
  void requestRefreshing(int pageSize, [ICancelToken? cancelToken]) {
    return emit(state.copyWith(
      stateType: StateType.requestRefreshing,
      cancelToken: cancelToken,
      pageSize: pageSize,
    ));
  }

  /// emit isRefreshing
  @override
  void isRefreshing() {
    return emit(state.copyWith(stateType: StateType.isRefreshing));
  }
}

class DefaultReadyListController<T>
    extends ReadyListController<T, ReadyListState<T>>
    with ReadyListControllerMixin {
  DefaultReadyListController(super.initialState);
}
