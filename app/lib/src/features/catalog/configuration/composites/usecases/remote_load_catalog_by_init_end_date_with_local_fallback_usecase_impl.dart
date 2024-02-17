import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

class RemoteLoadCatalogByInitEndDateWithLocalFallbackUseCaseImpl
    implements RemoteLoadCatalogByInitEndDateUseCase {
  final RemoteLoadCatalogByInitEndDateUseCase remoteLoadCatalogByInitEndDate;
  final LocalSaveCatalogUseCase localSaveCatalog;
  final LocalValidateCatalogUseCase localValidateCatalog;
  final LocalLoadCatalogUseCase localLoadCatalog;

  RemoteLoadCatalogByInitEndDateWithLocalFallbackUseCaseImpl({
    required this.remoteLoadCatalogByInitEndDate,
    required this.localSaveCatalog,
    required this.localValidateCatalog,
    required this.localLoadCatalog,
  });

  @override
  Future<Either<DomainFailure, List<PictureEntity>>> call(DateTime date) async {
    final result = await remoteLoadCatalogByInitEndDate.call(date);

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
