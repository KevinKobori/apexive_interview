import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

class LocalValidateCatalogUseCaseImpl implements LocalValidateCatalogUseCase {
  final LocalStorage localStorage;
  final String itemKey;

  LocalValidateCatalogUseCaseImpl({
    required this.itemKey,
    required this.localStorage,
  });

  @override
  Future<Either<DomainFailure, void>> call(void _) async {
    final fetchResult = await localStorage.fetch(itemKey);
    return await fetchResult.fold(
      /// Left
      (domainFailure) async {
        final deleteResult = await localStorage.delete(itemKey);
        return deleteResult.fold(
          /// Left
          (localStorageFailure) {
            return Left(localStorageFailure.toDomain);
          },

          /// Right
          (_) {
            return const Right(null);
          },
        );
      },

      /// Right
      (data) {
        final modelListResult = PictureMapper.fromJsonListToModelList(data);
        return modelListResult.fold(
          /// Left
          (mapperFailure) async {
            final deleteResult = await localStorage.delete(itemKey);
            return deleteResult.fold(
              /// Left
              (domainFailure) {
                return Left(mapperFailure.toDomain);
              },

              /// Right
              (_) {
                return const Right(null);
              },
            );
          },

          /// Right
          (pictureModelList) {
            return const Right(null);
          },
        );
      },
    );
  }
}
