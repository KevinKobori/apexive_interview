import 'package:flutter/material.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';
import 'package:test_utils/test_utils.dart';

void testAppWidgets(
  String name,
  Map<String, Widget> widgets, {
  Size baseSize = const Size(1024.0, 800.0),
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

  appTestWidgets(
    name,
    widgets.map(
      (key, value) => MapEntry(
        key,
        MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Nasa Apod',
          theme: ApodLightTheme.data(XFormFactor.medium),
          darkTheme: ApodDarkTheme.data(XFormFactor.medium),
          themeMode: ThemeMode.dark,
          home: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [...configurations.map((builder) => builder(value))],
          ),
        ),
      ),
    ),
    size: Size(
      800,
      1024.0 * configurations.length,
    ),
  );
}
