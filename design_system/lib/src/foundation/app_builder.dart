import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mix/mix.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ApodAppBuilder extends StatelessWidget {
  final bool showSemanticsDebugger;
  final bool debugShowCheckedModeBanner;
  final XFormFactor? formFactor;
  final Widget? child;
  final RouterConfig<Object>? routerConfig;
  final ThemeMode themeMode;

  const ApodAppBuilder({
    super.key,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.formFactor,
    this.routerConfig,
    this.child,
    this.themeMode = ThemeMode.light,
  });

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
    final metrics = ApodMetrics.data(formFactor);
    final textTheme = ApodTextTheme.data(formFactor);

    final lightTheme = ApodLightTheme.data(
      metrics: metrics,
      textTheme: textTheme,
    );

    final darkTheme = ApodDarkTheme.data(
      metrics: metrics,
      textTheme: textTheme,
    );

    final mixTheme = ApodMixLightTheme.data(
      themeMode == ThemeMode.light
          ? lightTheme.extension<XMetricsData>()!
          : darkTheme.extension<XMetricsData>()!,
    );

    return MixTheme(
      data: mixTheme,
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          ScreenUtil.init(context);
          return child ??
              MaterialApp.router(
                title: 'Nasa Apod',
                showSemanticsDebugger: showSemanticsDebugger,
                debugShowCheckedModeBanner: debugShowCheckedModeBanner,
                routerConfig: routerConfig,
                theme: lightTheme,
                darkTheme: darkTheme,
                themeMode: themeMode,
                builder: (context, child) {
                  return MediaQuery(
                    data: MediaQuery.of(context)
                        .copyWith(textScaler: const TextScaler.linear(1.0)),
                    child: child ??
                        const ApodBlancBox(
                            logMessage:
                                'This can not happen. [ApodAppBuilder]'),
                  );
                },
              );
        },
      ),
    );
  }
}
