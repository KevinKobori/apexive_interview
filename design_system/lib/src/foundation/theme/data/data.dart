import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ApodThemeData extends ThemeExtension<ApodThemeData> {
  final ApodIconsData icons;
  // final ApodTypographyData typography;
  final ApodRadiusData radius;
  final ApodSpacingsData spacings;
  final ApodBoxShadowsData boxShadows;
  final ApodDurationsData durations;
  final ApodImagesData images;
  final ApodAppFormFactor formFactor;
  final TargetPlatform? _platform;
  TargetPlatform get platform => _platform ?? defaultTargetPlatform;

  ApodThemeData({
    final ApodIconsData? icons,
    // final ApodTypographyData? typography,
    final ApodRadiusData? radius,
    final ApodSpacingsData? spacings,
    final ApodBoxShadowsData? boxShadows,
    final ApodDurationsData? durations,
    final ApodImagesData? images,
    final ApodAppFormFactor? formFactor,
    final TargetPlatform? platform,
  })  : _platform = platform,
        formFactor = ApodAppFormFactor.medium,
        icons = ApodIconsData(),
        // typography = ApodTypographyData.regular(),
        radius = const ApodRadiusData(),
        spacings = const ApodSpacingsData(),
        boxShadows = const ApodBoxShadowsData(),
        durations = const ApodDurationsData(),
        images = const ApodImagesData();

  @override
  ApodThemeData copyWith({
    ApodIconsData? icons,
    // ApodTypographyData? typography,
    ApodRadiusData? radius,
    ApodSpacingsData? spacings,
    ApodBoxShadowsData? boxShadows,
    ApodDurationsData? durations,
    ApodImagesData? images,
    ApodAppFormFactor? formFactor,
    TargetPlatform? platform,
  }) {
    return ApodThemeData(
      icons: icons ?? this.icons,
      // typography: typography ?? this.typography,
      radius: radius ?? this.radius,
      spacings: spacings ?? this.spacings,
      boxShadows: boxShadows ?? this.boxShadows,
      durations: durations ?? this.durations,
      images: images ?? this.images,
      formFactor: formFactor ?? this.formFactor,
      platform: platform ?? this.platform,
    );
  }

  @override
  ApodThemeData lerp(ThemeExtension<ApodThemeData>? other, double t) {
    if (other is! ApodThemeData) {
      return this;
    }

    return ApodThemeData(
      formFactor: t < 0.5 ? formFactor : other.formFactor,
      platform: platform,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApodThemeData &&
          runtimeType == other.runtimeType &&
          platform == other.platform &&
          icons == other.icons &&
          // typography == other.typography &&
          radius == other.radius &&
          spacings == other.spacings &&
          boxShadows == other.boxShadows &&
          durations == other.durations &&
          images == other.images;

  @override
  int get hashCode =>
      platform.hashCode ^
      icons.hashCode ^
      // typography.hashCode ^
      radius.hashCode ^
      spacings.hashCode ^
      boxShadows.hashCode ^
      durations.hashCode ^
      images.hashCode;

  ApodThemeData withFormFactor(ApodAppFormFactor formFactor) {
    return ApodThemeData(
      formFactor: formFactor,
    );
  }

  ApodThemeData withTypography(ApodTypographyData typography) {
    return ApodThemeData(
      platform: platform,
      formFactor: formFactor,
      durations: durations,
      icons: icons,
      images: images,
      radius: radius,
      boxShadows: boxShadows,
      spacings: spacings,
      // typography: typography,
    );
  }
}
