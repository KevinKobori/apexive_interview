import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ApodImagesData extends Equatable {
  const ApodImagesData({
    required this.appLogo,
    required this.appWormLogo,
  });

  factory ApodImagesData.regular({
    required PictureProvider appLogo,
    required PictureProvider appWormLogo,
  }) =>
      ApodImagesData(
        appLogo: appLogo,
        appWormLogo: appWormLogo,
      );

  factory ApodImagesData.highContrast({
    required PictureProvider appLogo,
    required PictureProvider appWormLogo,
  }) =>
      ApodImagesData(
        appLogo: appLogo,
        appWormLogo: appWormLogo,
      );

  final PictureProvider appLogo;
  final PictureProvider appWormLogo;

  @override
  List<Object?> get props => [
        appLogo.named('appLogo'),
        appWormLogo.named('appWormLogo'),
      ];

  ApodImagesData withAppLogo(PictureProvider appLogo) {
    return ApodImagesData(
      appLogo: appLogo,
      appWormLogo: appWormLogo,
    );
  }

  ApodImagesData withBackgroundPattern(ImageProvider backgroundPattern) {
    return ApodImagesData(
      appLogo: appLogo,
      appWormLogo: appWormLogo,
    );
  }
}
