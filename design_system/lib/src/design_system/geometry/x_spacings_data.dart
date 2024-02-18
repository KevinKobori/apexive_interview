part of x_metrics_data;

class XSpacingsData {
  final double none;
  final double superSmall;
  final double extraSmall;
  final double small;
  final double semiSmall;
  final double medium;
  final double semiLarge;
  final double large;
  final double extraLarge;
  final double superLarge;

  const XSpacingsData({
    final double? none,
    final double? superSmall,
    final double? extraSmall,
    final double? small,
    final double? semiSmall,
    final double? medium,
    final double? semiLarge,
    final double? large,
    final double? extraLarge,
    final double? superLarge,
  })  : none = none ?? XStandardSizes.x0,
        superSmall = superSmall ?? XAuxiliarySizes.x2,
        extraSmall = extraSmall ?? XStandardSizes.x4,
        small = small ?? XStandardSizes.x8,
        semiSmall = semiSmall ?? XStandardSizes.x12,
        medium = medium ?? XStandardSizes.x16,
        semiLarge = semiLarge ?? XStandardSizes.x20,
        large = large ?? XStandardSizes.x24,
        extraLarge = extraLarge ?? XStandardSizes.x32,
        superLarge = superLarge ?? XStandardSizes.x48;
}

enum XSpacing {
  none,
  superSmall,
  extraSmall,
  small,
  semiSmall,
  medium,
  semiLarge,
  large,
  extraLarge,
  superLarge,
}

extension XSpacingExtension on XSpacing {
  double? toDouble(XMetricsData? xMetrics) {
    return switch (this) {
      XSpacing.none => xMetrics?.xSpacings.none,
      XSpacing.superSmall => xMetrics?.xSpacings.superSmall,
      XSpacing.extraSmall => xMetrics?.xSpacings.extraSmall,
      XSpacing.small => xMetrics?.xSpacings.small,
      XSpacing.semiSmall => xMetrics?.xSpacings.semiSmall,
      XSpacing.medium => xMetrics?.xSpacings.medium,
      XSpacing.semiLarge => xMetrics?.xSpacings.semiLarge,
      XSpacing.large => xMetrics?.xSpacings.large,
      XSpacing.extraLarge => xMetrics?.xSpacings.extraLarge,
      XSpacing.superLarge => xMetrics?.xSpacings.superLarge,
    };
  }
}
