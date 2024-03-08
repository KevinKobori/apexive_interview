import 'package:flutter/material.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

abstract final class ApodLightTheme {
  static ThemeData data(XFormFactor? formFactor) {
    return ThemeData(
      extensions: <ThemeExtension<dynamic>>[
        ApodLightAssets.data,
        ApodMetrics.data(formFactor),
      ],
      useMaterial3: true,
      fontFamily: 'Poppins',
      textTheme: ApodTextTheme.data(formFactor),
      colorScheme: ApodLightColorScheme.data,
      elevatedButtonTheme: ApodLightElevatedButtonTheme.data,
    );
  }
}
