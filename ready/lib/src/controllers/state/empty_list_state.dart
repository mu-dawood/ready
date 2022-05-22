part of ready_list_state;

class _Empty<T> extends ReadyListState<T> {
  const _Empty() : super._();

  @override
  List<Object?> get props => [];

  @override
  TResult mayWhen<TResult>({
    required TResult Function() orElse,
    TResult Function()? initializing,
    TResult Function(ReadyListState<T>? oldState)? needFirstLoading,
    TResult Function()? empty,
    TResult Function(ICancelToken? cancelToken)? firstLoading,
    TResult Function(Iterable<T> items, int total)? loaded,
    TResult Function(ErrorDisplayCallBack display)? error,
    TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken)?
        loadingNext,
    TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken)?
        refreshing,
  }) {
    if (empty == null) {
      return orElse();
    } else {
      return empty();
    }
  }

  @override
  TResult when<TResult>({
    required TResult Function() initializing,
    required TResult Function(ReadyListState<T>? oldState) needFirstLoading,
    required TResult Function() empty,
    required TResult Function(ICancelToken? cancelToken) firstLoading,
    required TResult Function(Iterable<T> items, int total) loaded,
    required TResult Function(ErrorDisplayCallBack display) error,
    required TResult Function(
            Iterable<T> items, int total, ICancelToken? cancelToken)
        loadingNext,
    required TResult Function(
            Iterable<T> items, int total, ICancelToken? cancelToken)
        refreshing,
  }) {
    return empty();
  }

  @override
  TResult? whenOrNull<TResult>({
    TResult Function()? initializing,
    TResult Function(ReadyListState<T>? oldState)? needFirstLoading,
    TResult Function()? empty,
    TResult Function(ICancelToken? cancelToken)? firstLoading,
    TResult Function(Iterable<T> items, int total)? loaded,
    TResult Function(ErrorDisplayCallBack display)? error,
    TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken)?
        loadingNext,
    TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken)?
        refreshing,
  }) {
    return empty?.call();
  }
}
