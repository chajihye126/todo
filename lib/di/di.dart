class DI {
  static final DI _instance = DI._internal();
  factory DI() => _instance;

  final Map<Type, dynamic> _di = {};

  void set<T>(T di) {
    _di[T] = di;
  }

  T get<T>() {
    return _di[T] as T;
  }

  DI._internal();
}