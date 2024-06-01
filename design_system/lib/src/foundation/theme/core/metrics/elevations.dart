import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ApodElevations {
  static XElevationsData data() => XElevationsData(
        level1: const XAttribute.of(1),
        level2: const XAttribute.of(3),
        level3: const XAttribute.of(6),
        level4: const XAttribute.of(8),
        level5: const XAttribute.blocked(),
      );
}
