part of x_metrics_data;

class XSpacingsData extends Equatable {
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
  })  : none = none ?? XStandardSizes.zero,
        superSmall = superSmall ?? XAuxiliarySizes.x2,
        extraSmall = extraSmall ?? XStandardSizes.x4,
        small = small ?? XStandardSizes.x8,
        semiSmall = semiSmall ?? XStandardSizes.x12,
        medium = medium ?? XStandardSizes.x16,
        semiLarge = semiLarge ?? XStandardSizes.x20,
        large = large ?? XStandardSizes.x24,
        extraLarge = extraLarge ?? XStandardSizes.x32,
        superLarge = superLarge ?? XStandardSizes.x48;

  XEdgeInsetsSpacingsData get xInsets => XEdgeInsetsSpacingsData(this);

  @override
  List<Object?> get props => [
        none.named('none'),
        superSmall.named('superSmall'),
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

class XEdgeInsetsSpacingsData extends Equatable {
  final XSpacingsData _spacing;

  const XEdgeInsetsSpacingsData(this._spacing);

  EdgeInsets get none => EdgeInsets.all(_spacing.none);
  EdgeInsets get superSmall => EdgeInsets.all(_spacing.superSmall);
  EdgeInsets get extraSmall => EdgeInsets.all(_spacing.extraSmall);
  EdgeInsets get small => EdgeInsets.all(_spacing.small);
  EdgeInsets get semiSmall => EdgeInsets.all(_spacing.semiSmall);
  EdgeInsets get medium => EdgeInsets.all(_spacing.medium);
  EdgeInsets get semiLarge => EdgeInsets.all(_spacing.semiLarge);
  EdgeInsets get large => EdgeInsets.all(_spacing.large);
  EdgeInsets get extraLarge => EdgeInsets.all(_spacing.extraLarge);
  EdgeInsets get superLarge => EdgeInsets.all(_spacing.superLarge);

  @override
  List<Object?> get props => [
        _spacing,
      ];
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
