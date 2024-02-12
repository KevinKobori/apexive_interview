import 'package:dartz/dartz.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

mixin PictureDatasource {
  Future<Either<DomainFailure, List<PictureModel>>> fetchLastTenDaysData(
      String url);

  Future<Either<DomainFailure, PictureModel>> fetchByDate(String url);
}
