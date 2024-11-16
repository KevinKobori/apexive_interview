library x_metrics_data;

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

part 'animation/x_durations_data.dart';
part 'components/x_edge_insets.dart';
part 'components/x_padding.dart';
part 'geometry/x_elevations_data.dart';
part 'geometry/x_form_factor.dart';
part 'geometry/x_radius_data.dart';
part 'geometry/x_spacings_data.dart';
part 'painting/_x_border_radius.dart';
part 'painting/_x_edge_insets.dart';
part 'painting/_x_gaps.dart';
part 'painting/_x_paddings.dart';
part 'painting/_x_shapes.dart';
part 'painting/x_box_shadows_data.dart';

String getUnsupportedErrorMessage({
  required String attribute,
  required String location,
}) {
  return 'Access to $attribute has been intentionally blocked in metrics.$location. This property should not be used or accessed directly, as its usage has been deprecated or is reserved for internal purposes only. Please review your implementation to avoid relying on this property and ensure your application\'s compatibility with future changes.';
}

class XMetricsData extends ThemeExtension<XMetricsData> {
  final XBoxShadowsData boxShadows;
  final XDurationsData durations;
  final XElevationsData elevations;
  final XFormFactor formFactor;
  final XRadiusData radius;
  final XSpacingsData spacings;

  XMetricsData({
    final XBoxShadowsData? boxShadows,
    final XDurationsData? durations,
    final XElevationsData? elevations,
    final XFormFactor? formFactor,
    final XRadiusData? radius,
    final XSpacingsData? spacings,
  })  : boxShadows = boxShadows ?? XBoxShadowsData(),
        durations = durations ?? XDurationsData(),
        elevations = elevations ?? XElevationsData(),
        formFactor = formFactor ?? XFormFactor.medium,
        radius = radius ?? XRadiusData(),
        spacings = spacings ?? XSpacingsData();

  @override
  ThemeExtension<XMetricsData> lerp(
      ThemeExtension<XMetricsData>? other, double t) {
    if (other is! XMetricsData) {
      return this;
    } else {
      return XMetricsData(
        boxShadows: boxShadows,
        durations: durations,
        elevations: elevations,
        formFactor: formFactor,
        radius: radius,
        spacings: spacings,
      );
    }
  }

  @override
  XMetricsData copyWith({
    XBoxShadowsData? boxShadows,
    XDurationsData? durations,
    XElevationsData? elevations,
    XFormFactor? formFactor,
    XRadiusData? radius,
    XSpacingsData? spacings,
  }) {
    return XMetricsData(
      boxShadows: boxShadows ?? this.boxShadows,
      durations: durations ?? this.durations,
      elevations: elevations ?? this.elevations,
      formFactor: formFactor ?? this.formFactor,
      radius: radius ?? this.radius,
      spacings: spacings ?? this.spacings,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is XMetricsData &&
          boxShadows == other.boxShadows &&
          durations == other.durations &&
          elevations == other.elevations &&
          formFactor == other.formFactor &&
          radius == other.radius &&
          spacings == other.spacings &&
          runtimeType == other.runtimeType;

  @override
  int get hashCode =>
      boxShadows.hashCode ^
      durations.hashCode ^
      elevations.hashCode ^
      formFactor.hashCode ^
      radius.hashCode ^
      spacings.hashCode;

  // @override
  // String toString() => '''
  //   XMetricsData(
  //     boxShadows: $boxShadows,
  //     durations: $durations,
  //     elevations: $elevations,
  //     formFactor: $formFactor,
  //     radius: $radius,
  //     spacings: $spacings,
  //   )
  // ''';
}
