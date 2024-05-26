import 'package:flutter/material.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

abstract final class ApodLightTheme {
  static ThemeData data({
    required XMetricsData metrics,
    required TextTheme textTheme,
  }) {
    return ThemeData(
      extensions: <ThemeExtension<dynamic>>[
        ApodLightAssets.data,
        metrics,
      ],
      useMaterial3: true,
      fontFamily: 'Poppins',
      textTheme: textTheme,
      colorScheme: ApodLightColorScheme.data,
      elevatedButtonTheme: ApodLightElevatedButtonTheme.data,
    );
  }
}
