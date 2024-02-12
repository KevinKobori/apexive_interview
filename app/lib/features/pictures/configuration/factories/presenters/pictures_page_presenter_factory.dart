import 'package:nasa_apod_app/nasa_apod_app.dart';

PicturesPagePresenter picturesPagePresenterFactory() => PicturesPageCubit(
    loadLastTenDaysPicturesByDate:
        remoteLoadPicturesUseCaseWithLocalFallbackFactory());
