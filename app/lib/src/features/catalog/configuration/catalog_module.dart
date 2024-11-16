import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class CatalogModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (_) => catalogPageFactory());
  }
}
