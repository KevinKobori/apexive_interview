library x_metrics_data;

import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

part '../animation/x_durations_data.dart';
part '../geometry/x_elevations_data.dart';
part '../geometry/x_radius_data.dart';
part '../geometry/x_spacings_data.dart';
part '../painting/x_border_radius_data.dart';
part '../painting/x_box_shadows_data.dart';
part '../painting/x_shapes_data.dart';

class XMetricsData extends ThemeExtension<XMetricsData> {
  final XDurationsData xDurations;
  final XElevationsData xElevations;
  final XRadiusData xRadius;
  final XBoxShadowsData xBoxShadows;
  final XSpacingsData xSpacings;

  XMetricsData({
    final XDurationsData? xDurations,
    final XElevationsData? xElevationSizes,
    final XRadiusData? xRadius,
    final XBoxShadowsData? xBoxShadows,
    final XSpacingsData? xSpacings,
  })  : xDurations = xDurations ?? const XDurationsData(),
        xElevations = xElevationSizes ?? const XElevationsData(),
        xRadius = xRadius ?? const XRadiusData(),
        xBoxShadows = xBoxShadows ?? const XBoxShadowsData(),
        xSpacings = xSpacings ?? const XSpacingsData();

  @override
  ThemeExtension<XMetricsData> lerp(
      ThemeExtension<XMetricsData>? other, double t) {
    if (other is! XMetricsData) {
      return this;
    } else {
      return XMetricsData(
        xDurations: xDurations,
        xElevationSizes: xElevations,
        xRadius: xRadius,
        xBoxShadows: xBoxShadows,
        xSpacings: xSpacings,
      );
    }
  }

  @override
  XMetricsData copyWith({
    XDurationsData? xDurations,
    XElevationsData? xElevationSizes,
    XRadiusData? xRadius,
    XBoxShadowsData? xBoxShadows,
    XSpacingsData? xSpacings,
  }) {
    return XMetricsData(
      xDurations: xDurations ?? this.xDurations,
      xElevationSizes: xElevationSizes ?? xElevations,
      xRadius: xRadius ?? this.xRadius,
      xBoxShadows: xBoxShadows ?? this.xBoxShadows,
      xSpacings: xSpacings ?? xSpacings,
    );
  }

  @override
  String toString() => '''
  SquareStyle(
    xDurations: $xDurations,
    xElevationSizes: $xElevations,
    xRadius: $xRadius,
    xBoxShadows: $xBoxShadows,
    xSpacings: $xSpacings,
  )
  ''';
}
