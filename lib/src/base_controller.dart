abstract class BaseController<State> {
  State get state;
  Stream<State> get stream;
  void emit(State state);
}
