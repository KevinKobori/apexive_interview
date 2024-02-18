import 'package:dartz/dartz.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

mixin PictureDatasource {
  Future<Either<DomainFailure, List<PictureModel>>> fetchCatalogByStartEndDate(
      String url);

  Future<Either<DomainFailure, PictureModel>> fetchPictureByDate(String url);
}
