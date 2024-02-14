import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

String localStorageItemKeyFactory() => 'pictures_list';

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
          itemKey: localStorageItemKeyFactory(),
        );

LocalValidatePicturesUseCaseImpl localValidatePicturesUseCaseFactory() =>
    LocalValidatePicturesUseCaseImpl(
      localStorage:
          localStorageAdapterFactory(localStorageConfigKeyPathFactory()),
      itemKey: localStorageItemKeyFactory(),
    );

LocalSavePicturesUseCaseImpl localSavePicturesUseCaseFactory() =>
    LocalSavePicturesUseCaseImpl(
      localStorage:
          localStorageAdapterFactory(localStorageConfigKeyPathFactory()),
      itemKey: localStorageItemKeyFactory(),
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
