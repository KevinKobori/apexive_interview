import 'package:dartz/dartz.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

class PictureRepositoryImpl implements PictureRepository {
  final PictureDatasource pictureDatasource;
  final DeviceInfo networkInfo;

  PictureRepositoryImpl({
    required this.pictureDatasource,
    required this.networkInfo,
  });

  @override
  Future<Either<DomainFailure, List<PictureEntity>>> getCatalogByStartEndDate(
      String url) async {
    if (!(await networkInfo.isConnected())) {
      /// Left
      return const Left(DomainFailure.notHaveInternetConnection());
    } else {
      /// Right
      final resultDataSource =
          await pictureDatasource.fetchCatalogByStartEndDate(url);

      return resultDataSource.fold(
        /// Left
        (domainFailure) => Left(domainFailure),

        /// Right
        (pictureModelList) {
          final entityListResult =
              PictureMapper.fromModelListToEntityList(pictureModelList);

          return entityListResult.fold(
            /// Left
            (mapperFailure) => Left(mapperFailure.toDomain()),

            /// Right
            (entityList) => Right(entityList),
          );
        },
      );
    }
  }
}
