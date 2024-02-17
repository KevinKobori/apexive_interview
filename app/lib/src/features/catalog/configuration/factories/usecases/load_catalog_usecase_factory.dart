import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

String localStorageCatalogKeyFactory() => 'catalog';

RemoteLoadLastTenDaysPicturesByDateUseCaseImpl
    remoteLoadPicturesUseCaseFactory() =>
        RemoteLoadLastTenDaysPicturesByDateUseCaseImpl(
          apiKey: ApodEnvironmentConstants.apiKey,
          picturesRepository: pictureRepositoryFactory(),
        );

LocalLoadLastTenDaysPicturesByDateUseCaseImpl
    localLoadPicturesUseCaseFactory() =>
        LocalLoadLastTenDaysPicturesByDateUseCaseImpl(
          localStorage:
              localStorageAdapterFactory(localStorageConfigKeyPathFactory()),
          itemKey: localStorageCatalogKeyFactory(),
        );

LocalValidatePicturesUseCaseImpl localValidatePicturesUseCaseFactory() =>
    LocalValidatePicturesUseCaseImpl(
      localStorage:
          localStorageAdapterFactory(localStorageConfigKeyPathFactory()),
      itemKey: localStorageCatalogKeyFactory(),
    );

LocalSavePicturesUseCaseImpl localSavePicturesUseCaseFactory() =>
    LocalSavePicturesUseCaseImpl(
      localStorage:
          localStorageAdapterFactory(localStorageConfigKeyPathFactory()),
      itemKey: localStorageCatalogKeyFactory(),
    );

RemoteLoadLastTenDaysPicturesByDateWithLocalFallbackUseCaseImpl
    remoteLoadPicturesUseCaseWithLocalFallbackFactory() =>
        RemoteLoadLastTenDaysPicturesByDateWithLocalFallbackUseCaseImpl(
          remoteLoadLastTenDaysPicturesByDate:
              remoteLoadPicturesUseCaseFactory(),
          localLoadLastTenDaysPicturesByDate: localLoadPicturesUseCaseFactory(),
          localValidatePictures: localValidatePicturesUseCaseFactory(),
          localSavePictures: localSavePicturesUseCaseFactory(),
        );
