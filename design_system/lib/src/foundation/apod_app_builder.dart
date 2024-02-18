import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

/// Updates automatically the [ApodTheme] regarding the current [MediaQuery],
/// as soon as the [theme] isn't overriden.
class ApodAppBuilder extends StatelessWidget {
  const ApodAppBuilder({
    super.key,
    this.formFactor,
    this.routerConfig,
    this.child,
    this.themeMode = ThemeMode.light,
  });

  final ApodAppFormFactor? formFactor;
  final Widget? child;
  final RouterConfig<Object>? routerConfig;
  final ThemeMode themeMode;

  static ApodAppFormFactor formFactorOf(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    if (mediaQuery.size.width < 200) {
      return ApodAppFormFactor.small;
    }

    return ApodAppFormFactor.medium;
  }

  @override
  Widget build(BuildContext context) {
    final formFactor = this.formFactor ?? ApodAppBuilder.formFactorOf(context);

    return child ??
        MaterialApp.router(
          title: 'Nasa Apod',
          routerConfig: routerConfig,
          debugShowCheckedModeBanner: false,
          theme: ApodLightTheme.data(formFactor: formFactor),
          darkTheme: ApodDarkTheme.data(formFactor: formFactor),
          themeMode: themeMode,
        );
  }
}
