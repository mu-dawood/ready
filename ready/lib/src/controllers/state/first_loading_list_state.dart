part of ready_list_state;

class _FirstLoading<T> extends ReadyListState<T> {
  final ICancelToken? cancelToken;
  const _FirstLoading([this.cancelToken]) : super._();

  @override
  List<Object?> get props => [cancelToken];

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
    if (firstLoading == null) {
      return orElse();
    } else {
      return firstLoading(cancelToken);
    }
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
    return firstLoading.call(cancelToken);
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
    return firstLoading?.call(cancelToken);
  }
}
