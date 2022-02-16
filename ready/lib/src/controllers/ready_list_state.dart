part of controllers;

abstract class ICancelToken {
  /// Cancel the request
  void cancel([dynamic reason]);
}

class ReadyListState<T> extends Equatable {
  final Iterable<T> items;
  final int total;
  final ICancelToken? cancelToken;
  final ListStateType type;
  final String? message;

  const ReadyListState._({
    required this.items,
    required this.total,
    required this.cancelToken,
    required this.type,
    required this.message,
  });

  factory ReadyListState() => ReadyListState<T>._(
        type: ListStateType.needInitialLoading,
        items: List<T>.empty(),
        cancelToken: null,
        message: null,
        total: 0,
      );

  @override
  List<Object?> get props => [items, total, cancelToken, type, message];

  ReadyListState<T> loaded(Iterable<T> items, int total) {
    return ReadyListState<T>._(
      items: items,
      total: total,
      cancelToken: null,
      type: ListStateType.loaded,
      message: null,
    );
  }

  ReadyListState<T> empty() {
    return ReadyListState<T>._(
      items: const [],
      total: 0,
      cancelToken: null,
      type: ListStateType.empty,
      message: null,
    );
  }

  ReadyListState<T> error(String message) {
    return ReadyListState<T>._(
      items: const [],
      total: 0,
      cancelToken: null,
      type: ListStateType.error,
      message: message,
    );
  }

  ReadyListState<T> initialLoading(ICancelToken? cancelToken) {
    return ReadyListState<T>._(
      items: const [],
      total: 0,
      cancelToken: cancelToken,
      type: ListStateType.initialLoading,
      message: null,
    );
  }

  ReadyListState<T> loadingNext(ICancelToken? cancelToken) {
    return ReadyListState<T>._(
      items: items,
      total: total,
      cancelToken: cancelToken,
      type: ListStateType.loadingNext,
      message: null,
    );
  }

  ReadyListState<T> refreshing(ICancelToken? cancelToken) {
    return ReadyListState<T>._(
      items: items,
      total: total,
      cancelToken: cancelToken,
      type: ListStateType.refreshing,
      message: null,
    );
  }

  TResult mayWhen<TResult>({
    required TResult Function() orElse,
    TResult Function()? needInitialLoading,
    TResult Function()? empty,
    TResult Function(ICancelToken? cancelToken)? initialLoading,
    TResult Function(Iterable<T> items, int total)? loaded,
    TResult Function(String message)? error,
    TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken)?
        loadingNext,
    TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken)?
        refreshing,
  }) {
    switch (type) {
      case ListStateType.needInitialLoading:
        return needInitialLoading?.call() ?? orElse();
      case ListStateType.empty:
        return empty?.call() ?? orElse();
      case ListStateType.initialLoading:
        return initialLoading?.call(cancelToken) ?? orElse();
      case ListStateType.loaded:
        return loaded?.call(items, total) ?? orElse();
      case ListStateType.refreshing:
        return refreshing?.call(items, total, cancelToken) ?? orElse();
      case ListStateType.loadingNext:
        return loadingNext?.call(items, total, cancelToken) ?? orElse();
      case ListStateType.error:
        return error?.call(message ?? '') ?? orElse();
    }
  }

  TResult when<TResult>({
    required TResult Function() needInitialLoading,
    required TResult Function() empty,
    required TResult Function(ICancelToken? cancelToken) initialLoading,
    required TResult Function(Iterable<T> items, int total) loaded,
    required TResult Function(String message) error,
    required TResult Function(
            Iterable<T> items, int total, ICancelToken? cancelToken)
        refreshing,
    required TResult Function(
            Iterable<T> items, int total, ICancelToken? cancelToken)
        loadingNext,
  }) {
    switch (type) {
      case ListStateType.needInitialLoading:
        return needInitialLoading.call();
      case ListStateType.empty:
        return empty.call();
      case ListStateType.initialLoading:
        return initialLoading.call(cancelToken);
      case ListStateType.loaded:
        return loaded.call(items, total);
      case ListStateType.refreshing:
        return refreshing.call(items, total, cancelToken);
      case ListStateType.loadingNext:
        return loadingNext.call(items, total, cancelToken);
      case ListStateType.error:
        return error.call(message ?? '');
    }
  }

  TResult? whenOrNull<TResult>({
    TResult Function()? needInitialLoading,
    TResult Function()? empty,
    TResult Function(ICancelToken? cancelToken)? initialLoading,
    TResult Function(Iterable<T> items, int total)? loaded,
    TResult Function(String message)? error,
    TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken)?
        loadingNext,
    TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken)?
        refreshing,
  }) {
    switch (type) {
      case ListStateType.needInitialLoading:
        return needInitialLoading?.call();
      case ListStateType.empty:
        return empty?.call();
      case ListStateType.initialLoading:
        return initialLoading?.call(cancelToken);
      case ListStateType.loaded:
        return loaded?.call(items, total);
      case ListStateType.refreshing:
        return refreshing?.call(items, total, cancelToken);
      case ListStateType.loadingNext:
        return loadingNext?.call(items, total, cancelToken);
      case ListStateType.error:
        return error?.call(message ?? '');
    }
  }
}
