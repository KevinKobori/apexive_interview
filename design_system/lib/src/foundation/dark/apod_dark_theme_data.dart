import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

abstract final class ApodDarkTheme {
  static ThemeData data({ApodAppFormFactor? formFactor}) {
    const darkAppLogo = 'assets/images/nasa_logo.svg';
    const darkAppWormLogo = 'assets/images/nasa_worm_logo.svg';

    var customThemeData = ApodThemeData.regular(
      appLogo: darkAppLogo,
      appWormLogo: darkAppWormLogo,
    );
    if (formFactor != null) {
      customThemeData = customThemeData.withFormFactor(formFactor);
      if (formFactor == ApodAppFormFactor.small) {
        customThemeData =
            customThemeData.withTypography(ApodTypographyData.small());
      }
    }

    return ThemeData(
      extensions: <ThemeExtension<dynamic>>[
        ApodMetrics.data,
        ApodDarkAssets.data,
        customThemeData,
      ],
      useMaterial3: true,
      fontFamily: 'Poppins',
      textTheme: const TextTheme(),
      colorScheme: ApodDarkColorScheme.data,
    );
  }
}
