part of controllers;

typedef ErrorDisplayCallBack = String Function(BuildContext context);

abstract class ICancelToken {
  /// Cancel the request
  void cancel([dynamic reason]);
}

mixin IRemoteResult<T> on ReadyListState<T> {}
mixin ILoadedState<T> on ReadyListState<T> {
  Iterable<T> get items;
  int get total;
}

mixin IFirstLoadingRequest<T> on ReadyListState<T> {
  int? get pageSize;
  ReadyListState<T> get oldState;
}
mixin ILoadingNextRequest<T> on ReadyListState<T> {
  int? get pageSize;
  ILoadedState<T> get oldState;
}
mixin IRefreshRequest<T> on ReadyListState<T> {
  int? get pageSize;
  ILoadedState<T> get oldState;
}

@freezed
class ReadyListState<T> with _$ReadyListState<T> {
  /// use this if you need to wait for something
  /// and then use needFirstLoading to load the first state
  const factory ReadyListState.initializing() = Initializing<T>;

  /// when there is no data
  @Implements<IRemoteResult<T>>()
  const factory ReadyListState.isEmpty([ReadyListState<T>? oldState]) =
      Empty<T>;

  /// when there is any error
  @Implements<IRemoteResult<T>>()
  const factory ReadyListState.error(ErrorDisplayCallBack display,
      [ReadyListState<T>? oldState]) = ErrorState<T>;

  /// loading first time
  const factory ReadyListState.isLoadingFirst({
    ICancelToken? cancelToken,
    required IFirstLoadingRequest<T> oldState,
  }) = FirstLoading<T>;

  /// when loading next data
  const factory ReadyListState.isLoadingNext({
    ICancelToken? cancelToken,
    required ILoadingNextRequest<T> oldState,
  }) = LoadingNext<T>;

  /// refreshing data
  const factory ReadyListState.isRefreshing({
    ICancelToken? cancelToken,
    required IRefreshRequest<T> oldState,
  }) = Refreshing<T>;

  /// data loaded
  @Implements<IRemoteResult<T>>()
  @Implements<ILoadedState<T>>()
  const factory ReadyListState.isLoaded({
    required Iterable<T> items,
    required int total,
    ReadyListState<T>? oldState,
  }) = Loaded<T>;

  /// this will fire next loading
  @Implements<ILoadingNextRequest<T>>()
  const factory ReadyListState.requestNext({
    int? pageSize,
    required ILoadedState<T> oldState,
  }) = RequestNext<T>;

  /// this will fire refresh
  @Implements<IRefreshRequest<T>>()
  const factory ReadyListState.requestRefresh({
    int? pageSize,
    required ILoadedState<T> oldState,
  }) = RequestRefresh<T>;

  /// this will fire first loading
  @Implements<IFirstLoadingRequest<T>>()
  const factory ReadyListState.requestFirstLoading({
    int? pageSize,
    required ReadyListState<T> oldState,
  }) = RequestFirstLoading<T>;
}

extension ReadyStateExt<T> on ReadyListController<T> {
  /// emit first loading state
  void requestFirstLoading([int? pageSize]) {
    emit(ReadyListState.requestFirstLoading(
      pageSize: pageSize,
      oldState: state,
    ));
  }

  /// create a loaded state
  Loaded<T> loaded({
    required final Iterable<T> items,
    required final int total,
    final ReadyListState<T>? oldState,
  }) {
    return Loaded(
      items: items,
      total: total,
      oldState: oldState,
    );
  }

  /// creates an empty state
  Empty<T> empty([ReadyListState<T>? oldState]) {
    return Empty(oldState);
  }

  /// creates an error state
  ErrorState<T> error(String error, [ReadyListState<T>? oldState]) {
    return ErrorState((ctx) => error, oldState);
  }

  /// creates an error state
  ErrorState<T> errorWith(String Function(BuildContext) display,
      [ReadyListState<T>? oldState]) {
    return ErrorState(display, oldState);
  }

  /// emit refresh state
  void requestRefresh([int? pageSize]) {
    state.maybeMap(
      isLoaded: (value) {
        emit(
            ReadyListState.requestRefresh(pageSize: pageSize, oldState: value));
      },
      orElse: () => throw Exception(
          'requestRefresh can only be called when state is Loaded'),
    );
  }

  /// emit next loading state
  void requestNext([int? pageSize]) {
    state.maybeMap(
      isLoaded: (value) {
        emit(ReadyListState.requestNext(
          pageSize: pageSize,
          oldState: value,
        ));
      },
      orElse: () => throw Exception(
          'requestRefresh can only be called when state is Loaded'),
    );
  }
}
