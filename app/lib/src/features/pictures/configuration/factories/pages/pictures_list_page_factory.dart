import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

StatefulWidget picturesPageFactory() => PicturesPage(
      picturesPagePresenter: picturesPagePresenterFactory(),
    );
