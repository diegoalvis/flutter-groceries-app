

class BaseState {
  final StateType type;
  dynamic data;

  BaseState(this.type, {this.data});
}

enum StateType { initial, loading, success, error, navigate }
