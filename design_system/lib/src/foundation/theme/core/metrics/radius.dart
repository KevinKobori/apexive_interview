import 'package:flutter/material.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ApodRadius {
  static XRadiusData get data => XRadiusData(
        extraSmall: const XAttribute.of(Radius.circular(5)),
        small: const XAttribute.of(Radius.circular(10)),
        semiSmall: const XAttribute.of(Radius.circular(12)),
        medium: const XAttribute.of(Radius.circular(16)),
        semiLarge: const XAttribute.blocked(),
        large: const XAttribute.of(Radius.circular(24)),
        extraLarge: const XAttribute.blocked(),
        superLarge: const XAttribute.blocked(),
      );
}
