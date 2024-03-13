part of x_assets_data;

class XIconsData extends Equatable {
  final String? fontFamily;
  final String? fontPackage;
  final XIconCharactersData characters;
  final XIconSizesData sizes;

  XIconsData({
    this.fontFamily,
    this.fontPackage,
    final XIconCharactersData? characters,
    final XIconSizesData? sizes,
  })  : characters = characters ?? XIconCharactersData(),
        sizes = sizes ?? const XIconSizesData();

  @override
  List<Object?> get props => [
        fontFamily,
        fontPackage,
        characters,
        sizes,
      ];
}

class XIconCharacterKey {
  final String name;

  const XIconCharacterKey(this.name);

  static const none = XIconCharacterKey('none');
}

class XIconCharactersData extends Equatable {
  final Map<XIconCharacterKey, String> _characters;

  XIconCharactersData({
    Map<XIconCharacterKey, String>? characters,
  }) : _characters = Map.from(characters ?? {});

  String char(XIconCharacterKey key) => _characters[key]!;

  @override
  List<Object?> get props => [
        _characters,
      ];
}
