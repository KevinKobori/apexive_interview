import 'package:flutter/material.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

abstract class ApodLightElevatedButtonTheme {
  static ElevatedButtonThemeData get data => ElevatedButtonThemeData(
        style: ButtonStyle(
          // Background color
          backgroundColor: WidgetStateProperty.resolveWith<Color?>(
            (states) {
              if (states.contains(WidgetState.disabled)) {
                return ApodLightColorScheme.data.primary;
              } else if (states.contains(WidgetState.hovered)) {
                return ApodLightColorScheme.data.secondary;
              } else if (states.contains(WidgetState.pressed)) {
                return ApodLightColorScheme.data.tertiary;
                // TODO(all):
                // } else if (states.contains(WidgetState.focused)) {
                //   return null;
                // } else if (states.contains(WidgetState.dragged)) {
                //   return null;
                // } else if (states.contains(WidgetState.error)) {
                //   return null;
                // } else if (states.contains(WidgetState.scrolledUnder)) {
                //   return null;
                // } else if (states.contains(WidgetState.selected)) {
                //   return null;
              }
              return ApodLightColorScheme.data.primary;
            },
          ),
          // TODO:
          // Foreground (text/icon) color
          foregroundColor: WidgetStateProperty.resolveWith<Color?>(
            (states) {
              return ApodLightColorScheme.data.onPrimary; // Default color
            },
          ),
          // // Overlay color (the color that appears over the button when pressed, hovered, etc.)
          // overlayColor: WidgetStateProperty.resolveWith<Color?>(
          //   (states) {
          //     if (states.contains(WidgetState.pressed)) {
          //       return Colors.blueAccent;
          //     }
          //     return null; // No overlay by default
          //   },
          // ),
          // // Button's elevation
          // elevation: WidgetStateProperty.resolveWith<double>(
          //   (states) {
          //     if (states.contains(WidgetState.pressed)) {
          //       return 15; // Higher elevation when pressed
          //     }
          //     return 4; // Default elevation
          //   },
          // ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          // // Padding inside the button
          // padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          //   const EdgeInsets.symmetric(
          //       vertical: 1.0, horizontal: 1.0), // Custom padding
          // ),
          // // Typography
          // textStyle: WidgetStateProperty.all<TextStyle>(
          //   const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          // ),
        ),
      );
}
