import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ApodImageKey extends XImageKey {
  const ApodImageKey._(String name) : super(name);

  static const appLogo = XImageKey('appLogo');
  static const appWormLogo = XImageKey('appWormLogo');
}