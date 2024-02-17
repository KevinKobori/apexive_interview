import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

class LocalSaveCatalogUseCaseImpl implements LocalSaveCatalogUseCase {
  final LocalStorage localStorage;
  final String itemKey;

  LocalSaveCatalogUseCaseImpl({
    required this.itemKey,
    required this.localStorage,
  });

  @override
  Future<Either<DomainFailure, void>> call(
      List<PictureEntity> pictureEntityList) async {
    final result = PictureMapper.fromEntityListToJsonList(pictureEntityList);
    return await result.fold(
      /// Left
      (mapperFailure) => Left(mapperFailure.fromJsonperToDomain),

      /// Right
      (pictureJsonList) async {
        final saveResult = await localStorage.save(
            itemKey: itemKey, itemValue: pictureJsonList);
        return saveResult.fold(
          /// Left
          (localStorageFailure) =>
              Left(localStorageFailure.fromLocalStorageToDomain),

          /// Right
          (_) => const Right(null),
        );
      },
    );
  }
}
