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
      space: {
        const SpaceToken('none'): metrics.spacings.none,
        // const SpaceToken('xxsmall'): metrics.spacings.superSmall,
        SpaceToken.xsmall: metrics.spacings.extraSmall,
        SpaceToken.small: metrics.spacings.small,
        const SpaceToken('ssmall'): metrics.spacings.semiSmall,
        // TODO(all): block access to this 'medium' value
        // SpaceToken.medium: metrics.spacings.medium,
        // const SpaceToken('slarge'): metrics.spacings.semiLarge,
        SpaceToken.large: metrics.spacings.large,
        SpaceToken.xlarge: metrics.spacings.extraLarge,
        SpaceToken.xxlarge: metrics.spacings.superLarge,
      },
      textStyles: {
        const TextStyleToken('heading1'):
            const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        const TextStyleToken('bodyText'): const TextStyle(fontSize: 14),
      },
      radii: {
        const RadiusToken('none'): metrics.radius.none,
        const RadiusToken('xsmall'): metrics.radius.extraSmall,
        RadiusToken.small: metrics.radius.small,
        const RadiusToken('ssmall'): metrics.radius.semiSmall,
        RadiusToken.medium: metrics.radius.medium,
        // const RadiusToken('slarge'): metrics.radius.semiLarge,
        RadiusToken.large: metrics.radius.large,
        // const RadiusToken('xlarge'): metrics.radius.extraLarge,
        // const RadiusToken('xxlarge'): metrics.radius.superLarge,
      },
    );
  }
}
