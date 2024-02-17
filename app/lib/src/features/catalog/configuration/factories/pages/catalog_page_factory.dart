import 'package:nasa_apod_app/nasa_apod_app.dart';

CatalogPage CatalogPageFactory() => CatalogPage(
      pagePresenter: pagePresenterFactory(),
    );
