part of x_metrics_data;

class XDurationsData extends Equatable {
  final bool areAnimationEnabled;
  final Duration slow;
  final Duration regular;
  final Duration quick;

  const XDurationsData({
    final bool? areAnimationEnabled,
    final Duration? slow,
    final Duration? regular,
    final Duration? quick,
  })  : areAnimationEnabled = areAnimationEnabled ?? true,
        slow =
            regular ?? const Duration(milliseconds: XStandardMilliseconds.x500),
        regular = regular ??
            const Duration(milliseconds: XAuxiliaryMilliseconds.x250),
        quick =
            quick ?? const Duration(milliseconds: XStandardMilliseconds.x100);

  @override
  List<Object?> get props => [
        areAnimationEnabled,
        slow.named('slow'),
        regular.named('regular'),
        quick.named('quick'),
      ];
}
