import 'package:dartz/dartz.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

class PictureDatasourceImpl implements PictureDatasource {
  final HttpClient httpClient;

  PictureDatasourceImpl(this.httpClient);

  @override
  Future<Either<DomainFailure, List<PictureModel>>> fetchDataByStartEndDate(
      String url) async {
    final requestResult =
        await httpClient.request(method: HttpMethod.get, url: url);

    return await requestResult.fold(
      /// Left
      (httpFailure) => Left(httpFailure.fromHttpToDomain),

      /// Right
      (data) {
        final dynamicListResult = JsonMapper.tryDecode(data);
        return dynamicListResult.fold(
          /// Left
          (mapperFailure) => Left(mapperFailure.fromJsonperToDomain),

          /// Right
          (dynamicList) {
            final pictureJsonListResult =
                JsonMapper.fromDynamicListToJsonList(dynamicList);
            return pictureJsonListResult.fold(
              /// Left
              (mapperFailure) => Left(mapperFailure.fromJsonperToDomain),

              /// Right
              (pictureJsonList) {
                final pictureModelListResult =
                    PictureMapper.fromJsonListToModelList(pictureJsonList);
                return pictureModelListResult.fold(
                  /// Left
                  (mapperFailure) => Left(mapperFailure.fromJsonperToDomain),

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
  Future<Either<DomainFailure, PictureModel>> fetchByDate(String url) async {
    final resultHttpClient =
        await httpClient.request(method: HttpMethod.get, url: url);
    return resultHttpClient.fold(
      /// Left
      (httpFailure) => Left(httpFailure.fromHttpToDomain),

      /// Right
      (data) {
        final mapResult = JsonMapper.tryDecode(data);
        return mapResult.fold(
          /// Left
          (mapperFailure) => Left(mapperFailure.fromJsonperToDomain),

          /// Right
          (pictureJson) {
            final modelResult = PictureMapper.fromJsonToModel(
                pictureJson as Map<String, dynamic>);
            return modelResult.fold(
              /// Left
              (mapperFailure) => Left(mapperFailure.fromJsonperToDomain),

              /// Right
              (pictureModel) => Right(pictureModel),
            );
          },
        );
      },
    );
  }
}
