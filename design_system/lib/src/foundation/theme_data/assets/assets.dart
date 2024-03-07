import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ApodAssets {
  static XAssetsData get data => XAssetsData(
        icons: ApodIcons.data,
        // images: ApodImages.data,
      );
}

class ApodIcons {
  static XIconsData get data => XIconsData(
        fontFamily: 'apod_icons',
        fontPackage: 'nasa_apod_design_system',
        characters: ApodIconCharactersData(),
        sizes: const ApodIconSizesData(),
      );
}


// class ApodImages {
//   static XImagesData get data =>
//      XImagesData(
//       appLogo: ,
//     );
// }
