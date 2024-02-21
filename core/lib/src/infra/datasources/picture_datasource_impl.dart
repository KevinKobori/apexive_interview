import 'package:dartz/dartz.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

class PictureDatasourceImpl implements PictureDatasource {
  final HttpClient httpClient;

  PictureDatasourceImpl(this.httpClient);

  @override
  Future<Either<DomainFailure, List<PictureModel>>> fetchCatalogByStartEndDate(
      String url) async {
    final requestResult =
        await httpClient.request(method: HttpMethod.get, url: url);

    return await requestResult.fold(
      /// Left
      (httpFailure) => Left(httpFailure.toDomain),

      /// Right
      (data) {
        final jsonListResult = JsonMapper.tryDecode(data);

        return jsonListResult.fold(
          /// Left
          (mapperFailure) => Left(mapperFailure.toDomain),

          /// Right
          (dynamicList) {
            final pictureJsonListResult =
                JsonMapper.fromDynamicListToJsonList(dynamicList);
            return pictureJsonListResult.fold(
              /// Left
              (mapperFailure) => Left(mapperFailure.toDomain),

              /// Right
              (pictureJsonList) {
                final pictureModelListResult =
                    PictureMapper.fromJsonListToModelList(pictureJsonList);
                return pictureModelListResult.fold(
                  /// Left
                  (mapperFailure) => Left(mapperFailure.toDomain),

                  /// Right
                  (pictureModelList) => Right(pictureModelList),
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  Future<Either<DomainFailure, PictureModel>> fetchPictureByDate(
      String url) async {
    final resultHttpClient =
        await httpClient.request(method: HttpMethod.get, url: url);
    return resultHttpClient.fold(
      /// Left
      (httpFailure) => Left(httpFailure.toDomain),

      /// Right
      (data) {
        final jsonResult = JsonMapper.tryDecode(data);
        return jsonResult.fold(
          /// Left
          (mapperFailure) => Left(mapperFailure.toDomain),

          /// Right
          (pictureJson) {
            final modelResult = PictureMapper.fromJsonToModel(
                pictureJson as Map<String, dynamic>);
            return modelResult.fold(
              /// Left
              (mapperFailure) => Left(mapperFailure.toDomain),

              /// Right
              (pictureModel) => Right(pictureModel),
            );
          },
        );
      },
    );
  }
}
