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
