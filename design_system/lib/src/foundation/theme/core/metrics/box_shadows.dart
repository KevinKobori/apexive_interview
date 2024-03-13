import 'package:flutter/material.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ApodBoxShadows {
  static XBoxShadowsData get data => XBoxShadowsData(
        small: const Optional.of(
          BoxShadow(
            blurRadius: 2,
            spreadRadius: 1,
            color: Color(0x44000000),
          ),
        ),
        medium: const Optional.of(
          BoxShadow(
            blurRadius: 4,
            spreadRadius: 1,
            color: Color(0x44000000),
          ),
        ),
        large: const Optional.of(
          BoxShadow(
            blurRadius: 32,
            color: Color(0x44000000),
          ),
        ),
      );
}
