import 'package:dartz/dartz.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

mixin LocalDeletePicturesUseCase
    implements UseCase<DomainFailure, void, List<PictureEntity>> {
  @override
  Future<Either<DomainFailure, void>> call(
      List<PictureEntity> pictureEntityList);
}
