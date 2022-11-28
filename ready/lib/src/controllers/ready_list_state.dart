part of controllers;

typedef ErrorDisplayCallBack = String Function(BuildContext context);

abstract class ICancelToken {
  /// Cancel the request
  void cancel([dynamic reason]);
}

mixin IRemoteResult<T> on ReadyListState<T> {}

@freezed
class ReadyListState<T> with _$ReadyListState<T> {
  /// create a loaded state
  static Loaded<T> createLoaded<T>({
    required final Iterable<T> items,
    required final int totalCount,
    final ReadyListState<T>? oldState,
  }) {
    return Loaded(
      items: items,
      totalCount: totalCount,
      oldState: oldState,
    );
  }

  /// creates an empty state
  static Empty<T> createEmpty<T>([ReadyListState<T>? oldState]) {
    return Empty(oldState);
  }

  /// creates an error state
  static ErrorState<T> createError<T>(String error,
      [ReadyListState<T>? oldState]) {
    return ErrorState((ctx) => error, oldState);
  }

  /// creates an error state
  static ErrorState<T> createErrorWith<T>(String Function(BuildContext) display,
      [ReadyListState<T>? oldState]) {
    return ErrorState<T>(display, oldState);
  }

  /// use this if you need to wait for something
  /// and then use needFirstLoading to load the first state
  const factory ReadyListState.initializing({
    @Default(true) bool requestFirstLoading,
    dynamic args,
  }) = Initializing<T>;

  /// when there is no data
  /// *************************************************************************
  @Implements.fromString('IRemoteResult<T>')
  const factory ReadyListState.isEmpty([ReadyListState<T>? oldState]) =
      Empty<T>;

  /// when there is any error
  /// *************************************************************************
  @Implements.fromString('IRemoteResult<T>')
  const factory ReadyListState.error(ErrorDisplayCallBack display,
      [ReadyListState<T>? oldState]) = ErrorState<T>;

  /// data loaded
  /// *************************************************************************
  @Implements.fromString('IRemoteResult<T>')
  const factory ReadyListState.isLoaded({
    required Iterable<T> items,
    required int totalCount,
    ReadyListState<T>? oldState,
  }) = Loaded<T>;

  /// loading first time
  const factory ReadyListState.isLoadingFirst({
    ICancelToken? cancelToken,
    int? pageSize,
  }) = FirstLoading<T>;

  /// when loading next data
  const factory ReadyListState.isLoadingNext({
    ICancelToken? cancelToken,
    int? pageSize,
    required Iterable<T> items,
    required int totalCount,
  }) = LoadingNext<T>;

  /// refreshing data
  const factory ReadyListState.isRefreshing({
    ICancelToken? cancelToken,
    int? pageSize,
    required Iterable<T> items,
    required int totalCount,
  }) = Refreshing<T>;

  /// this will fire next loading
  /// *************************************************************************
  const factory ReadyListState.requestNext({
    int? pageSize,
    required Iterable<T> items,
    required int totalCount,
  }) = RequestNext<T>;

  /// this will fire refresh
  /// *************************************************************************
  const factory ReadyListState.requestRefresh({
    int? pageSize,
    required Iterable<T> items,
    required int totalCount,
  }) = RequestRefresh<T>;

  /// this will fire first loading
  /// *************************************************************************
  const factory ReadyListState.requestFirstLoading({
    int? pageSize,
    ReadyListState<T>? oldState,
  }) = RequestFirstLoading<T>;
}

extension ReadyStateExt<T> on ReadyListController<T> {
  // /// creates  first loading state
  // RequestFirstLoading<T> createRequestFirstLoading([int? pageSize]) {
  //   return RequestFirstLoading<T>(
  //     pageSize: pageSize,
  //     oldState: state,
  //   );
  // }

  // /// emit refresh state
  // RequestRefresh<T> createRequestRefresh({
  //   int? pageSize,
  //   required Iterable<T> items,
  //   required int totalCount,
  // }) {
  //   return RequestRefresh<T>(
  //     pageSize: pageSize,
  //     items: items,
  //     totalCount: totalCount,
  //   );
  // }

  // /// emit next loading state
  // RequestNext<T> createRequestNext({
  //   int? pageSize,
  //   required Iterable<T> items,
  //   required int totalCount,
  // }) {
  //   return RequestNext<T>(
  //     pageSize: pageSize,
  //     items: items,
  //     totalCount: totalCount,
  //   );
  // }
}
