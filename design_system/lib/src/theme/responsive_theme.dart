import 'dart:ui' as ui;

import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

enum ApodAppThemeColorMode {
  light,
  dark,
  highContrast,
}

/// Updates automatically the [ApodTheme] regarding the current [MediaQuery],
/// as soon as the [theme] isn't overriden.
class ApodAppResponsiveTheme extends StatelessWidget {
  const ApodAppResponsiveTheme({
    required this.appLogo,
    required this.child,
    required this.appWormLogo,
    super.key,
    this.darkAppLogo,
    this.darkAppWormLogo,
    this.colorMode,
    this.formFactor,
  });

  final ApodAppThemeColorMode? colorMode;
  final ApodAppFormFactor? formFactor;
  final Widget child;
  final String appLogo;
  final String? darkAppLogo;
  final String appWormLogo;
  final String? darkAppWormLogo;

  static ApodAppThemeColorMode colorModeOf(BuildContext context) {
    final platformBrightness = MediaQuery.platformBrightnessOf(context);
    final useDarkTheme = platformBrightness == ui.Brightness.dark;
    if (useDarkTheme) {
      return ApodAppThemeColorMode.dark;
    }
    final highContrast = MediaQuery.highContrastOf(context);
    if (highContrast) {
      return ApodAppThemeColorMode.highContrast;
    }

    return ApodAppThemeColorMode.light;
  }

  static ApodAppFormFactor formFactorOf(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    if (mediaQuery.size.width < 200) {
      return ApodAppFormFactor.small;
    }

    return ApodAppFormFactor.medium;
  }

  @override
  Widget build(BuildContext context) {
    var theme = ApodThemeData.regular(
      appLogo: appLogo,
      appWormLogo: appWormLogo,
    );

    /// Updating the colors for the current brightness
    final colorMode = this.colorMode ?? colorModeOf(context);
    switch (colorMode) {
      case ApodAppThemeColorMode.dark:
        theme = theme.withColors(ApodColorsData.dark());

        if (darkAppLogo != null) {
          theme = theme.withImages(theme.images.withAppLogo(darkAppLogo!));
        }
        break;
      case ApodAppThemeColorMode.highContrast:
        theme = theme.withColors(ApodColorsData.highContrast());
        theme = theme.withImages(
          ApodImagesData.highContrast(
            appLogo: theme.images.appLogo,
            appWormLogo: theme.images.appWormLogo,
          ),
        );
        break;
      case ApodAppThemeColorMode.light:
        break;
    }

    // Updating the sizes for current form factor.
    final formFactor = this.formFactor ?? formFactorOf(context);
    theme = theme.withFormFactor(formFactor);
    if (formFactor == ApodAppFormFactor.small) {
      theme = theme.withTypography(ApodTypographyData.small());
    }

    return ApodTheme(
      data: theme,
      child: child,
    );
  }
}
