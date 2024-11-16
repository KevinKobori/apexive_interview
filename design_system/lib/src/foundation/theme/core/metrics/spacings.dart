import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ApodSpacings {
  static XSpacingsData get data => XSpacingsData(
        superSmall: const Optional.none(),
        extraSmall: null,
        small: const Optional.of(6),
        semiSmall: const Optional.of(10),
        medium: const Optional.none(),
        semiLarge: const Optional.none(),
        large: const Optional.of(22),
        extraLarge: const Optional.of(36),
        superLarge: const Optional.of(52),
      );
}
