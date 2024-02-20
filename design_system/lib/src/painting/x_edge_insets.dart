import 'package:flutter/material.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class XEdgeInsets {
  final XSpacing left;
  final XSpacing top;
  final XSpacing right;
  final XSpacing bottom;

  const XEdgeInsets.all(XSpacing value)
      : left = value,
        top = value,
        right = value,
        bottom = value;

  const XEdgeInsets.symmetric({
    XSpacing vertical = XSpacing.none,
    XSpacing horizontal = XSpacing.none,
  })  : left = horizontal,
        top = vertical,
        right = horizontal,
        bottom = vertical;

  const XEdgeInsets.only({
    this.left = XSpacing.none,
    this.top = XSpacing.none,
    this.right = XSpacing.none,
    this.bottom = XSpacing.none,
  });

  EdgeInsets toEdgeInsets(XMetricsData? xMetrics) {
    return EdgeInsets.only(
      left: left.toDouble(xMetrics) ?? XStandardSizes.zero,
      top: top.toDouble(xMetrics) ?? XStandardSizes.zero,
      right: right.toDouble(xMetrics) ?? XStandardSizes.zero,
      bottom: bottom.toDouble(xMetrics) ?? XStandardSizes.zero,
    );
  }
}
