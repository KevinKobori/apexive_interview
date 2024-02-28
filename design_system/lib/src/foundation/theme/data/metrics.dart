import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ApodMetricsData extends ThemeExtension<ApodMetricsData> {
  final ApodRadiusData radius;
  final ApodSpacingsData spacings;
  final ApodBoxShadowsData boxShadows;
  final ApodDurationsData durations;
  final ApodAppFormFactor formFactor;
  final TargetPlatform? _platform;
  TargetPlatform get platform => _platform ?? defaultTargetPlatform;

  ApodMetricsData({
    final ApodRadiusData? radius,
    final ApodSpacingsData? spacings,
    final ApodBoxShadowsData? boxShadows,
    final ApodDurationsData? durations,
    final ApodImagesData? images,
    final ApodAppFormFactor? formFactor,
    final TargetPlatform? platform,
  })  : radius = const ApodRadiusData(),
        spacings = const ApodSpacingsData(),
        boxShadows = const ApodBoxShadowsData(),
        durations = const ApodDurationsData(),
        formFactor = ApodAppFormFactor.medium,
        _platform = platform;

  @override
  ApodMetricsData copyWith({
    ApodRadiusData? radius,
    ApodSpacingsData? spacings,
    ApodBoxShadowsData? boxShadows,
    ApodDurationsData? durations,
    ApodImagesData? images,
    ApodAppFormFactor? formFactor,
    TargetPlatform? platform,
  }) {
    return ApodMetricsData(
      radius: radius ?? this.radius,
      spacings: spacings ?? this.spacings,
      boxShadows: boxShadows ?? this.boxShadows,
      durations: durations ?? this.durations,
      formFactor: formFactor ?? this.formFactor,
      platform: platform ?? this.platform,
    );
  }

  @override
  ApodMetricsData lerp(ThemeExtension<ApodMetricsData>? other, double t) {
    if (other is! ApodMetricsData) {
      return this;
    }

    return ApodMetricsData(
      formFactor: t < 0.5 ? formFactor : other.formFactor,
      platform: platform,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApodMetricsData &&
          radius == other.radius &&
          spacings == other.spacings &&
          boxShadows == other.boxShadows &&
          durations == other.durations &&
          formFactor == other.formFactor &&
          platform == other.platform &&
          runtimeType == other.runtimeType;

  @override
  int get hashCode =>
      radius.hashCode ^
      spacings.hashCode ^
      boxShadows.hashCode ^
      durations.hashCode ^
      formFactor.hashCode ^
      platform.hashCode;

  ApodMetricsData withFormFactor(ApodAppFormFactor formFactor) {
    return ApodMetricsData(
      formFactor: formFactor,
    );
  }
}
