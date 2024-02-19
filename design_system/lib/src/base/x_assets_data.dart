library x_assets_data;

import 'package:equatable/equatable.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

part 'assets/x_icons_data.dart';
part 'assets/x_images_data.dart';

class XAssetsData extends ThemeExtension<XAssetsData> {
  final XIconsData xIcons;
  final XImagesData xImages;

  XAssetsData({
    final XIconsData? xIcons,
    final XImagesData? xImages,
  })  : xIcons = xIcons ?? const XIconsData(),
        xImages = xImages ?? const XImagesData();

  @override
  ThemeExtension<XAssetsData> lerp(
      ThemeExtension<XAssetsData>? other, double t) {
    if (other is! XAssetsData) {
      return this;
    } else {
      return XAssetsData(
        xIcons: xIcons,
        xImages: xImages,
      );
    }
  }

  @override
  XAssetsData copyWith({
    XIconsData? xIcons,
    XImagesData? xImages,
  }) {
    return XAssetsData(
      xIcons: xIcons ?? this.xIcons,
      xImages: xImages ?? this.xImages,
    );
  }

  @override
  String toString() => '''
  SquareStyle(
    xIcons: $xIcons,
    xImages: $xImages,
  )
  ''';
}
