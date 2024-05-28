// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

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

  late EnvMode _envMode;
  EnvMode get envMode => _envMode;

  late String _baseURL;
  String get baseURL => _baseURL;

  late String _apiKey;
  String get apiKey => _apiKey;

  late int _connectTimeout;
  int get connectTimeout => _connectTimeout;

  late int _receiveTimeout;
  int get receiveTimeout => _receiveTimeout;

  Future<void> _initialize() async {
    await _loadDotEnv();
  }

  ///
  Future<void> _loadDotEnv() async {
    _envMode = EnvMode.values.byName(const String.fromEnvironment('ENV_MODE'));
    _apiKey = const String.fromEnvironment('API_KEY');
    _baseURL = const String.fromEnvironment('BASE_URL');
    _connectTimeout =
        const int.fromEnvironment('CONNECT_TIMEOUT', defaultValue: 30000);
    _receiveTimeout =
        const int.fromEnvironment('RECEIVE_TIMEOUT', defaultValue: 30000);
  }
}
