class XAttribute<T> {
  final T? _value;
  final bool _hasValue;

  const XAttribute._(this._value, this._hasValue);

  const XAttribute.blocked() : this._(null, true);
  const XAttribute.of(T value) : this._(value, true);

  bool get hasValue => _hasValue;
  T? get value => _value;
}
