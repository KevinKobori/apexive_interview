import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ApodDurations {
  static XDurationsData get data => XDurationsData(
        areAnimationEnabled: const Optional.of(true),
        regular: const Optional.of(
          Duration(milliseconds: 250),
        ),
        quick: const Optional.of(
          Duration(milliseconds: 100),
        ),
      );
}
