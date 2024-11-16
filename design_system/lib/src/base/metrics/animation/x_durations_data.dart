part of x_metrics_data;

class XDurationsData extends Equatable {
  final bool? _areAnimationEnabled;
  final Duration? _slow;
  final Duration? _regular;
  final Duration? _quick;

  XDurationsData({
    final Optional<bool?>? areAnimationEnabled,
    final Optional<Duration?>? slow,
    final Optional<Duration?>? regular,
    final Optional<Duration?>? quick,
  })  : _areAnimationEnabled =
            areAnimationEnabled == null ? true : areAnimationEnabled.value,
        _slow = slow == null
            ? const Duration(milliseconds: XStandardMilliseconds.x500)
            : slow.value,
        _regular = regular == null
            ? const Duration(milliseconds: XStandardMilliseconds.x300)
            : regular.value,
        _quick = quick == null
            ? const Duration(milliseconds: XStandardMilliseconds.x100)
            : quick.value;
  // TODO: NOW - CHANGE UnsupportedError FOR UnsupportedError
  bool get areAnimationEnabled =>
      _areAnimationEnabled ??
      (throw UnsupportedError(getUnsupportedErrorMessage(
          attribute: 'areAnimationEnabled', location: 'durations')));
  Duration get slow =>
      _slow ??
      (throw UnsupportedError(getUnsupportedErrorMessage(
          attribute: 'slow', location: 'durations')));
  Duration get regular =>
      _regular ??
      (throw UnsupportedError(getUnsupportedErrorMessage(
          attribute: 'regular', location: 'durations')));
  Duration get quick =>
      _quick ??
      (throw UnsupportedError(getUnsupportedErrorMessage(
          attribute: 'quick', location: 'durations')));
  @override
  List<Object?> get props => [
        areAnimationEnabled,
        slow.named('slow'),
        regular.named('regular'),
        quick.named('quick'),
      ];

  // @override
  // String toString() => '''
  //   XDurationsData(
  //     areAnimationEnabled: $areAnimationEnabled,
  //     slow: $slow,
  //     regular: $regular,
  //     quick: $quick,
  //   )
  // ''';
}
