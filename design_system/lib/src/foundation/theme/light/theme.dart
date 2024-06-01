import 'package:flutter/material.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';
// import 'package:widget_toolkit/widget_toolkit.dart';

abstract final class ApodLightTheme {
  static ThemeData data({
    required XMetricsData metrics,
    required TextTheme textTheme,
  }) {
    final colorScheme = ApodLightColorScheme.data();

    return ThemeData(
      extensions: <ThemeExtension<dynamic>>[
        ApodLightAssets.data(),
        metrics,
        // WidgetToolkitTheme.light(),
        // ItemPickerTheme.light(),
      ],
      useMaterial3: true,
      // fontFamily: 'Poppins',
      textTheme: textTheme,
      colorScheme: colorScheme,
      elevatedButtonTheme: ApodLightElevatedButtonTheme.data(),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.all(colorScheme.onPrimary),
        trackColor: WidgetStateProperty.all(colorScheme.primary),
      ),
    );
//     return ThemeData.light().copyWith(
//       extensions: <ThemeExtension<dynamic>>[
//         ApodLightAssets.data(),
//         metrics,
//         // WidgetToolkitTheme.light(),
//         // ItemPickerTheme.light(),
//       ],
//       // useMaterial3: true,
//       applyElevationOverlayColor: true,
//       brightness: Brightness.light,
//       visualDensity: VisualDensity.adaptivePlatformDensity,
//       primaryColor: const Color(0xFF6750A4),
//       // primaryColorBrightness: Brightness.dark,
//       primaryColorLight: const Color(0xFF7660B6),
//       primaryColorDark: const Color(0xFF584189),
//       // accentColor: const Color(0xFF607D8B),
//       // accentColorBrightness: Brightness.dark,
//       canvasColor: const Color(0xFFFAFAFA),
//       scaffoldBackgroundColor: const Color(0xFFFAFAFA),
//       // bottomAppBarColor: const Color(0xFFFFFFFF),
//       cardColor: const Color(0xFFFFFFFF),
//       dividerColor: const Color(0x1F000000),
//       highlightColor: const Color(0x66BDBDBD),
//       splashColor: const Color(0x66C8C8C8),
//       // selectedRowColor: const Color(0xFFF5F5F5),
//       unselectedWidgetColor: const Color(0x8A000000),
//       disabledColor: const Color(0x61000000),
//       buttonTheme: const ButtonThemeData(
//         textTheme: ButtonTextTheme.primary,
//         minWidth: 88,
//         height: 36,
//         padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(2.0)),
//         ),
//       ),
//       toggleButtonsTheme: const ToggleButtonsThemeData(
//         fillColor: Color(0x1F000000),
//         selectedColor: Color(0xFFE0E0E0),
//         disabledColor: Color(0x61000000),
//         borderColor: Color(0xFF000000),
//         selectedBorderColor: Color(0xFF000000),
//         borderWidth: 1,
//         borderRadius: BorderRadius.all(Radius.circular(2.0)),
//       ),
//       sliderTheme: const SliderThemeData(
//         trackHeight: 1,
//         activeTrackColor: Color(0xFF6750A4),
//         inactiveTrackColor: Color(0x3D000000),
//         disabledInactiveTrackColor: Color(0x1F000000),
//         activeTickMarkColor: Color(0x8A000000),
//         inactiveTickMarkColor: Color(0x8A000000),
//         disabledActiveTickMarkColor: Color(0x1F000000),
//         disabledInactiveTickMarkColor: Color(0x1F000000),
//         thumbColor: Color(0xFF6750A4),
//         disabledThumbColor: Color(0x52000000),
//         thumbShape: RoundSliderThumbShape(),
//         overlayColor: Color(0x29000000),
//         valueIndicatorColor: Color(0xFF6750A4),
//         valueIndicatorShape: PaddleSliderValueIndicatorShape(),
//         showValueIndicator: ShowValueIndicator.onlyForDiscrete,
//       ),
//       tabBarTheme: const TabBarTheme(
//         indicatorSize: TabBarIndicatorSize.label,
//         labelColor: Color(0xFFFFFFFF),
//         unselectedLabelColor: Color(0x8A000000),
//       ),
//       chipTheme: const ChipThemeData(
//         backgroundColor: Color(0x1F000000),
//         brightness: Brightness.dark,
//         deleteIconColor: Color(0xFF000000),
//         disabledColor: Color(0x0C000000),
//         labelPadding: EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
//         labelStyle: TextStyle(
//           fontSize: 14,
//           fontWeight: FontWeight.w400,
//         ),
//         padding: EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4),
//         secondaryLabelStyle: TextStyle(
//           fontSize: 14,
//           fontWeight: FontWeight.w400,
//         ),
//         shape: StadiumBorder(
//           side: BorderSide(
//             color: Color(0xFF000000),
//             width: 1,
//           ),
//         ),
//       ),
//       dialogTheme: const DialogTheme(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(2.0)),
//         ),
//       ),
//       inputDecorationTheme: const InputDecorationTheme(
//         labelStyle: TextStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.w400,
//         ),
//         helperStyle: TextStyle(
//           fontSize: 14,
//           fontWeight: FontWeight.w400,
//         ),
//         hintStyle: TextStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.w400,
//         ),
//         errorStyle: TextStyle(
//           fontSize: 14,
//           fontWeight: FontWeight.w400,
//         ),
//         errorMaxLines: 2,
//         isDense: false,
//         contentPadding:
//             EdgeInsets.only(top: 12, bottom: 12, left: 12, right: 12),
//         prefixStyle: TextStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.w400,
//         ),
//         suffixStyle: TextStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.w400,
//         ),
//         counterStyle: TextStyle(
//           fontSize: 14,
//           fontWeight: FontWeight.w400,
//         ),
//         filled: false,
//         fillColor: Color(0x00000000),
//         errorBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Color(0xFF000000),
//             width: 1,
//           ),
//           borderRadius: BorderRadius.all(Radius.circular(2.0)),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Color(0xFF000000),
//             width: 1,
//           ),
//           borderRadius: BorderRadius.all(Radius.circular(2.0)),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Color(0xFF000000),
//             width: 1,
//           ),
//           borderRadius: BorderRadius.all(Radius.circular(2.0)),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Color(0xFF000000),
//             width: 1,
//           ),
//           borderRadius: BorderRadius.all(Radius.circular(2.0)),
//         ),
//         disabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Color(0xFF000000),
//             width: 1,
//           ),
//           borderRadius: BorderRadius.all(Radius.circular(2.0)),
//         ),
//         border: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Color(0xFF000000),
//             width: 1,
//           ),
//           borderRadius: BorderRadius.all(Radius.circular(2.0)),
//         ),
//       ),
//       floatingActionButtonTheme: const FloatingActionButtonThemeData(
//         foregroundColor: Color(0xFFFFFFFF),
//         backgroundColor: Color(0xFF6750A4),
//         elevation: 6,
//         highlightElevation: 12,
//         disabledElevation: 0,
//         focusElevation: 12,
//         hoverElevation: 10,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(24.0)),
//         ),
//         sizeConstraints: BoxConstraints.tightFor(
//           width: 56,
//           height: 56,
//         ),
//         extendedPadding: EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
//       ),
//       bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//         backgroundColor: Color(0xFFFAFAFA),
//         selectedItemColor: Color(0xFF6750A4),
//         unselectedItemColor: Color(0x8A000000),
//         elevation: 8,
//         selectedLabelStyle: TextStyle(
//           fontSize: 14,
//           fontWeight: FontWeight.w500,
//         ),
//         unselectedLabelStyle: TextStyle(
//           fontSize: 14,
//           fontWeight: FontWeight.w400,
//         ),
//       ),
//     );
//     // navigationRailTheme: const NavigationRailThemeData(
//     //   backgroundColor: Color(0xFFFAFAFA

// // Build for me a full customizable ThemeData, i want you to implement for me every ThemeData field, including the childs, i want everyfield of every child field etc based on default google platforms theme, i want google colors, google styles etc
  }
}
