import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApodDotEnv {
  ///
  ApodDotEnv._internal();

  static final ApodDotEnv _instance = ApodDotEnv._internal();

  static ApodDotEnv get instance => _instance;

  static bool _hasInit = false;

  static Future<void> initialize() async {
    if (!_hasInit) {
      _hasInit = true;
      await _instance._initialize();
    }
  }

  Future<void> _initialize() async {
    await _loadDotEnv();
  }

  ///
  Future<void> _loadDotEnv() async => await dotenv.load(fileName: '.env');

  String get apiKey => dotenv.env['API_KEY'] ?? '';
}
