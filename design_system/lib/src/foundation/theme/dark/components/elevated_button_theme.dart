import 'package:flutter/material.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

abstract class ApodDarkElevatedButtonTheme {
  static ElevatedButtonThemeData get data => ElevatedButtonThemeData(
        style: ButtonStyle(
          // Background color
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (states) {
              if (states.contains(MaterialState.disabled)) {
                return ApodDarkColorScheme.data.primary;
              } else if (states.contains(MaterialState.hovered)) {
                return ApodDarkColorScheme.data.secondary;
              } else if (states.contains(MaterialState.pressed)) {
                return ApodDarkColorScheme.data.tertiary;
                // TODO:
                // } else if (states.contains(MaterialState.focused)) {
                //   return null;
                // } else if (states.contains(MaterialState.dragged)) {
                //   return null;
                // } else if (states.contains(MaterialState.error)) {
                //   return null;
                // } else if (states.contains(MaterialState.scrolledUnder)) {
                //   return null;
                // } else if (states.contains(MaterialState.selected)) {
                //   return null;
              }
              return ApodDarkColorScheme.data.primary;
            },
          ),
          // TODO:
          // Foreground (text/icon) color
          foregroundColor: MaterialStateProperty.resolveWith<Color?>(
            (states) {
              return ApodDarkColorScheme.data.onPrimary; // Default color
            },
          ),
          // // Overlay color (the color that appears over the button when pressed, hovered, etc.)
          // overlayColor: MaterialStateProperty.resolveWith<Color?>(
          //   (states) {
          //     if (states.contains(MaterialState.pressed)) {
          //       return Colors.blueAccent;
          //     }
          //     return null; // No overlay by default
          //   },
          // ),
          // // Button's elevation
          // elevation: MaterialStateProperty.resolveWith<double>(
          //   (states) {
          //     if (states.contains(MaterialState.pressed)) {
          //       return 15; // Higher elevation when pressed
          //     }
          //     return 4; // Default elevation
          //   },
          // ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          // // Padding inside the button
          // padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          //   const EdgeInsets.symmetric(
          //       vertical: 20.0, horizontal: 40.0), // Custom padding
          // ),
          // // Typography
          // textStyle: MaterialStateProperty.all<TextStyle>(
          //   const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          // ),
        ),
      );
}
