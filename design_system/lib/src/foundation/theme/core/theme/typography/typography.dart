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

  static String get _poppinsFont => 'Poppins';
  static String get _packageFont => 'nasa_apod_design_system';

  static TextStyle _defaultStyle({
    required FontWeight fontWeight,
    required double fontSize,
  }) =>
      TextStyle(
        fontFamily: _poppinsFont,
        package: _packageFont,
        decoration: TextDecoration.none,
        fontWeight: fontWeight,
        fontSize: fontSize,
      );

  static TextTheme get _mediumData => TextTheme(
        displayLarge: _defaultStyle(
          fontWeight: FontWeight.bold,
          fontSize: 28,
        ),
        displayMedium: _defaultStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        displaySmall: _defaultStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        titleLarge: _defaultStyle(
          fontWeight: FontWeight.bold,
          fontSize: 28,
        ),
        titleMedium: _defaultStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        titleSmall: _defaultStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        bodyLarge: _defaultStyle(
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
        bodyMedium: _defaultStyle(
          fontWeight: FontWeight.w400,
          fontSize: 10,
        ),
        // bodySmall: typographyData.paragraph2,
      );

  static TextTheme get _smallData => TextTheme(
        displayLarge: _defaultStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        displayMedium: _defaultStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        displaySmall: _defaultStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
        titleLarge: _defaultStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        titleMedium: _defaultStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        titleSmall: _defaultStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
        bodyLarge: _defaultStyle(
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
        bodyMedium: _defaultStyle(
          fontWeight: FontWeight.w400,
          fontSize: 9,
        ),
        bodySmall: _defaultStyle(
          fontWeight: FontWeight.w400,
          fontSize: 9,
        ),
      );
}
