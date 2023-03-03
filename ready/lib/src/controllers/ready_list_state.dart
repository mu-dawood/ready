part of controllers;

typedef ErrorDisplayCallBack = String Function(BuildContext context);

abstract class ICancelToken {
  /// Cancel the request
  void cancel([dynamic reason]);
}

abstract class ILoaded<T> {
  Iterable<T> get items;
  int get totalCount;
  Loaded<T> call() => Loaded(items: items, totalCount: totalCount);
}

abstract class IRequestNext<T> {
  ILoaded<T> get previousState;
  int? get pageSize;

  RequestNext<T> call() =>
      RequestNext(pageSize: pageSize, previousState: previousState);
}

abstract class IRequestRefresh<T> {
  ILoaded<T> get previousState;
  int? get pageSize;

  RequestRefresh<T> call() =>
      RequestRefresh(pageSize: pageSize, previousState: previousState);
}

abstract class IRequestFirstLoading<T> {
  ReadyListState<T>? get previousState;
  int? get pageSize;

  RequestFirstLoading<T> call() =>
      RequestFirstLoading(pageSize: pageSize, previousState: previousState);
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
  @With.fromString("IRequestFirstLoading<T>")
  const factory ReadyListState.requestFirstLoading({
    int? pageSize,
    ReadyListState<T>? previousState,
  }) = RequestFirstLoading<T>;

  /// loading first time
  const factory ReadyListState.isLoadingFirst({
    ICancelToken? cancelToken,
    int? pageSize,
    required IRequestFirstLoading<T> previousState,
  }) = FirstLoading<T>;

  /// when there is any error
  /// *************************************************************************
  const factory ReadyListState.error(
    ErrorDisplayCallBack display,
    int? pageSize,
  ) = ErrorState<T>;

  /// data loaded
  /// *************************************************************************
  @With.fromString("ILoaded<T>")
  const factory ReadyListState.isLoaded({
    required Iterable<T> items,
    required int totalCount,
    int? pageSize,
  }) = Loaded<T>;

  /// this will fire next loading
  /// *************************************************************************
  @With.fromString("IRequestNext<T>")
  const factory ReadyListState.requestNext({
    int? pageSize,
    required ILoaded<T> previousState,
  }) = RequestNext<T>;

  /// when loading next data
  const factory ReadyListState.isLoadingNext({
    ICancelToken? cancelToken,
    required IRequestNext<T> previousState,
  }) = LoadingNext<T>;

  /// this will fire refresh
  /// *************************************************************************
  @With.fromString("IRequestRefresh<T>")
  const factory ReadyListState.requestRefresh({
    int? pageSize,
    required ILoaded<T> previousState,
  }) = RequestRefresh<T>;

  /// refreshing data
  const factory ReadyListState.isRefreshing({
    ICancelToken? cancelToken,
    required IRequestRefresh<T> previousState,
  }) = Refreshing<T>;
}
