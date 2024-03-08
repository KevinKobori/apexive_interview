import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ApodDarkImages {
  static XImagesData get data => XImagesData(
        images: const {
          ApodImageKey.appLogo: 'assets/images/nasa_logo.svg',
          ApodImageKey.appWormLogo: 'assets/images/nasa_worm_logo.svg',
        },
      );
}
