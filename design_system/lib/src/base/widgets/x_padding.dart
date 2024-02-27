import 'package:flutter/material.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class XPadding extends StatelessWidget {
  final XEdgeInsets? xPadding;
  final EdgeInsets? padding;
  final Widget? child;

  const XPadding({
    required this.xPadding,
    super.key,
    this.child,
  }) : padding = null;

  const XPadding.custom({
    required this.padding,
    super.key,
    this.child,
  }) : xPadding = null;

  @override
  Widget build(BuildContext context) {
    final XMetricsData? xMetrics = Theme.of(context).extension<XMetricsData>();

    return Padding(
      padding: xPadding?.toEdgeInsets(xMetrics) ?? padding ?? EdgeInsets.zero,
      child: child,
    );
  }
}
