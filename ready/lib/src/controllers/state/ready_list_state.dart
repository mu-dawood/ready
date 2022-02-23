library ready_list_state;

import 'package:equatable/equatable.dart';

part 'empty_list_state.dart';
part 'error_list_state.dart';
part 'first_list_state.dart';
part 'first_loading_list_state.dart';
part 'loaded_state.dart';
part 'loading_next_list_state.dart';
part 'refreshing_list_state.dart';

abstract class ICancelToken {
  /// Cancel the request
  void cancel([dynamic reason]);
}

abstract class ReadyListState<T> extends Equatable {
  const ReadyListState._();

  /// this first state
  /// this will fire first loading
  const factory ReadyListState.firstState() = _FirstState<T>;

  /// when there is no data
  const factory ReadyListState.empty() = _Empty<T>;

  /// when there is any error
  const factory ReadyListState.error(String message) = _ErrorState<T>;

  /// loading first time
  const factory ReadyListState.firstLoading([ICancelToken? cancelToken]) =
      _FirstLoading<T>;

  /// when loading next data
  const factory ReadyListState.loadingNext({
    ICancelToken? cancelToken,
    required Iterable<T> items,
    required int total,
  }) = _LoadingNext<T>;

  /// refreshing data
  const factory ReadyListState.refreshing({
    ICancelToken? cancelToken,
    required Iterable<T> items,
    required int total,
  }) = _Refreshing<T>;

  /// data loaded
  const factory ReadyListState.loaded({
    required Iterable<T> items,
    required int total,
  }) = _Loaded<T>;

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
  });

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
  });

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
  });
}

extension ReadyListStateExtension<T> on ReadyListState<T> {
  _FirstState<T>? asFirstState() => whenOrNull(
        firstState: () => this as _FirstState<T>,
      );

  _Empty<T>? asEmptyState() => whenOrNull(
        empty: () => this as _Empty<T>,
      );

  _ErrorState<T>? asErrorState() => whenOrNull(
        error: (_) => this as _ErrorState<T>,
      );

  _FirstLoading<T>? asFirstLoading() => whenOrNull(
        firstLoading: (_) => this as _FirstLoading<T>,
      );

  _LoadingNext<T>? asLoadingNext() => whenOrNull(
        loadingNext: (_, __, ___) => this as _LoadingNext<T>,
      );

  _Refreshing<T>? asRefreshing() => whenOrNull(
        refreshing: (_, __, ___) => this as _Refreshing<T>,
      );

  _Loaded<T>? asLoaded() => whenOrNull(
        loaded: (_, __) => this as _Loaded<T>,
      );
}
