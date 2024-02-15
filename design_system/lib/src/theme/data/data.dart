import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ApodThemeData extends Equatable {
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

  factory ApodThemeData.regular({
    required PictureProvider appLogo,
    required PictureProvider appWormLogo,
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
