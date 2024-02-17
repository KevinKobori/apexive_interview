import 'package:dartz/dartz.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

mixin PictureRepository {
  Future<Either<DomainFailure, List<PictureEntity>>> getDataByStartEndDate(
      String url);
}
