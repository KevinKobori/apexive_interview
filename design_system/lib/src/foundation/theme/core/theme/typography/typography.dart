import 'package:flutter/material.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ApodTextTheme {
  static TextTheme data(XFormFactor? formFactor) {
    if (formFactor == XFormFactor.small) {
      return _smallData;
    } else {
      return _mediumData;
    }
  }

  static TextTheme get _mediumData => const TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'Poppins',
          package: 'nasa_apod_design_system',
          fontSize: 28,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.none,
        ),
        displayMedium: TextStyle(
          fontFamily: 'Poppins',
          package: 'nasa_apod_design_system',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.none,
        ),
        displaySmall: TextStyle(
          fontFamily: 'Poppins',
          package: 'nasa_apod_design_system',
          fontSize: 14,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.none,
        ),
        titleLarge: TextStyle(
          fontFamily: 'Poppins',
          package: 'nasa_apod_design_system',
          fontSize: 28,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.none,
        ),
        titleMedium: TextStyle(
          fontFamily: 'Poppins',
          package: 'nasa_apod_design_system',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.none,
        ),
        titleSmall: TextStyle(
          fontFamily: 'Poppins',
          package: 'nasa_apod_design_system',
          fontSize: 14,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.none,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Poppins',
          package: 'nasa_apod_design_system',
          fontWeight: FontWeight.w400,
          fontSize: 12,
          decoration: TextDecoration.none,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Poppins',
          package: 'nasa_apod_design_system',
          fontWeight: FontWeight.w400,
          fontSize: 10,
          decoration: TextDecoration.none,
        ),
        // bodySmall: typographyData.paragraph2,
      );

  static TextTheme get _smallData => const TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'Poppins',
          package: 'nasa_apod_design_system',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.none,
        ),
        displayMedium: TextStyle(
          fontFamily: 'Poppins',
          package: 'nasa_apod_design_system',
          fontSize: 14,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.none,
        ),
        displaySmall: TextStyle(
          fontFamily: 'Poppins',
          package: 'nasa_apod_design_system',
          fontSize: 12,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.none,
        ),
        titleLarge: TextStyle(
          fontFamily: 'Poppins',
          package: 'nasa_apod_design_system',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.none,
        ),
        titleMedium: TextStyle(
          fontFamily: 'Poppins',
          package: 'nasa_apod_design_system',
          fontSize: 14,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.none,
        ),
        titleSmall: TextStyle(
          fontFamily: 'Poppins',
          package: 'nasa_apod_design_system',
          fontSize: 12,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.none,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Poppins',
          package: 'nasa_apod_design_system',
          fontWeight: FontWeight.w400,
          fontSize: 12,
          decoration: TextDecoration.none,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Poppins',
          package: 'nasa_apod_design_system',
          fontWeight: FontWeight.w400,
          fontSize: 9,
          decoration: TextDecoration.none,
        ),
        bodySmall: TextStyle(
          fontFamily: 'Poppins',
          package: 'nasa_apod_design_system',
          fontWeight: FontWeight.w400,
          fontSize: 9,
          decoration: TextDecoration.none,
        ),
      );
}
