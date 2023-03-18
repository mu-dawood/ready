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
  }) = _CurrentData<T>;
}

@freezed
class ReadyListState<T, Args> with _$ReadyListState<T, Args> {
  /// use this if you need to wait for something
  /// and then use needFirstLoading to load the first state
  const factory ReadyListState.initializing({
    @Default(true) bool requestFirstLoading,
    required Args args,
  }) = Initializing<T, Args>;

  /// this will fire first loading
  /// *************************************************************************
  const factory ReadyListState.requestFirstLoading({
    int? pageSize,
    CurrentData<T>? currentData,
    required Args args,
  }) = RequestFirstLoading<T, Args>;

  /// loading first time
  const factory ReadyListState.isLoadingFirst({
    ICancelToken? cancelToken,
    int? pageSize,
    CurrentData<T>? currentData,
    required Args args,
  }) = FirstLoading<T, Args>;

  /// when there is any error
  /// *************************************************************************
  const factory ReadyListState.error({
    required Args args,
    required ErrorDisplayCallBack display,
    CurrentData<T>? currentData,
  }) = ErrorState<T, Args>;

  /// data loaded
  /// *************************************************************************
  const factory ReadyListState.isLoaded({
    required Iterable<T> items,
    required int totalCount,
    int? pageSize,
    required Args args,
  }) = Loaded<T, Args>;

  /// this will fire next loading
  /// *************************************************************************
  const factory ReadyListState.requestNext({
    int? pageSize,
    required CurrentData<T> currentData,
    required Args args,
  }) = RequestNext<T, Args>;

  /// when loading next data
  const factory ReadyListState.isLoadingNext({
    ICancelToken? cancelToken,
    int? pageSize,
    required CurrentData<T> currentData,
    required Args args,
  }) = LoadingNext<T, Args>;

  /// this will fire refresh
  /// *************************************************************************
  const factory ReadyListState.requestRefresh({
    int? pageSize,
    required CurrentData<T> currentData,
    required Args args,
  }) = RequestRefresh<T, Args>;

  /// refreshing data
  const factory ReadyListState.isRefreshing({
    ICancelToken? cancelToken,
    int? pageSize,
    required CurrentData<T> currentData,
    required Args args,
  }) = Refreshing<T, Args>;
}
