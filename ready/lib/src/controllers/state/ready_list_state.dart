library ready_list_state;

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'empty_list_state.dart';
part 'error_list_state.dart';
part 'first_loading_list_state.dart';
part 'initializing.dart';
part 'loaded_state.dart';
part 'loading_next_list_state.dart';
part 'need_first_loading.dart';
part 'refreshing_list_state.dart';

abstract class ICancelToken {
  /// Cancel the request
  void cancel([dynamic reason]);
}

abstract class ReadyListState<T> extends Equatable {
  const ReadyListState._();

  /// use this if you need to wait for something
  /// and then use needFirstLoading to load the first state
  const factory ReadyListState.initializing() = Initializing<T>;

  /// this will fire first loading
  const factory ReadyListState.needFirstLoading([ReadyListState<T>? oldState]) =
      NeedFirstLoading<T>;

  /// when there is no data
  const factory ReadyListState.empty() = Empty<T>;

  /// when there is any error
  const factory ReadyListState.error(ErrorDisplayCallBack display) =
      ErrorState<T>;

  /// loading first time
  const factory ReadyListState.firstLoading([ICancelToken? cancelToken]) =
      FirstLoading<T>;

  /// when loading next data
  const factory ReadyListState.loadingNext({
    ICancelToken? cancelToken,
    required Iterable<T> items,
    required int total,
  }) = LoadingNext<T>;

  /// refreshing data
  const factory ReadyListState.refreshing({
    ICancelToken? cancelToken,
    required Iterable<T> items,
    required int total,
  }) = Refreshing<T>;

  /// data loaded
  const factory ReadyListState.loaded({
    required Iterable<T> items,
    required int total,
  }) = Loaded<T>;

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
  });

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
  });

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
  });
}

extension ReadyListStateExtension<T> on ReadyListState<T> {
  Initializing<T>? asInitializing() => whenOrNull(
        initializing: () => this as Initializing<T>,
      );
  NeedFirstLoading<T>? asNeedFirstLoading() => whenOrNull(
        needFirstLoading: (_) => this as NeedFirstLoading<T>,
      );

  Empty<T>? asEmptyState() => whenOrNull(
        empty: () => this as Empty<T>,
      );

  ErrorState<T>? asErrorState() => whenOrNull(
        error: (_) => this as ErrorState<T>,
      );

  FirstLoading<T>? asFirstLoading() => whenOrNull(
        firstLoading: (_) => this as FirstLoading<T>,
      );

  LoadingNext<T>? asLoadingNext() => whenOrNull(
        loadingNext: (_, __, ___) => this as LoadingNext<T>,
      );

  Refreshing<T>? asRefreshing() => whenOrNull(
        refreshing: (_, __, ___) => this as Refreshing<T>,
      );

  Loaded<T>? asLoaded() => whenOrNull(
        loaded: (_, __) => this as Loaded<T>,
      );
}
