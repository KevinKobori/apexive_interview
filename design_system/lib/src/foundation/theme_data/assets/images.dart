import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ApodImageKey extends XImageKey {
  const ApodImageKey._(String name) : super(name);

  static const lightappLogo = XImageKey('lightappLogo');
  static const lightAppWormLogo = XImageKey('lightAppWormLogo');
  static const darkAppLogo = XImageKey('darkAppLogo');
  static const darkAppWormLogo = XImageKey('darkAppWormLogo');
}

class ApodImages {
  static XImagesData get data => XImagesData(
        images: const {
          ApodImageKey.lightappLogo: 'assets/images/nasa_logo.svg',
          ApodImageKey.lightAppWormLogo: 'assets/images/nasa_worm_logo.svg',
          ApodImageKey.darkAppLogo: 'assets/images/nasa_logo.svg',
          ApodImageKey.darkAppWormLogo: 'assets/images/nasa_worm_logo.svg',
        },
      );
}
