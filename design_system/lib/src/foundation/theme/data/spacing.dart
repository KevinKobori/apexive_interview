import 'package:flutter/material.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ApodSpacingsData extends XSpacingsData {
  const ApodSpacingsData()
      : super(
          none: 0,
          extraSmall: 4,
          small: 8,
          semiSmall: 12,
          large: 24,
          extraLarge: 32,
          superLarge: 48,
        );

  @override
  double get superSmall => throw UnimplementedError(
      'superSmall is not available in ApodSpacingsData');

  @override
  double get medium =>
      throw UnimplementedError('medium is not available in ApodSpacingsData');

  @override
  double get semiLarge => throw UnimplementedError(
      'semiLarge is not available in ApodSpacingsData');

  @override
  ApodEdgeInsetsSpacingsData get xInsets => ApodEdgeInsetsSpacingsData(this);
}

class ApodEdgeInsetsSpacingsData extends XEdgeInsetsSpacingsData {
  const ApodEdgeInsetsSpacingsData(ApodSpacingsData spacing) : super(spacing);

  @override
  EdgeInsets get superSmall => throw UnimplementedError(
      'superSmall is not available in ApodEdgeInsetsSpacingsData');

  @override
  EdgeInsets get medium => throw UnimplementedError(
      'medium is not available in ApodEdgeInsetsSpacingsData');

  @override
  EdgeInsets get semiLarge => throw UnimplementedError(
      'semiLarge is not available in ApodEdgeInsetsSpacingsData');
}

enum ApodSpacing {
  none,
  extraSmall,
  small,
  semiSmall,
  large,
  extraLarge,
  superLarge,
}

extension AppSpacingsExtension on ApodSpacing {
  double toDouble(ApodMetricsData theme) => switch (this) {
        ApodSpacing.none => theme.spacings.none,
        ApodSpacing.extraSmall => theme.spacings.extraSmall,
        ApodSpacing.small => theme.spacings.small,
        ApodSpacing.semiSmall => theme.spacings.semiSmall,
        ApodSpacing.large => theme.spacings.large,
        ApodSpacing.extraLarge => theme.spacings.extraLarge,
        ApodSpacing.superLarge => theme.spacings.superLarge,
      };
}
