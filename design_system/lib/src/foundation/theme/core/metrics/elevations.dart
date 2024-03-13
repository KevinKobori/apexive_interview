import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ApodElevations {
  static XElevationsData get data => XElevationsData(
        level1: const Optional.of(1),
        level2: const Optional.of(3),
        level3: const Optional.of(6),
        level4: const Optional.of(8),
        level5: const Optional.none(),
      );
}
