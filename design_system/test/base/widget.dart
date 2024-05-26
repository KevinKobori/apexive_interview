import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';
import 'package:test_utils/test_utils.dart';

void testAppWidgets(
  String name,
  Map<String, Widget> widgets, {
  Size baseSize = const Size(
    XStandardSizes.x1024,
    XAuxiliarySizes.x800,
  ),
}) {
  final configurations = <WidgetBuilderCallback>[
    (child) => Expanded(
          child: Center(
            child: child,
          ),
        ),
    (child) => Expanded(
          child: ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: child,
          ),
        ),
  ];

  const formFactor = XFormFactor.medium;
  final metrics = ApodMetrics.data(formFactor);
  final textTheme = ApodTextTheme.data(formFactor);

  appTestWidgets(
    name,
    widgets.map(
      (key, value) => MapEntry(
        key,
        // TODO(all): NEED TO TEST THE ADITION OF THIS WIDGET 'MixTheme'
        MixTheme(
          data: ApodMixLightTheme.data(metrics),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Nasa Apod',
            theme: ApodLightTheme.data(
              metrics: metrics,
              textTheme: textTheme,
            ),
            darkTheme: ApodDarkTheme.data(
              metrics: metrics,
              textTheme: textTheme,
            ),
            themeMode: ThemeMode.dark,
            home: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ...configurations.map((builder) => builder(value)),
              ],
            ),
          ),
        ),
      ),
    ),
    size: Size(
      XAuxiliarySizes.x800,
      XStandardSizes.x1024 * configurations.length,
    ),
  );
}
