import 'package:dartz/dartz.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

mixin LocalLoadCatalogUseCase
    implements UseCase<DomainFailure, List<PictureEntity>, void> {
  @override
  Future<Either<DomainFailure, List<PictureEntity>>> call(void _);
}
