import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:nasa_apod_design_system/src/theme/theme.dart';

class ApodGap extends StatelessWidget {
  final ApodSpacings spacing;

  const ApodGap(this.spacing, {super.key});

  const ApodGap.none({super.key}) : spacing = ApodSpacings.none;

  const ApodGap.extraSmall({super.key}) : spacing = ApodSpacings.extraSmall;

  const ApodGap.small({super.key}) : spacing = ApodSpacings.small;

  const ApodGap.semiSmall({super.key}) : spacing = ApodSpacings.semiSmall;

  const ApodGap.large({super.key}) : spacing = ApodSpacings.large;

  const ApodGap.extraLarge({super.key}) : spacing = ApodSpacings.extraLarge;

  const ApodGap.superLarge({super.key}) : spacing = ApodSpacings.superLarge;

  @override
  Widget build(BuildContext context) {
    final theme = ApodTheme.of(context);
    return Gap(spacing.getSpacing(theme));
  }
}
