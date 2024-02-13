import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nasa_apod_design_system/src/theme/data/colors.dart';
import 'package:nasa_apod_design_system/src/theme/data/durations.dart';
import 'package:nasa_apod_design_system/src/theme/data/form_factor.dart';
import 'package:nasa_apod_design_system/src/theme/data/icons.dart';
import 'package:nasa_apod_design_system/src/theme/data/images.dart';
import 'package:nasa_apod_design_system/src/theme/data/radius.dart';
import 'package:nasa_apod_design_system/src/theme/data/shadows.dart';
import 'package:nasa_apod_design_system/src/theme/data/spacing.dart';
import 'package:nasa_apod_design_system/src/theme/data/typography.dart';

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
    required PictureProvider appWarmLogo,
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
          appWarmLogo: appWarmLogo,
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
