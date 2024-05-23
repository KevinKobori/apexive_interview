import 'package:flutter_dotenv/flutter_dotenv.dart';
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

  String get apiKey => dotenv.env['API_KEY'] ?? '';
  EnvMode get envMode => EnvMode.values.byName(dotenv.env['ENV_MODE'] ?? '');

  Future<void> _initialize() async {
    await _loadDotEnv();
  }

  ///
  Future<void> _loadDotEnv() async {
    await dotenv.load(fileName: '.env.PUBLIC');

    switch (envMode) {
      // Demo or Showcase: Configured for demonstrating the software's features to stakeholders or for marketing purposes.
      case EnvMode.DEMO:
        await dotenv.load(fileName: '.env.DEMO');
        break;
      // Feature Branches: While not an environment in the traditional sense, this allows for testing features in isolation.
      case EnvMode.FEAT:
        await dotenv.load(fileName: '.env.FEAT');
        break;
      // Local or Development: The environment for development on a developer's machine, with specific settings for rapid testing and development.
      case EnvMode.DEV:
        await dotenv.load(fileName: '.env.DEV');
        break;
      // Testing: An environment dedicated to rigorous automated or manual testing to ensure software behaves as expected in production.
      case EnvMode.TESTING:
        await dotenv.load(fileName: '.env.TESTING');
        break;
      // QA (Quality Assurance): Focuses on verifying the quality and integrity of the software through various types of testing.
      case EnvMode.QA:
        await dotenv.load(fileName: '.env.QA');
        break;
      // UAT (User Acceptance Testing): Allows end-users or stakeholders to test the software in a production-like environment to validate it meets their requirements.
      case EnvMode.UAT:
        await dotenv.load(fileName: '.env.UAT');
        break;
      // Staging: An environment that mimics production as closely as possible, used for final testing before deployment to production.
      case EnvMode.STAGING:
        await dotenv.load(fileName: '.env.STAGING');
        break;
      // Pre-production: A mirror of the production environment for final checks before deployment, ideal for previewing upcoming features.
      case EnvMode.PRE_PROD:
        await dotenv.load(fileName: '.env.PRE_PROD');
        break;
      // Production: The live environment used by end-users, where the final product is deployed.
      case EnvMode.PROD:
        await dotenv.load(fileName: '.env.PROD');
        break;
    }
  }
}
