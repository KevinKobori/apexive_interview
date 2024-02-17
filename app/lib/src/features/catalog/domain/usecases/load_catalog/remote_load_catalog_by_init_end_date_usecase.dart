import 'package:dartz/dartz.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

mixin RemoteLoadCatalogByInitEndDateUseCase
    implements UseCase<DomainFailure, List<PictureEntity>, DateTime> {
  @override
  Future<Either<DomainFailure, List<PictureEntity>>> call(DateTime initDate);
}
