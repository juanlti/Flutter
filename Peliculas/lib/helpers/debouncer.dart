import 'dart:async';

class Debouncer<T> {
  Debouncer({required this.duration, this.onValue});

  final Duration duration;
  void Function(T value)? onValue;

  T? _value;
  Timer? _timer;

  T get value => value!;

  set value(T val) {
    _value = val;
    if (_value.toString().length > 3) {
      _timer?.cancel();
      _timer = Timer(duration, () => onValue!(_value!));
    }
  }
}
