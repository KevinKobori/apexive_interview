import 'package:flutter/material.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ApodAppBuilder extends StatelessWidget {
  const ApodAppBuilder({
    super.key,
    this.formFactor,
    this.routerConfig,
    this.child,
    this.themeMode = ThemeMode.light,
  });

  final XFormFactor? formFactor;
  final Widget? child;
  final RouterConfig<Object>? routerConfig;
  final ThemeMode themeMode;

  static XFormFactor formFactorOf(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    if (mediaQuery.size.width < 200) {
      return XFormFactor.small;
    }

    return XFormFactor.medium;
  }

  @override
  Widget build(BuildContext context) {
    final formFactor = this.formFactor ?? ApodAppBuilder.formFactorOf(context);

    return child ??
        MaterialApp.router(
          title: 'Nasa Apod',
          routerConfig: routerConfig,
          debugShowCheckedModeBanner: false,
          theme: ApodLightTheme.data(formFactor),
          darkTheme: ApodDarkTheme.data(formFactor),
          themeMode: themeMode,
        );
  }
}
