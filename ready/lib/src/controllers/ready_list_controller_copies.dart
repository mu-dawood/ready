part of controllers;

class _ReadyListControllerWithHandler<T> extends ReadyListController<T> {
  final ReadyListController<T> parent;
  @override
  final ListLoadingHandler<T>? handler;
  _ReadyListControllerWithHandler(this.parent, this.handler);

  @override
  void emit(ReadyListState<T> state) => parent.emit(state);
  @override
  ReadyListState<T> get state => parent.state;
  @override
  Stream<ReadyListState<T>> get stream => parent.stream;
}
