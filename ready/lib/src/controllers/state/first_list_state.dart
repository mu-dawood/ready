part of ready_list_state;

class _FirstState<T> extends ReadyListState<T> {
  const _FirstState() : super._();

  @override
  List<Object?> get props => [];

  @override
  TResult mayWhen<TResult>({
    required TResult Function() orElse,
    TResult Function()? firstState,
    TResult Function()? empty,
    TResult Function(ICancelToken? cancelToken)? firstLoading,
    TResult Function(Iterable<T> items, int total)? loaded,
    TResult Function(String message)? error,
    TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken)?
        loadingNext,
    TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken)?
        refreshing,
  }) {
    return firstState?.call() ?? orElse();
  }

  @override
  TResult when<TResult>({
    required TResult Function() firstState,
    required TResult Function() empty,
    required TResult Function(ICancelToken? cancelToken) firstLoading,
    required TResult Function(Iterable<T> items, int total) loaded,
    required TResult Function(String message) error,
    required TResult Function(
            Iterable<T> items, int total, ICancelToken? cancelToken)
        loadingNext,
    required TResult Function(
            Iterable<T> items, int total, ICancelToken? cancelToken)
        refreshing,
  }) {
    return firstState.call();
  }

  @override
  TResult? whenOrNull<TResult>({
    TResult Function()? firstState,
    TResult Function()? empty,
    TResult Function(ICancelToken? cancelToken)? firstLoading,
    TResult Function(Iterable<T> items, int total)? loaded,
    TResult Function(String message)? error,
    TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken)?
        loadingNext,
    TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken)?
        refreshing,
  }) {
    return firstState?.call();
  }
}
