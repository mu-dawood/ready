part of controllers;

abstract class ReadyListController<T, Args> {
  /// The current state
  ReadyListState<T, Args> get state;

  /// The stream to listen please use broadcast stream to allow multiple listeners
  Stream<ReadyListState<T, Args>> get stream;

  /// emitting new state to stream
  void emit(ReadyListState<T, Args> state);
}
