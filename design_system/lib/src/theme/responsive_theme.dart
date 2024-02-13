import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nasa_apod_design_system/src/theme/data/form_factor.dart';
import 'package:nasa_apod_design_system/src/theme/data/images.dart';
import 'package:nasa_apod_design_system/src/theme/data/typography.dart';
import 'package:nasa_apod_design_system/src/theme/theme.dart';

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
    required this.appWarmLogo,
    super.key,
    this.darkAppLogo,
    this.darkAppWarmLogo,
    this.colorMode,
    this.formFactor,
  });

  final ApodAppThemeColorMode? colorMode;
  final ApodAppFormFactor? formFactor;
  final Widget child;
  final PictureProvider appLogo;
  final PictureProvider? darkAppLogo;
  final PictureProvider appWarmLogo;
  final PictureProvider? darkAppWarmLogo;

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
      appWarmLogo: appWarmLogo,
    );

    /// Updating the colors for the current brightness
    final colorMode = this.colorMode ?? colorModeOf(context);
    switch (colorMode) {
      case ApodAppThemeColorMode.dark:
        theme = theme.withColors(ApodColorsData.dark());

        final darkAppLogo = darkAppLogo;
        if (darkAppLogo != null) {
          theme = theme.withImages(theme.images.withAppLogo(darkAppLogo));
        }
        break;
      case ApodAppThemeColorMode.highContrast:
        theme = theme.withColors(ApodColorsData.highContrast());
        theme = theme.withImages(
          ApodImagesData.highContrast(
            appLogo: theme.images.appLogo,
            appWarmLogo: theme.images.appWarmLogo,
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
