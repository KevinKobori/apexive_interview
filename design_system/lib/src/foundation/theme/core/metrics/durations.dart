import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ApodDurations {
  static XDurationsData get data => XDurationsData(
        areAnimationEnabled: const XAttribute.of(true),
        regular: const XAttribute.of(Duration(milliseconds: 250)),
        quick: const XAttribute.of(Duration(milliseconds: 100)),
      );
}
