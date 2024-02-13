import 'package:equatable/equatable.dart';
import 'package:nasa_apod_design_system/src/helpers/named.dart';

class ApodIconsData extends Equatable {
  const ApodIconsData({
    required this.fontFamily,
    required this.fontPackage,
    required this.characters,
    required this.sizes,
  });

  /// Icons have been exported with "Export Icon Font" Figma plugin.
  factory ApodIconsData.regular() => ApodIconsData(
        fontFamily: 'apod_icons',
        fontPackage: 'nasa_apod_design_system',
        characters: ApodIconCharactersData.regular(),
        sizes: ApodIconSizesData.regular(),
      );

  final String fontFamily;
  final String? fontPackage;
  final ApodIconCharactersData characters;
  final ApodIconSizesData sizes;

  @override
  List<Object?> get props => [
        fontFamily,
        fontPackage,
        characters,
        sizes,
      ];
}

class ApodIconCharactersData extends Equatable {
  const ApodIconCharactersData({
    required this.addPicture,
    required this.arrowBack,
    required this.dismiss,
    required this.options,
    required this.tag,
    required this.vikoin,
    required this.shoppingCart,
  });

  factory ApodIconCharactersData.regular() => ApodIconCharactersData(
        addPicture: String.fromCharCodes([57344, 58343, 58413, 57568]),
        arrowBack: String.fromCharCodes([57344, 58537, 59260, 57572]),
        dismiss: String.fromCharCodes([57344, 57911, 61195, 57514]),
        options: String.fromCharCodes([58088, 58314, 57452]),
        tag: String.fromCharCodes([59112, 57969, 57576]),
        vikoin: String.fromCharCodes([57344, 57929, 57730, 57522]),
        shoppingCart: String.fromCharCodes([57344, 58580, 57759, 57350]),
      );

  final String addPicture;
  final String arrowBack;
  final String dismiss;
  final String options;
  final String tag;
  final String vikoin;
  final String shoppingCart;

  @override
  List<Object?> get props => [
        addPicture.named('addPicture'),
        arrowBack.named('arrowBack'),
        dismiss.named('dismiss'),
        tag.named('tag'),
        vikoin.named('vikoin'),
        shoppingCart.named('shoppingCart'),
      ];
}

class ApodIconSizesData extends Equatable {
  const ApodIconSizesData({
    required this.small,
    required this.regular,
    required this.big,
  });

  factory ApodIconSizesData.regular() => const ApodIconSizesData(
        small: 16.0,
        regular: 22.0,
        big: 32.0,
      );

  final double small;
  final double regular;
  final double big;

  @override
  List<Object?> get props => [
        small.named('small'),
        regular.named('regular'),
        big.named('big'),
      ];
}
