import 'package:flutter/material.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

abstract final class ApodDarkTheme {
  static ThemeData data({
    required XMetricsData metrics,
    required TextTheme textTheme,
  }) {
    return ThemeData(
      extensions: <ThemeExtension<dynamic>>[
        ApodDarkAssets.data,
        metrics,
      ],
      useMaterial3: true,
      fontFamily: 'Poppins',
      textTheme: textTheme,
      colorScheme: ApodDarkColorScheme.data,
      elevatedButtonTheme: ApodDarkElevatedButtonTheme.data,
      // elevatedButtonTheme: // `TODO`: CHATGPT HELP ME CREATIG THIS MUST COMPLEX THAT WE CAN DO
    );
  }
}
