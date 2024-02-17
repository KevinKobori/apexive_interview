import 'package:nasa_apod_app/nasa_apod_app.dart';

CatalogPagePresenter catalogPagePresenterFactory() => CatalogPageBloc(
    loadLastTenDaysPicturesByDate:
        remoteLoadPicturesUseCaseWithLocalFallbackFactory());
