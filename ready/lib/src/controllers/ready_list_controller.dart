part of controllers;

abstract class ReadyListController<T> {
  /// The current state
  ReadyListState<T> get state;

  /// The stream to listen please use broadcast stream to allow multiple listeners
  Stream<ReadyListState<T>> get stream;

  /// emitting new state to stream
  void emit(ReadyListState<T> state);
}
