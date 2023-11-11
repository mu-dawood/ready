// ignore_for_file: public_member_api_docs, sort_constructors_first
part of controllers;

typedef ErrorDisplayCallBack = String Function(BuildContext context);

abstract class ICancelToken {
  /// Cancel the request
  void cancel([dynamic reason]);
}

enum StateType {
  initial,
  requestFirstLoading,
  isLoadingFirstTime,
  loaded,
  error,
  requestNextLoading,
  requestRefreshing,
  isLoadingNext,
  isRefreshing,
}

mixin ICopyWith<T, State extends BaseReadyListState<T>>
    on BaseReadyListState<T> {
  State copyWith({
    Iterable<T>? items,
    int? totalCount,
    int? pageSize,
    ErrorDisplayCallBack? errorDisplay,
    StateType? stateType,
    ICancelToken? cancelToken,
  });
}

abstract class BaseReadyListState<T> extends Equatable {
  final Iterable<T> items;
  final int totalCount;
  final int pageSize;
  final ErrorDisplayCallBack? errorDisplay;
  final StateType stateType;
  final ICancelToken? cancelToken;
  const BaseReadyListState({
    required this.items,
    required this.totalCount,
    required this.pageSize,
    required this.errorDisplay,
    required this.stateType,
    required this.cancelToken,
  });

  @override
  List<Object?> get props => [
        items,
        totalCount,
        pageSize,
        errorDisplay,
        stateType,
      ];
}

class ReadyListState<T> extends BaseReadyListState<T>
    with ICopyWith<T, ReadyListState<T>> {
  const ReadyListState({
    super.items = const [],
    super.totalCount = 0,
    super.pageSize = 20,
    super.errorDisplay,
    required super.stateType,
    super.cancelToken,
  });

  const ReadyListState.initial({
    super.items = const [],
    super.totalCount = 0,
    super.pageSize = 20,
    super.errorDisplay,
  })  : assert(items.length <= totalCount),
        super(cancelToken: null, stateType: StateType.initial);

  @override
  ReadyListState<T> copyWith({
    Iterable<T>? items,
    int? totalCount,
    int? pageSize,
    ErrorDisplayCallBack? errorDisplay,
    StateType? stateType,
    ICancelToken? cancelToken,
  }) {
    return ReadyListState<T>(
      items: items ?? this.items,
      totalCount: totalCount ?? this.totalCount,
      pageSize: pageSize ?? this.pageSize,
      errorDisplay: errorDisplay ?? this.errorDisplay,
      stateType: stateType ?? this.stateType,
      cancelToken: cancelToken ?? this.cancelToken,
    );
  }
}
