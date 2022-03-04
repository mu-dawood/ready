part of ready_list_state;

class _Loaded<T> extends ReadyListState<T> {
  final Iterable<T> items;
  final int total;
  const _Loaded({
    required this.items,
    required this.total,
  }) : super._();

  @override
  List<Object?> get props => [items, total];

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
    if (loaded == null) {
      return orElse();
    } else {
      return loaded(items, total);
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
    return loaded.call(items, total);
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
    return loaded?.call(items, total);
  }
}
