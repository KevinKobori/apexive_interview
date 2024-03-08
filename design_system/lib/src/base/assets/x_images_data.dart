part of x_assets_data;

// enum BaseImageKey {
//   none,
// }

// extension XImageKeyExtension on BaseImageKey {
//     appLogo,
//     appWormLogo,
//     darkAppLogo,
//     darkAppWormLogo,
//   }
class XImageKey {
  final String name;

  const XImageKey(this.name);

  static const none = XImageKey('none');
}

class XImagesData extends Equatable {
  final Map<XImageKey, String> _images;

  XImagesData({
    Map<XImageKey, String>? images,
  }) : _images = Map.from(images ?? {});

  String path(XImageKey key) => _images[key]!;

  @override
  List<Object?> get props => [
        _images,
      ];
}

// var imageManager = ImageManager({
//   ImageKey.logo: 'assets/images/logo.png',
//   ImageKey.icon: 'assets/images/icon.png',
// });