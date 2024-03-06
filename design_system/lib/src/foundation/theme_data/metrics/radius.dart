import 'package:flutter/material.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ApodRadius {
  static XRadiusData get data => XRadiusData(
        extraSmall: const Optional.of(Radius.circular(5)),
        small: const Optional.of(Radius.circular(10)),
        semiSmall: const Optional.of(Radius.circular(12)),
        medium: const Optional.of(Radius.circular(16)),
        semiLarge: const Optional.of(null),
        large: const Optional.of(Radius.circular(24)),
        extraLarge: const Optional.of(null),
        superLarge: const Optional.of(null),
      );
}
