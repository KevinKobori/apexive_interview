import 'package:flutter/foundation.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ApodThemeData extends ThemeExtension<ApodThemeData> {
  const ApodThemeData({
    required this.icons,
    required this.colors,
    required this.typography,
    required this.radius,
    required this.spacings,
    required this.shadow,
    required this.durations,
    required this.images,
    required this.formFactor,
    TargetPlatform? platform,
  }) : _platform = platform;

  final ApodIconsData icons;
  final ApodColorsData colors;
  final ApodTypographyData typography;
  final ApodRadiusData radius;
  final ApodSpacingsData spacings;
  final ApodShadowsData shadow;
  final ApodDurationsData durations;
  final ApodImagesData images;
  final ApodAppFormFactor formFactor;
  final TargetPlatform? _platform;
  TargetPlatform get platform => _platform ?? defaultTargetPlatform;

  @override
  ApodThemeData copyWith({
    ApodIconsData? icons,
    ApodColorsData? colors,
    ApodTypographyData? typography,
    ApodRadiusData? radius,
    ApodSpacingsData? spacings,
    ApodShadowsData? shadow,
    ApodDurationsData? durations,
    ApodImagesData? images,
    ApodAppFormFactor? formFactor,
    TargetPlatform? platform,
  }) {
    return ApodThemeData(
      icons: icons ?? this.icons,
      colors: colors ?? this.colors,
      typography: typography ?? this.typography,
      radius: radius ?? this.radius,
      spacings: spacings ?? this.spacings,
      shadow: shadow ?? this.shadow,
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
    // Example of interpolating one field, you need to interpolate all fields accordingly
    return ApodThemeData(
      icons: icons, // ApodIconsData.lerp(icons, other.icons, t),
      // Add lerp for other fields
      colors: colors, // Update this to interpolate
      typography: typography, // Update this to interpolate
      radius: radius, // Update this to interpolate
      spacings: spacings, // Update this to interpolate
      shadow: shadow, // Update this to interpolate
      durations: durations, // Update this to interpolate
      images: images, // Update this to interpolate
      formFactor:
          t < 0.5 ? formFactor : other.formFactor, // Example interpolation
      platform: platform, // Typically not interpolated
    );
  }

  factory ApodThemeData.regular({
    required String appLogo,
    required String appWormLogo,
  }) =>
      ApodThemeData(
        formFactor: ApodAppFormFactor.medium,
        icons: ApodIconsData.regular(),
        typography: ApodTypographyData.regular(),
        colors: ApodColorsData.light(),
        radius: const ApodRadiusData.regular(),
        spacings: ApodSpacingsData.regular(),
        shadow: ApodShadowsData.regular(),
        durations: ApodDurationsData.regular(),
        images: ApodImagesData.regular(
          appLogo: appLogo,
          appWormLogo: appWormLogo,
        ),
      );

  @override
  List<Object?> get props => [
        platform,
        icons,
        colors,
        typography,
        radius,
        spacings,
        shadow,
        durations,
        images,
      ];

  ApodThemeData withColors(ApodColorsData colors) {
    return ApodThemeData(
      platform: platform,
      formFactor: formFactor,
      colors: colors,
      durations: durations,
      icons: icons,
      images: images,
      radius: radius,
      shadow: shadow,
      spacings: spacings,
      typography: typography,
    );
  }

  ApodThemeData withImages(ApodImagesData images) {
    return ApodThemeData(
      platform: platform,
      formFactor: formFactor,
      colors: colors,
      durations: durations,
      icons: icons,
      images: images,
      radius: radius,
      shadow: shadow,
      spacings: spacings,
      typography: typography,
    );
  }

  ApodThemeData withFormFactor(ApodAppFormFactor formFactor) {
    return ApodThemeData(
      platform: platform,
      formFactor: formFactor,
      colors: colors,
      durations: durations,
      icons: icons,
      images: images,
      radius: radius,
      shadow: shadow,
      spacings: spacings,
      typography: typography,
    );
  }

  ApodThemeData withTypography(ApodTypographyData typography) {
    return ApodThemeData(
      platform: platform,
      formFactor: formFactor,
      colors: colors,
      durations: durations,
      icons: icons,
      images: images,
      radius: radius,
      shadow: shadow,
      spacings: spacings,
      typography: typography,
    );
  }
}
