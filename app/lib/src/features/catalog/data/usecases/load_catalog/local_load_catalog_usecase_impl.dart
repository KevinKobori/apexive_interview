import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

class LocalLoadCatalogUseCaseImpl implements LocalLoadCatalogUseCase {
  final LocalStorage localStorage;
  final String itemKey;

  LocalLoadCatalogUseCaseImpl({
    required this.localStorage,
    required this.itemKey,
  });

  @override
  Future<Either<DomainFailure, List<PictureEntity>>> call(void _) async {
    final dataResult = await localStorage.fetch(itemKey);

    return dataResult.fold(
      /// Left
      (localStorageFailure) => Left(localStorageFailure.toDomain),

      /// Right
      (localData) {
        localData ??= <Map<String, dynamic>>[];
        final List<Map<String, dynamic>> jsonListData =
            List<Map<String, dynamic>>.from(localData);
        if (jsonListData.isEmpty != false) {
          return const Left(DomainFailure.unexpected());
        }

        final entityListResult =
            PictureMapper.fromJsonListToEntityList(jsonListData);
        return entityListResult.fold(
          /// Left
          (mapperFailure) => Left(mapperFailure.toDomain),

          /// Right
          (pictureEntity) => Right(pictureEntity),
        );
      },
    );
  }
}
