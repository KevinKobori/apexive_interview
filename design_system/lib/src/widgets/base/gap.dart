import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:nasa_apod_design_system/src/theme/theme.dart';

enum AppGapSize {
  none,
  extraSmall,
  small,
  semiSmall,
  large,
  extraLarge,
  superLarge,
}

extension AppGapSizeExtension on AppGapSize {
  double getSpacing(AppThemeData theme) {
    switch (this) {
      case AppGapSize.none:
        return 0;
      case AppGapSize.extraSmall:
        return theme.spacing.extraSmall;
      case AppGapSize.small:
        return theme.spacing.small;
      case AppGapSize.semiSmall:
        return theme.spacing.semiSmall;
      case AppGapSize.large:
        return theme.spacing.large;
      case AppGapSize.extraLarge:
        return theme.spacing.extraLarge;
      case AppGapSize.superLarge:
        return theme.spacing.superLarge;
    }
  }
}

class AppGap extends StatelessWidget {
  const AppGap(
    this.size, {
    super.key,
  });

  const AppGap.extraSmall({
    super.key,
  }) : size = AppGapSize.extraSmall;

  const AppGap.small({
    super.key,
  }) : size = AppGapSize.small;

  const AppGap.semiSmall({
    super.key,
  }) : size = AppGapSize.semiSmall;

  const AppGap.large({
    super.key,
  }) : size = AppGapSize.large;

  const AppGap.extraLarge({
    super.key,
  }) : size = AppGapSize.extraLarge;

  const AppGap.superLarge({
    super.key,
  }) : size = AppGapSize.superLarge;

  final AppGapSize size;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Gap(size.getSpacing(theme));
  }
}
