import 'package:flutter/material.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ApodSpacingsData extends XSpacingsData {
  const ApodSpacingsData()
      : super(
          none: 0,
          // TODO: NOW
          // superSmall: -1,
          extraSmall: 4,
          small: 8,
          semiSmall: 12,
          large: 22,
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
  ApodEdgeInsetsSpacingsData get edgeInsets => ApodEdgeInsetsSpacingsData(this);
}

class ApodEdgeInsetsSpacingsData extends XEdgeInsetsData {
  const ApodEdgeInsetsSpacingsData(ApodSpacingsData spacing) : super(spacing);

  @override
  EdgeInsets get allSuperSmall => throw UnimplementedError(
      'superSmall is not available in ApodEdgeInsetsSpacingsData');

  @override
  EdgeInsets get allMedium => throw UnimplementedError(
      'medium is not available in ApodEdgeInsetsSpacingsData');

  @override
  EdgeInsets get allSemiLarge => throw UnimplementedError(
      'semiLarge is not available in ApodEdgeInsetsSpacingsData');
}

// enum ApodSpacing {
//   none,
//   extraSmall,
//   small,
//   semiSmall,
//   large,
//   extraLarge,
//   superLarge,
// }

// extension AppSpacingsExtension on ApodSpacing {
//   double toDouble(XMetricsData theme) => switch (this) {
//         ApodSpacing.none => theme.spacings.none,
//         ApodSpacing.extraSmall => theme.spacings.extraSmall,
//         ApodSpacing.small => theme.spacings.small,
//         ApodSpacing.semiSmall => theme.spacings.semiSmall,
//         metrics.xSpacings.large => theme.spacings.large,
//         ApodSpacing.extraLarge => theme.spacings.extraLarge,
//         ApodSpacing.superLarge => theme.spacings.superLarge,
//       };
// }
