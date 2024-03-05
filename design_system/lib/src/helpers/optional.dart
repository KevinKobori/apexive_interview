class Optional<T> {
  final T? _value;
  final bool _hasValue;

  const Optional._(this._value, this._hasValue);

  // const Optional.none() : this._(null, false);
  const Optional.of(T value) : this._(value, true);

  bool get hasValue => _hasValue;
  T? get value => _value;
}
