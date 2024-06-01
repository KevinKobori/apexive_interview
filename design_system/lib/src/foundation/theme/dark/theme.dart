import 'package:flutter/material.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';
// import 'package:widget_toolkit/widget_toolkit.dart';

abstract final class ApodDarkTheme {
  static ThemeData data({
    required XMetricsData metrics,
    required TextTheme textTheme,
  }) {
    final colorScheme = ApodDarkColorScheme.data();

    return ThemeData(
      extensions: <ThemeExtension<dynamic>>[
        ApodDarkAssets.data(),
        metrics,
        // WidgetToolkitTheme.dark(),
        // ItemPickerTheme.dark(),
      ],
      useMaterial3: true,
      // fontFamily: 'Poppins',
      textTheme: textTheme,
      colorScheme: colorScheme,
      elevatedButtonTheme: ApodDarkElevatedButtonTheme.data(),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.all(colorScheme.onPrimary),
        trackColor: WidgetStateProperty.all(colorScheme.primary),
      ),
    );
  }
}
