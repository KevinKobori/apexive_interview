import 'package:nasa_apod_app/nasa_apod_app.dart';

CatalogPageBloc pagePresenterFactory() => CatalogPageBloc(
    loadCatalogByInitEndDate:
        remoteLoadCatalogByInitEndDateWithLocalFallbackUseCaseFactory());
