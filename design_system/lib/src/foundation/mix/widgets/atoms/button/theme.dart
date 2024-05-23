import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

final theme = MixThemeData(
  colors: {
    const ColorToken('primary'): Colors.blue,
    const ColorToken('secondary'): Colors.green,
  },
  textStyles: {
    const TextStyleToken('heading1'):
        const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    const TextStyleToken('bodyText'): const TextStyle(fontSize: 14),
  },
  space: {
    const SpaceToken('superSmall'): 2,
    const SpaceToken('extraSmall'): 4,
    const SpaceToken('small'): 8,
    const SpaceToken('semiSmall'): 12,
    const SpaceToken('medium'): 16,
    const SpaceToken('semiLarge'): 20,
    const SpaceToken('large'): 24,
    const SpaceToken('extraLarge'): 32,
    const SpaceToken('superLarge'): 48,
    const SpaceToken('xxsmall'): 2,
    // SpaceToken.xsmall: 4,
    // SpaceToken.small: 8,
    // const SpaceToken('semiSmall'): 12,
    // SpaceToken.medium: 16,
    // const SpaceToken('semiLarge'): 20,
    // SpaceToken.large: 24,
    // SpaceToken.xlarge: 32,
    // SpaceToken.xxlarge: 48,
  },
  radii: {
    RadiusToken.small: const Radius.circular(8),
    RadiusToken.medium: const Radius.circular(16),
    RadiusToken.large: const Radius.circular(24),
  },
  breakpoints: {
    BreakpointToken.xsmall: const Breakpoint(maxWidth: 599),
    BreakpointToken.small: const Breakpoint(minWidth: 600, maxWidth: 1023),
    BreakpointToken.medium: const Breakpoint(minWidth: 1024, maxWidth: 1439),
    BreakpointToken.large:
        const Breakpoint(minWidth: 1440, maxWidth: double.infinity),
  },
);
