part of ready_list;

abstract class ICancelToken {
  /// Cancel the request
  void cancel([dynamic reason]);
}

@freezed
class ReadylistResponse<T> with _$ReadylistResponse<T> {
  factory ReadylistResponse.success({
    required Iterable<T> items,
    required int total,
  }) = _Success;

  factory ReadylistResponse.cancel() = _Cancel;
  factory ReadylistResponse.error(String message) = _Error;
}

@freezed
class ReadyListState<T> with _$ReadyListState<T> {
  /// state when first load
  factory ReadyListState.needIntialLoading() = _ReadyListNeedIntialLoading;

  /// state when first load
  factory ReadyListState.intialLoading([ICancelToken? cancelToken]) = _ReadyListIntialLoading;

  /// state when items loaded
  const factory ReadyListState.items({
    required Iterable<T> items,
    required int total,
    @Default(true) bool intial,
  }) = _ReadyListItems;

  /// state when no data
  factory ReadyListState.empty() = _ReadyListEmpty;

  /// state when an error happened
  const factory ReadyListState.error(String message) = _ReadyListError;

  /// state when refreshing
  factory ReadyListState.refreshing({
    required Iterable<T> items,
    required int total,
    ICancelToken? cancelToken,
  }) = _ReadyListRefreshing;

  /// state when loading next page
  factory ReadyListState.loadingNext({
    required Iterable<T> items,
    required int total,
    ICancelToken? cancelToken,
  }) = _ReadyListLoadingNext;
}
