import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

String localStorageCatalogKeyFactory() => 'catalog';

RemoteLoadCatalogByStartEndDateUseCaseImpl
    remoteLoadCatalogByStartEndDateUseCaseFactory() =>
        RemoteLoadCatalogByStartEndDateUseCaseImpl(
          apiKey: ApodDotEnv.instance.apiKey,
          pictureRepository: pictureRepositoryFactory(),
        );

LocalLoadCatalogUseCaseImpl localLoadCatalogUseCaseImplFactory() =>
    LocalLoadCatalogUseCaseImpl(
      localStorage:
          localStorageAdapterFactory(localStorageConfigKeyPathFactory()),
      itemKey: localStorageCatalogKeyFactory(),
    );

LocalValidateCatalogUseCase localValidateCatalogUseCaseFactory() =>
    LocalValidateCatalogUseCaseImpl(
      localStorage:
          localStorageAdapterFactory(localStorageConfigKeyPathFactory()),
      itemKey: localStorageCatalogKeyFactory(),
    );

LocalSaveCatalogUseCase localSaveCatalogUseCaseFactory() =>
    LocalSaveCatalogUseCaseImpl(
      localStorage:
          localStorageAdapterFactory(localStorageConfigKeyPathFactory()),
      itemKey: localStorageCatalogKeyFactory(),
    );

RemoteLoadCatalogByStartEndDateWithLocalFallbackUseCaseImpl
    remoteLoadCatalogByStartEndDateWithLocalFallbackUseCaseFactory() =>
        RemoteLoadCatalogByStartEndDateWithLocalFallbackUseCaseImpl(
          remoteLoadCatalogByStartEndDate:
              remoteLoadCatalogByStartEndDateUseCaseFactory(),
          localLoadCatalog: localLoadCatalogUseCaseImplFactory(),
          localValidateCatalog: localValidateCatalogUseCaseFactory(),
          localSaveCatalog: localSaveCatalogUseCaseFactory(),
        );
