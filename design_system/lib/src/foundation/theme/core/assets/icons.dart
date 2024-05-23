import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ApodIcons {
  static XIconsData get data => XIconsData(
        fontFamily: 'apod_icons',
        fontPackage: 'nasa_apod_design_system',
        characters: ApodIconCharacters.data,
        sizes: ApodIconSizes.data,
      );
}

class ApodIconCharacterKey {
  static const addPicture = XIconCharacterKey('addPicture');
  static const arrowBack = XIconCharacterKey('arrowBack');
  static const dismiss = XIconCharacterKey('dismiss');
  static const options = XIconCharacterKey('options');
  static const tag = XIconCharacterKey('tag');
  static const vikoin = XIconCharacterKey('vikoin');
  static const shoppingCart = XIconCharacterKey('shoppingCart');
}

class ApodIconCharacters {
  static XIconCharactersData get data => XIconCharactersData(
        characters: {
          ApodIconCharacterKey.addPicture:
              String.fromCharCodes([57344, 58343, 58413, 57568]),
          ApodIconCharacterKey.arrowBack:
              String.fromCharCodes([57344, 58537, 59260, 57572]),
          ApodIconCharacterKey.dismiss:
              String.fromCharCodes([57344, 57911, 61195, 57514]),
          ApodIconCharacterKey.options:
              String.fromCharCodes([58088, 58314, 57452]),
          ApodIconCharacterKey.tag: String.fromCharCodes([59112, 57969, 57576]),
          ApodIconCharacterKey.vikoin:
              String.fromCharCodes([57344, 57929, 57730, 57522]),
          ApodIconCharacterKey.shoppingCart:
              String.fromCharCodes([57344, 58580, 57759, 57350]),
        },
      );
}

class ApodIconSizes {
  // TODO: NOW - PUT IT ALL TO OPTION.NONE
  static XIconSizesData get data => const XIconSizesData(
        extraSmall: 16.0,
        small: null,
        semiSmall: null,
        medium: 22.0,
        semiLarge: 32.0,
        large: null,
        extraLarge: null,
        superLarge: null,
      );
}
