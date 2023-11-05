part of controllers;

abstract class ReadyListController<T, S extends BaseReadyListState<T>> {
  /// The current state
  S get state;

  /// The stream to listen please use broadcast stream to allow multiple listeners
  Stream<S> get stream;

  /// emitting new state to stream
  void emit(S state);

  S copyWith({
    Iterable<T>? items,
    int? totalCount,
    int? pageSize,
    ErrorDisplayCallBack? errorDisplay,
    StateType? stateType,
    ICancelToken? cancelToken,
  });
}

mixin ReadyListControllerCopyMixin<T>
    on ReadyListController<T, ReadyListState<T>> {
  @override
  ReadyListState<T> copyWith({
    Iterable<T>? items,
    int? totalCount,
    int? pageSize,
    ErrorDisplayCallBack? errorDisplay,
    StateType? stateType,
    ICancelToken? cancelToken,
  }) {
    return ReadyListState<T>(
      items: items ?? state.items,
      totalCount: totalCount ?? state.totalCount,
      pageSize: pageSize ?? state.pageSize,
      errorDisplay: errorDisplay ?? state.errorDisplay,
      stateType: stateType ?? state.stateType,
      cancelToken: cancelToken ?? state.cancelToken,
    );
  }
}
