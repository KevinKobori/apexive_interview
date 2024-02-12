import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class PicturesModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (_) => picturesPageFactory());

    r.child(
      '/picture/detail/:pictureDate/:aspectRatio',
      child: (context) => pictureDetailPageFactory(
        aspectRatio: double.parse(r.args.params['aspectRatio']!),
        pictureDate: r.args.params['pictureDate']!,
        pictureViewModel: r.args.data,
      ),
    );
  }
}
