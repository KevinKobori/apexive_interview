import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ApodSpacings {
  static XSpacingsData get data => XSpacingsData(
        superSmall: const XAttribute.blocked(),
        extraSmall: null,
        small: const XAttribute.of(6),
        semiSmall: const XAttribute.of(10),
        medium: const XAttribute.blocked(),
        semiLarge: const XAttribute.blocked(),
        large: const XAttribute.of(22),
        extraLarge: const XAttribute.of(36),
        superLarge: const XAttribute.of(52),
      );
}
