import 'package:equatable/equatable.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ApodImagesData extends Equatable {
  const ApodImagesData({
    required this.appLogo,
    required this.appWormLogo,
  });

  factory ApodImagesData.regular({
    required String appLogo,
    required String appWormLogo,
  }) =>
      ApodImagesData(
        appLogo: appLogo,
        appWormLogo: appWormLogo,
      );

  factory ApodImagesData.highContrast({
    required String appLogo,
    required String appWormLogo,
  }) =>
      ApodImagesData(
        appLogo: appLogo,
        appWormLogo: appWormLogo,
      );

  final String appLogo;
  final String appWormLogo;

  @override
  List<Object?> get props => [
        appLogo.named('appLogo'),
        appWormLogo.named('appWormLogo'),
      ];

  ApodImagesData withAppLogo(String appLogo) {
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
