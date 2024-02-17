import 'package:dartz/dartz.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

mixin RemoteLoadCatalogByStartEndDateUseCase
    implements UseCase<DomainFailure, List<PictureEntity>, LoadCatalogParams> {
  @override
  Future<Either<DomainFailure, List<PictureEntity>>> call(
      LoadCatalogParams params);
}

class LoadCatalogParams {
  final DateTime startDate;
  final DateTime endDate;

  const LoadCatalogParams({
    required this.startDate,
    required this.endDate,
  });
}
