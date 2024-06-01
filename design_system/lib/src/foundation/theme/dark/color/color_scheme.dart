import 'package:flutter/material.dart';

abstract class ApodDarkColorScheme {
  static ColorScheme data() =>
      // // a color scheme that is pink with beige background
      // const ColorScheme(
      //   brightness: Brightness.light,
      //   primary: Color(0xffFF80AB),
      //   onPrimary: Colors.white,
      //   primaryContainer: Color(0xffFFABDE),
      //   onPrimaryContainer: Color(0xff21005D),
      //   secondary: Color(0xffFFD166),
      //   onSecondary: Colors.white,
      //   secondaryContainer: Color(0xffFFF197),
      //   onSecondaryContainer: Color(0xff302903),
      //   error: Color(0xffD32F2F),
      //   onError: Colors.white,
      //   errorContainer: Color(0xffFBE9E8),
      //   onErrorContainer: Color(0xff410002),
      //   surface: Color(0xffFFFBF3),
      //   onSurface: Color(0xff1E1917),
      //   surfaceContainerHighest: Color(0xffF5F0EB),
      //   onSurfaceVariant: Color(0xff4B4641),
      //   outline: Color(0xff797470),
      //   outlineVariant: Color(0xff5F5955),
      //   shadow: Color(0xff000000),
      //   scrim: Color(0xff000000),
      //   inverseSurface: Color(0xff34302E),
      //   onInverseSurface: Color(0xffFBF0F3),
      //   inversePrimary: Color(0xffD15B9D),
      //   surfaceTint: Color(0xffFED6E0),
      // );
      ColorScheme.fromSeed(
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
        surface: const Color(0xFF111111),
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
