import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

class RemoteLoadCatalogByStartEndDateWithLocalFallbackUseCaseImpl
    implements RemoteLoadCatalogByStartEndDateUseCase {
  final RemoteLoadCatalogByStartEndDateUseCase remoteLoadCatalogByStartEndDate;
  final LocalSaveCatalogUseCase localSaveCatalog;
  final LocalValidateCatalogUseCase localValidateCatalog;
  final LocalLoadCatalogUseCase localLoadCatalog;

  RemoteLoadCatalogByStartEndDateWithLocalFallbackUseCaseImpl({
    required this.remoteLoadCatalogByStartEndDate,
    required this.localSaveCatalog,
    required this.localValidateCatalog,
    required this.localLoadCatalog,
  });

  @override
  Future<Either<DomainFailure, List<PictureEntity>>> call(
      LoadCatalogParams params) async {
    final result = await remoteLoadCatalogByStartEndDate.call(params);

    return await result.fold(
      (domainFailure) async {
        await localValidateCatalog.call(null);
        return await localLoadCatalog.call(null);
      },
      (pictureEntityList) async {
        await localSaveCatalog.call(pictureEntityList);
        return Right(pictureEntityList);
      },
    );
  }
}
