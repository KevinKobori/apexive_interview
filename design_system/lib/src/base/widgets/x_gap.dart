import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class XGap extends StatelessWidget {
  final XSpacing? xSpacing;
  final double? spacing;

  const XGap(
    this.xSpacing, {
    super.key,
  }) : spacing = null;

  const XGap.custom(
    this.spacing, {
    super.key,
  }) : xSpacing = null;

  const XGap.none({super.key})
      : spacing = null,
        xSpacing = XSpacing.none;

  const XGap.extraSmall({super.key})
      : spacing = null,
        xSpacing = XSpacing.extraSmall;

  const XGap.small({super.key})
      : spacing = null,
        xSpacing = XSpacing.small;

  const XGap.semiSmall({super.key})
      : spacing = null,
        xSpacing = XSpacing.semiSmall;

  const XGap.medium({super.key})
      : spacing = null,
        xSpacing = XSpacing.medium;

  const XGap.semiLarge({super.key})
      : spacing = null,
        xSpacing = XSpacing.semiLarge;

  const XGap.large({super.key})
      : spacing = null,
        xSpacing = XSpacing.large;

  const XGap.extraLarge({super.key})
      : spacing = null,
        xSpacing = XSpacing.extraLarge;

  const XGap.superLarge({super.key})
      : spacing = null,
        xSpacing = XSpacing.superLarge;

  @override
  Widget build(BuildContext context) {
    final XMetricsData? xMetrics = Theme.of(context).extension<XMetricsData>();

    return Gap(xSpacing?.toDouble(xMetrics) ?? spacing ?? XStandardSizes.zero);
  }
}
