part of ready_list_state;

class _Refreshing<T> extends ReadyListState<T> {
  final ICancelToken? cancelToken;
  final Iterable<T> items;
  final int total;
  const _Refreshing({
    this.cancelToken,
    required this.items,
    required this.total,
  }) : super._();

  @override
  List<Object?> get props => [cancelToken, items, total];

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
    if (refreshing == null) {
      return orElse();
    } else {
      return refreshing(items, total, cancelToken);
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
    return refreshing.call(items, total, cancelToken);
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
    return refreshing?.call(items, total, cancelToken);
  }
}
