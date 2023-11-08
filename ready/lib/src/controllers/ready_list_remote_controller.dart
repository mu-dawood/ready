part of controllers;

class RemoteResult<T> {
  final ErrorDisplayCallBack? errorDisplay;
  final Iterable<T> items;
  final int totalCount;
  RemoteResult.error(ErrorDisplayCallBack display)
      : errorDisplay = display,
        items = [],
        totalCount = 0;

  RemoteResult.success(this.items, this.totalCount)
      : assert(totalCount >= items.length),
        errorDisplay = null;
}

mixin ReadyRemoteControllerMixin<T, S extends BaseReadyListState<T>>
    on ReadyListController<T, S> {
  /// load data from  remote source
  Future<RemoteResult<T>> loadData(int skip, int? pageSize,
      [ICancelToken? cancelToken]);

  @override
  void emit(S state) {
    switch (state.stateType) {
      case StateType.requestFirstLoading:
        _firstLoading(state);
        break;
      case StateType.requestNextLoading:
        _loadNext(state);
        break;
      case StateType.requestRefreshing:
        _refresh(state);
        break;
      default:
        break;
    }
    super.emit(state);
  }

  ICancelToken? generateCancelToken() => null;
  void _firstLoading(S state) async {
    var cancelToken = generateCancelToken();
    isLoadingFirstTime();
    try {
      var results = await loadData(0, state.pageSize, cancelToken);
      if (results.errorDisplay == null) {
        loaded(items: results.items, totalCount: results.totalCount);
      } else {
        error(display: results.errorDisplay!);
      }
    } catch (e) {
      error(display: (context) => e.toString());
    }
  }

  void _loadNext(S state) async {
    var cancelToken = generateCancelToken();
    isLoadingFirstTime();
    try {
      var results = await loadData(
        state.items.length,
        state.pageSize,
        cancelToken,
      );
      if (results.errorDisplay == null) {
        loaded(
          items: [...state.items, ...results.items],
          totalCount: results.totalCount,
        );
      } else {
        loaded(
          items: state.items,
          totalCount: state.totalCount,
        );
      }
    } catch (e) {
      loaded(
        items: state.items,
        totalCount: state.totalCount,
      );
    }
  }

  void _refresh(S state) async {
    var cancelToken = generateCancelToken();
    isLoadingFirstTime();
    try {
      var results = await loadData(
        0,
        state.items.length,
        cancelToken,
      );
      if (results.errorDisplay == null) {
        loaded(
          items: results.items,
          totalCount: results.totalCount,
        );
      } else {
        loaded(
          items: state.items,
          totalCount: state.totalCount,
        );
      }
    } catch (e) {
      loaded(
        items: state.items,
        totalCount: state.totalCount,
      );
    }
  }
}
