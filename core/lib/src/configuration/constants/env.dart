import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApodEnvironmentConstants {
  static Future<void> loadEnv() async => await dotenv.load(fileName: '.env');
  static String get apiKey => dotenv.env['API_KEY'] ?? '';
}
