import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();

  await _startSingletons();

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWrapWidget(),
    ),
  );
}

Future<void> _startSingletons() async {
  await ApodDotEnv.initialize();
}
