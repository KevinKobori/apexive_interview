import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

abstract final class ApodLightTheme {
  static ThemeData data({ApodAppFormFactor? formFactor}) {
    const appLogo = 'assets/images/nasa_logo.svg';
    const appWormLogo = 'assets/images/nasa_worm_logo.svg';

    var customThemeData = ApodThemeData.regular(
      appLogo: appLogo,
      appWormLogo: appWormLogo,
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
        ApodLightAssets.data,
        customThemeData,
      ],
      useMaterial3: true,
      fontFamily: 'Poppins',
      textTheme: const TextTheme(),
      colorScheme: ApodLightColorScheme.data,
    );
  }
}
