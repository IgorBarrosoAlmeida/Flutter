typedef T InstanceCreator<T>();

// Essa classe é um singleton
class DependencyInjector {
  DependencyInjector._();
  static final _singleton = DependencyInjector._();
  factory DependencyInjector() => _singleton;

  final Map<Type, _InstanceGenerator<Object>> _instanceMap = {};

  // register
  void register<T extends Object>(
    InstanceCreator<T> instance, {
    bool isSingleton = true,
  }) {
    _instanceMap[T] = _InstanceGenerator(instance, isSingleton);
  }

  // get
  T get<T extends Object>() {
    final instance = _instanceMap[T]?.getIstance();
    if (instance != null && instance is T) return instance;

    throw Exception('[ERROR] -> Instance ${T.toString()} not found');
  }

  call<T extends Object>() => get<T>();
}

class _InstanceGenerator<T> {
  T? _instance;
  bool _isFirsGet = false;

  final InstanceCreator<T> _instanceCreator;
  _InstanceGenerator(this._instanceCreator, bool isSingleton)
    : _isFirsGet = isSingleton;

  T? getIstance() {
    if (_isFirsGet) {
      _instance = _instanceCreator();
      _isFirsGet = false;
    }

    return _instance ?? _instanceCreator();
  }
}
