import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ApodGap extends StatelessWidget {
  final ApodSpacing spacing;

  const ApodGap(this.spacing, {super.key});

  const ApodGap.none({super.key}) : spacing = ApodSpacing.none;

  const ApodGap.extraSmall({super.key}) : spacing = ApodSpacing.extraSmall;

  const ApodGap.small({super.key}) : spacing = ApodSpacing.small;

  const ApodGap.semiSmall({super.key}) : spacing = ApodSpacing.semiSmall;

  const ApodGap.large({super.key}) : spacing = ApodSpacing.large;

  const ApodGap.extraLarge({super.key}) : spacing = ApodSpacing.extraLarge;

  const ApodGap.superLarge({super.key}) : spacing = ApodSpacing.superLarge;

  @override
  Widget build(BuildContext context) {
    final theme = ApodTheme.of(context);
    return Gap(spacing.getSpacing(theme));
  }
}
