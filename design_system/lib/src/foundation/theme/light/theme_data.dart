import 'package:flutter/material.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

abstract final class ApodLightTheme {
  static ThemeData data({ApodAppFormFactor? formFactor}) {
    var metricsData = ApodMetricsData();
    var textThemeData = ApodTextTheme.mediumData;

    if (formFactor != null) {
      metricsData = metricsData.withFormFactor(formFactor);
      if (formFactor == ApodAppFormFactor.small) {
        textThemeData = ApodTextTheme.smallData;
      }
    }

    return ThemeData(
      extensions: <ThemeExtension<dynamic>>[
        ApodAssetsData(),
        metricsData,
      ],
      useMaterial3: true,
      fontFamily: 'Poppins',
      textTheme: textThemeData,
      colorScheme: ApodLightColorScheme.data,
      elevatedButtonTheme: ApodLightElevatedButtonTheme.data,
    );
  }
}
