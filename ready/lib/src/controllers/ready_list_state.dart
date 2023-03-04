part of controllers;

typedef ErrorDisplayCallBack = String Function(BuildContext context);

abstract class ICancelToken {
  /// Cancel the request
  void cancel([dynamic reason]);
}

@freezed
class CurrentData<T> with _$CurrentData<T> {
  const factory CurrentData({
    required Iterable<T> items,
    required int totalCount,
    int? pageSize,
    dynamic args,
  }) = _CurrentData<T>;
}

@freezed
class ReadyListState<T> with _$ReadyListState<T> {
  /// use this if you need to wait for something
  /// and then use needFirstLoading to load the first state
  const factory ReadyListState.initializing({
    @Default(true) bool requestFirstLoading,
    dynamic args,
  }) = Initializing<T>;

  /// this will fire first loading
  /// *************************************************************************
  const factory ReadyListState.requestFirstLoading({
    int? pageSize,
    CurrentData<T>? currentData,
    dynamic args,
  }) = RequestFirstLoading<T>;

  /// loading first time
  const factory ReadyListState.isLoadingFirst({
    ICancelToken? cancelToken,
    int? pageSize,
    CurrentData<T>? currentData,
    dynamic args,
  }) = FirstLoading<T>;

  /// when there is any error
  /// *************************************************************************
  const factory ReadyListState.error(
    ErrorDisplayCallBack display,
    CurrentData<T>? currentData,
    dynamic args,
  ) = ErrorState<T>;

  /// data loaded
  /// *************************************************************************
  const factory ReadyListState.isLoaded({
    required Iterable<T> items,
    required int totalCount,
    int? pageSize,
    dynamic args,
  }) = Loaded<T>;

  /// this will fire next loading
  /// *************************************************************************
  const factory ReadyListState.requestNext({
    int? pageSize,
    required CurrentData<T> currentData,
    dynamic args,
  }) = RequestNext<T>;

  /// when loading next data
  const factory ReadyListState.isLoadingNext({
    ICancelToken? cancelToken,
    int? pageSize,
    required CurrentData<T> currentData,
    dynamic args,
  }) = LoadingNext<T>;

  /// this will fire refresh
  /// *************************************************************************
  const factory ReadyListState.requestRefresh({
    int? pageSize,
    required CurrentData<T> currentData,
    dynamic args,
  }) = RequestRefresh<T>;

  /// refreshing data
  const factory ReadyListState.isRefreshing({
    ICancelToken? cancelToken,
    int? pageSize,
    required CurrentData<T> currentData,
    dynamic args,
  }) = Refreshing<T>;
}
