import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ApodAppBuilder(
      routerConfig: Modular.routerConfig,
      themeMode: ThemeMode.dark,
    );
  }
}
