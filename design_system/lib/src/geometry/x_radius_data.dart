part of x_metrics_data;

class XRadiusData extends Equatable {
  final Radius none;
  final Radius extraSmall;
  final Radius small;
  final Radius semiSmall;
  final Radius medium;
  final Radius semiLarge;
  final Radius large;
  final Radius extraLarge;
  final Radius superLarge;

  const XRadiusData({
    final Radius? none,
    final Radius? extraSmall,
    final Radius? small,
    final Radius? semiSmall,
    final Radius? medium,
    final Radius? semiLarge,
    final Radius? large,
    final Radius? extraLarge,
    final Radius? superLarge,
  })  : none = none ?? Radius.zero,
        extraSmall = extraSmall ?? const Radius.circular(XStandardSizes.x4),
        small = small ?? const Radius.circular(XStandardSizes.x8),
        semiSmall = semiSmall ?? const Radius.circular(XStandardSizes.x12),
        medium = medium ?? const Radius.circular(XStandardSizes.x16),
        semiLarge = semiLarge ?? const Radius.circular(XStandardSizes.x20),
        large = large ?? const Radius.circular(XStandardSizes.x24),
        extraLarge = extraLarge ?? const Radius.circular(XStandardSizes.x32),
        superLarge = superLarge ?? const Radius.circular(XStandardSizes.x48);

  XBorderRadiusData get xBorder => XBorderRadiusData(this);

  @override
  List<Object?> get props => [
        none.named('none'),
        extraSmall.named('extraSmall'),
        small.named('small'),
        semiSmall.named('semiSmall'),
        medium.named('medium'),
        semiLarge.named('semiLarge'),
        large.named('large'),
        extraLarge.named('extraLarge'),
        superLarge.named('superLarge'),
      ];
}
