part of x_assets_data;

class XIconsData extends Equatable {
  final String? fontFamily;
  final String? fontPackage;
  final XIconCharactersData characters;
  final XIconSizesData sizes;

  const XIconsData({
    this.fontFamily,
    this.fontPackage,
    final XIconCharactersData? characters,
    final XIconSizesData? sizes,
  })  : characters = characters ?? const XIconCharactersData(),
        sizes = sizes ?? const XIconSizesData();

  @override
  List<Object?> get props => [
        fontFamily,
        fontPackage,
        characters,
        sizes,
      ];
}

class XIconCharactersData extends Equatable {
  const XIconCharactersData();

  @override
  List<Object?> get props => [];
}

class XIconSizesData extends Equatable {
  final double extraSmall;
  final double small;
  final double semiSmall;
  final double medium;
  final double semiLarge;
  final double large;
  final double extraLarge;
  final double superLarge;

  const XIconSizesData({
    final double? extraSmall,
    final double? small,
    final double? semiSmall,
    final double? medium,
    final double? semiLarge,
    final double? large,
    final double? extraLarge,
    final double? superLarge,
  })  : extraSmall = extraSmall ?? XStandardSizes.x16,
        small = small ?? XAuxiliarySizes.x18,
        semiSmall = semiSmall ?? XStandardSizes.x20,
        medium = medium ?? XStandardSizes.x24,
        semiLarge = semiLarge ?? XStandardSizes.x32,
        large = large ?? XStandardSizes.x48,
        extraLarge = extraLarge ?? XStandardSizes.x96,
        superLarge = superLarge ?? XStandardSizes.x192;

  @override
  List<Object?> get props => [
        extraSmall.named('extraSmall'),
        small.named('small'),
        semiSmall.named('semiSmall'),
        medium.named('medium'),
        semiLarge.named('semiLarge'),
        large.named('large'),
        extraLarge.named('extraLarge'),
        superLarge.named('superLarge'),
      ];
}

enum XIconSize {
  extraSmall,
  small,
  semiSmall,
  medium,
  semiLarge,
  large,
  extraLarge,
  superLarge,
}

extension XIconSizesExtension on XIconSize {
  double? toDouble(XIconSizesData? iconSizes) => switch (this) {
        XIconSize.extraSmall => iconSizes?.extraSmall,
        XIconSize.small => iconSizes?.small,
        XIconSize.semiSmall => iconSizes?.semiSmall,
        XIconSize.medium => iconSizes?.medium,
        XIconSize.semiLarge => iconSizes?.semiLarge,
        XIconSize.large => iconSizes?.large,
        XIconSize.extraLarge => iconSizes?.extraLarge,
        XIconSize.superLarge => iconSizes?.superLarge,
      };
}
