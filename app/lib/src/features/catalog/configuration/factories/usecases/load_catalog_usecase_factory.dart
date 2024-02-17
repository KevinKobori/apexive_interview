import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

String localStorageCatalogKeyFactory() => 'catalog';

RemoteLoadCatalogByInitEndDateUseCaseImpl remoteLoadCatalogByInitEndDateUseCaseFactory() =>
    RemoteLoadCatalogByInitEndDateUseCaseImpl(
      apiKey: ApodEnvironmentConstants.apiKey,
      pictureRepository: pictureRepositoryFactory(),
    );

LocalLoadCatalogUseCaseImpl
    localLoadCatalogUseCaseImplFactory() =>
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

RemoteLoadCatalogByInitEndDateWithLocalFallbackUseCaseImpl
    remoteLoadCatalogByInitEndDateWithLocalFallbackUseCaseFactory() =>
        RemoteLoadCatalogByInitEndDateWithLocalFallbackUseCaseImpl(
          remoteLoadCatalogByInitEndDate: remoteLoadCatalogByInitEndDateUseCaseFactory(),
          localLoadCatalog: localLoadCatalogUseCaseImplFactory(),
          localValidateCatalog: localValidateCatalogUseCaseFactory(),
          localSaveCatalog: localSaveCatalogUseCaseFactory(),
        );
