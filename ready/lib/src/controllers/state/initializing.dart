part of ready_list_state;

class Initializing<T> extends ReadyListState<T> {
  const Initializing() : super._();

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
    if (initializing == null) {
      return orElse();
    } else {
      return initializing();
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
    return initializing.call();
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
    return initializing?.call();
  }
}
