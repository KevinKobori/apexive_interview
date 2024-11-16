import 'package:flutter/material.dart';

abstract class ApodDarkColorScheme {
  static ColorScheme get data => ColorScheme.fromSeed(
        seedColor: const Color(0xFFD21F3C),
        // brightness: Overall light/dark theme setting.
        brightness: Brightness.dark,
        // primaryColor: Main color used in the app, for widgets like AppBar.
        primary: const Color(0xFFD21F3C),
        // No direct equivalent: Color for text/icons on primary.
        onPrimary: const Color(0xFFFFFFFF),
        // accentColor: Highlight color for interactive elements like buttons.
        secondary: const Color(0xFFB71C37),
        // No direct equivalent: Color for text/icons on secondary.
        onSecondary: const Color(0xFF9C172E),
        // cardColor: Background color for cards.
        // surface: const Color(0xFF000000),
        surface: const Color(0xFFD21F3C),
        // Usually related to text on light/dark backgrounds.
        onSurface: const Color(0xFFFFFFFF),
        // // scaffoldBackgroundColor: Scaffold background color.
        // background: const Color(0xFF111111),
        // // No direct equivalent: Color for text/icons on background.
        // onBackground: const Color(0xFFFFFFFF),
        // errorColor: Color to indicate errors.
        error: const Color(0xFFD32F2F),
        // No direct equivalent: Color for text/icons on errors.
        onError: Colors.white,
      );
}
