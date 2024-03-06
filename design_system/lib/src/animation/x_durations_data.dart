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

  bool get areAnimationEnabled =>
      _areAnimationEnabled ??
      (throw UnimplementedError(
          'areAnimationEnabled is not implemented in metrics.durations'));
  Duration get slow =>
      _slow ??
      (throw UnimplementedError(
          'slow is not implemented in metrics.durations'));
  Duration get regular =>
      _regular ??
      (throw UnimplementedError(
          'regular is not implemented in metrics.durations'));
  Duration get quick =>
      _quick ??
      (throw UnimplementedError(
          'quick is not implemented in metrics.durations'));

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
