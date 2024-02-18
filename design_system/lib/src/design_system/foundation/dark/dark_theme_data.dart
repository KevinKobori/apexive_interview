import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

abstract final class DarkTheme {
  static ThemeData get data => ThemeData(
        extensions: <ThemeExtension<dynamic>>[
          XMetricsData(),
          XAssetsData(),
        ],
        useMaterial3: true,
        fontFamily: 'Secular_One',
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black.withOpacity(0.6),
        ),
        colorScheme: DarkColorScheme.data,
      );
}
