import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

/// This loads fonts for the test runner.
Future<void> loadTestFonts() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await _loadFamily(
    'nasa_apod_design_system',
    'apod_icons',
    [
      'fonts/apod_icons.ttf',
    ],
  );
  await _loadFamily(
    'nasa_apod_design_system',
    'Poppins',
    [
      'fonts/Poppins-Regular.ttf',
      'fonts/Poppins-Bold.ttf',
    ],
  );
}

Future<void> _loadFamily(
  String package,
  String name,
  List<String> assets,
) async {
  final prefix = 'packages/$package/';
  final fontLoader = FontLoader('$prefix$name');

  for (final asset in assets) {
    final bytes = rootBundle.load('$prefix$asset');
    fontLoader.addFont(bytes);
  }
  await fontLoader.load();
}
