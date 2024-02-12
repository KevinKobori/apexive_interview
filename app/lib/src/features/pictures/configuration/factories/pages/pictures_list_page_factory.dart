import 'package:flutter/widgets.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

StatefulWidget picturesPageFactory() => PicturesPage(
      picturesPagePresenter: picturesPagePresenterFactory(),
    );
