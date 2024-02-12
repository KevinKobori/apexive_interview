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

class AppThemeData extends Equatable {
  const AppThemeData({
    required this.icons,
    required this.colors,
    required this.typography,
    required this.radius,
    required this.spacing,
    required this.shadow,
    required this.durations,
    required this.images,
    required this.formFactor,
    TargetPlatform? platform,
  }) : _platform = platform;

  factory AppThemeData.regular({
    required PictureProvider appLogo,
    required PictureProvider appWarmLogo,
  }) =>
      AppThemeData(
        formFactor: AppFormFactor.medium,
        icons: AppIconsData.regular(),
        typography: AppTypographyData.regular(),
        colors: AppColorsData.light(),
        radius: const AppRadiusData.regular(),
        spacing: AppSpacingData.regular(),
        shadow: AppShadowsData.regular(),
        durations: AppDurationsData.regular(),
        images: AppImagesData.regular(
          appLogo: appLogo,
          appWarmLogo: appWarmLogo,
        ),
      );

  final AppIconsData icons;
  final AppColorsData colors;
  final AppTypographyData typography;
  final AppRadiusData radius;
  final AppSpacingData spacing;
  final AppShadowsData shadow;
  final AppDurationsData durations;
  final AppImagesData images;
  final AppFormFactor formFactor;
  final TargetPlatform? _platform;
  TargetPlatform get platform => _platform ?? defaultTargetPlatform;

  @override
  List<Object?> get props => [
        platform,
        icons,
        colors,
        typography,
        radius,
        spacing,
        shadow,
        durations,
        images,
      ];

  AppThemeData withColors(AppColorsData colors) {
    return AppThemeData(
      platform: platform,
      formFactor: formFactor,
      colors: colors,
      durations: durations,
      icons: icons,
      images: images,
      radius: radius,
      shadow: shadow,
      spacing: spacing,
      typography: typography,
    );
  }

  AppThemeData withImages(AppImagesData images) {
    return AppThemeData(
      platform: platform,
      formFactor: formFactor,
      colors: colors,
      durations: durations,
      icons: icons,
      images: images,
      radius: radius,
      shadow: shadow,
      spacing: spacing,
      typography: typography,
    );
  }

  AppThemeData withFormFactor(AppFormFactor formFactor) {
    return AppThemeData(
      platform: platform,
      formFactor: formFactor,
      colors: colors,
      durations: durations,
      icons: icons,
      images: images,
      radius: radius,
      shadow: shadow,
      spacing: spacing,
      typography: typography,
    );
  }

  AppThemeData withTypography(AppTypographyData typography) {
    return AppThemeData(
      platform: platform,
      formFactor: formFactor,
      colors: colors,
      durations: durations,
      icons: icons,
      images: images,
      radius: radius,
      shadow: shadow,
      spacing: spacing,
      typography: typography,
    );
  }
}
