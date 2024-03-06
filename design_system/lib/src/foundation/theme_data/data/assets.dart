import 'package:flutter/material.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ApodAssetsData extends ThemeExtension<ApodAssetsData> {
  final ApodIconsData icons;
  final ApodImagesData images;

  ApodAssetsData({
    final ApodIconsData? icons,
    final ApodImagesData? images,
  })  : icons = ApodIconsData(),
        images = const ApodImagesData();

  @override
  ApodAssetsData copyWith({
    ApodIconsData? icons,
    ApodImagesData? images,
  }) {
    return ApodAssetsData(
      icons: icons ?? this.icons,
      images: images ?? this.images,
    );
  }

  @override
  ApodAssetsData lerp(ThemeExtension<ApodAssetsData>? other, double t) {
    if (other is! ApodAssetsData) {
      return this;
    }

    return ApodAssetsData();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApodAssetsData &&
          icons == other.icons &&
          images == other.images &&
          runtimeType == other.runtimeType;

  @override
  int get hashCode => icons.hashCode ^ images.hashCode;
}
