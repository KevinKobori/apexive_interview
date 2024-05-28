import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ApodMixLightTheme {
  static MixThemeData data(
    XMetricsData metrics,
  ) {
    return MixThemeData.withMaterial(
      breakpoints: {
        BreakpointToken.xsmall: metrics.breakpoints.extraSmall,
        BreakpointToken.small: metrics.breakpoints.small,
        BreakpointToken.medium: metrics.breakpoints.medium,
        BreakpointToken.large: metrics.breakpoints.large,
      },
      colors: {
        const ColorToken('primary'): Colors.pink,
        const ColorToken('secondary'): Colors.purpleAccent,
      },
      spaces: {
        const SpaceToken('none'): metrics.spacings.none,
        // const SpaceToken('xxsmall'): metrics.spacings.superSmall,
        const SpaceToken('xsmall'): metrics.spacings.extraSmall,
        const SpaceToken('small'): metrics.spacings.small,
        const SpaceToken('ssmall'): metrics.spacings.semiSmall,
        // const SpaceToken('medium'): metrics.spacings.medium,
        // const SpaceToken('slarge'): metrics.spacings.semiLarge,
        const SpaceToken('large'): metrics.spacings.large,
        const SpaceToken('xlarge'): metrics.spacings.extraLarge,
        const SpaceToken('xxlarge'): metrics.spacings.superLarge,
      },
      textStyles: {
        const TextStyleToken('heading1'):
            const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        const TextStyleToken('bodyText'): const TextStyle(fontSize: 14),
      },
      radii: {
        const RadiusToken('none'): metrics.radius.none,
        const RadiusToken('xsmall'): metrics.radius.extraSmall,
        const RadiusToken('small'): metrics.radius.small,
        const RadiusToken('ssmall'): metrics.radius.semiSmall,
        const RadiusToken('medium'): metrics.radius.medium,
        // const RadiusToken('slarge'): metrics.radius.semiLarge,
        const RadiusToken('large'): metrics.radius.large,
        // const RadiusToken('xlarge'): metrics.radius.extraLarge,
        // const RadiusToken('xxlarge'): metrics.radius.superLarge,
      },
    );
  }
}
