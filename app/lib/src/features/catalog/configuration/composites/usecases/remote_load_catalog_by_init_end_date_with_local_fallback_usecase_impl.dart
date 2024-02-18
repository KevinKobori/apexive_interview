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
    final loadResult = await remoteLoadCatalogByStartEndDate.call(params);

    return await loadResult.fold(
      /// Left
      (domainFailure) async {
        return await _getLocalData();
      },

      /// Right
      (pictureEntityList) async {
        await localSaveCatalog.call(pictureEntityList);
        return await _getLocalData();
      },
    );
  }

  Future<Either<DomainFailure, List<PictureEntity>>> _getLocalData() async {
    final validateResult = await localValidateCatalog.call(null);

    return await validateResult.fold(
      /// Left
      (domainFailure) => Left(domainFailure),

      /// Right
      (_) async {
        final loadResult = await localLoadCatalog.call(null);

        return loadResult.fold(
          /// Left
          (domainFailure) => Left(domainFailure),

          /// Right
          (pictureEntityList) => Right(pictureEntityList),
        );
      },
    );
  }
}
