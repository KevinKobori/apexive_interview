import 'package:flutter/material.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

abstract final class ApodDarkTheme {
  static ThemeData data({ApodAppFormFactor? formFactor}) {
    var customThemeData = ApodThemeData();
    var typographyData = ApodTypographyData.regular();

    if (formFactor != null) {
      customThemeData = customThemeData.withFormFactor(formFactor);
      if (formFactor == ApodAppFormFactor.small) {
        customThemeData =
            customThemeData.withTypography(ApodTypographyData.small());
        typographyData = ApodTypographyData.small();
      }
    }

    final textTheme = TextTheme(
      displayLarge: typographyData.title1,
      displayMedium: typographyData.title2,
      displaySmall: typographyData.title3,
      titleLarge: typographyData.title1,
      titleMedium: typographyData.title2,
      titleSmall: typographyData.title3,
      bodyLarge: typographyData.paragraph1,
      bodyMedium: typographyData.paragraph2,
      bodySmall: typographyData.paragraph2,
    );

    return ThemeData(
      extensions: <ThemeExtension<dynamic>>[
        ApodMetrics.data,
        ApodDarkAssets.data,
        customThemeData,
      ],
      useMaterial3: true,
      fontFamily: 'Poppins',
      textTheme: textTheme,
      colorScheme: ApodDarkColorScheme.data,
      elevatedButtonTheme: ApodDarkElevatedButtonTheme.data,
      // elevatedButtonTheme: // TODO: CHATGPT HELP ME CREATIG THIS MUST COMPLEX THAT WE CAN DO
    );
  }
}
