import 'package:dartz/dartz.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

abstract final class PictureMapper {
  static Either<MapperFailure, PictureModel> fromEntityToModel(
      PictureEntity pictureEntity) {
    final pictureModel = PictureModel(
      copyright: pictureEntity.copyright,
      date: DateTime(
        pictureEntity.date.year,
        pictureEntity.date.month,
        pictureEntity.date.day,
      ),
      explanation: pictureEntity.explanation,
      hdurl: pictureEntity.hdurl,
      mediaType: MediaType.values.byName(pictureEntity.mediaType),
      serviceVersion: pictureEntity.serviceVersion,
      title: pictureEntity.title,
      url: pictureEntity.url,
    );

    return Right(pictureModel);
  }

  static Either<MapperFailure, List<PictureModel>> fromEntityListToModelList(
      List<PictureEntity> pictureEntityList) {
    try {
      final pictureModelList = pictureEntityList
          .map((pictureEntity) => fromEntityToModel(pictureEntity)
              .getOrElse(() => throw const MapperFailure.conversionError()))
          .toList();

      /// Right
      return Right(pictureModelList);
    } catch (_) {
      /// Left
      return const Left(MapperFailure.conversionError());
    }
  }

  static Either<MapperFailure, PictureEntity> fromModelToEntity(
      PictureModel pictureModel) {
    final pictureEntity = PictureEntity(
      copyright: pictureModel.copyright,
      date: pictureModel.date,
      explanation: pictureModel.explanation,
      hdurl: pictureModel.hdurl,
      mediaType: pictureModel.mediaType.name,
      serviceVersion: pictureModel.serviceVersion,
      title: pictureModel.title,
      url: pictureModel.url,
    );

    return Right(pictureEntity);
  }

  static Either<MapperFailure, List<PictureEntity>> fromModelListToEntityList(
      List<PictureModel> pictureModelList) {
    try {
      final pictureEntityList = pictureModelList
          .map((pictureModel) => fromModelToEntity(pictureModel)
              .getOrElse(() => throw const MapperFailure.conversionError()))
          .toList();
      return Right(pictureEntityList);
    } catch (_) {
      /// Left
      return const Left(MapperFailure.conversionError());
    }
  }

  static Future<Either<MapperFailure, PictureViewModel>> fromEntityToViewModel(
      PictureEntity pictureEntity) async {
    final apodDate =
        DateTimeMapper.getStringFromDateTimeYMD(pictureEntity.date);

    double aspectRatio = 1;

    if (pictureEntity.mediaType == MediaType.image.name) {
      aspectRatio = await ImageHelper.getImageAspectRatio(pictureEntity.url);
    } else {
      aspectRatio = 16 / 9;
    }

    final pictureViewModel = PictureViewModel(
      copyright: pictureEntity.copyright,
      date: apodDate,
      explanation: pictureEntity.explanation,
      hdurl: pictureEntity.hdurl,
      mediaType: MediaType.values.byName(pictureEntity.mediaType),
      serviceVersion: pictureEntity.serviceVersion,
      title: pictureEntity.title,
      url: pictureEntity.url,
      aspectRatio: aspectRatio,
    );

    return Right(pictureViewModel);
  }

  static Future<Either<MapperFailure, List<PictureViewModel>>>
      fromEntityListToViewModelList(
          List<PictureEntity> pictureEntityList) async {
    final List<PictureViewModel> pictureViewModelList = [];
    for (final pictureEntity in pictureEntityList) {
      final result = await fromEntityToViewModel(pictureEntity);
      if (result.isLeft()) {
        /// Left
        return const Left(MapperFailure.conversionError());
      }
      result.fold((l) => null, (r) => pictureViewModelList.add(r));
    }
    return Right(pictureViewModelList);
  }

  static Either<MapperFailure, Map<String, dynamic>> fromModelToJson(
      PictureModel pictureModel) {
    try {
      final json = pictureModel.toJson();

      /// Right
      return Right(json);
    } catch (_) {
      /// Left
      return const Left(MapperFailure.conversionError());
    }
  }

  static Either<MapperFailure, List<Map<String, dynamic>>>
      fromModelListToJsonList(List<PictureModel> pictureModelList) {
    try {
      final jsonList = pictureModelList
          .map((pictureModel) => fromModelToJson(pictureModel)
              .getOrElse(() => throw const MapperFailure.conversionError()))
          .toList();

      /// Right
      return Right(jsonList);
    } catch (_) {
      /// Left
      return const Left(MapperFailure.conversionError());
    }
  }

  static Either<MapperFailure, PictureModel> fromJsonToModel(
      Map<String, dynamic> json) {
    try {
      final pictureModel = PictureModel.fromJson(json);

      /// Right
      return Right(pictureModel);
    } catch (_) {
      /// Left
      return const Left(MapperFailure.conversionError());
    }
  }

  static Either<MapperFailure, List<PictureModel>> fromJsonListToModelList(
      List<Map<String, dynamic>> jsonList) {
    try {
      final pictureModelList = jsonList
          .map((json) => fromJsonToModel(json)
              .getOrElse(() => throw const MapperFailure.conversionError()))
          .toList();

      /// Right
      return Right(pictureModelList);
    } catch (_) {
      /// Left
      return const Left(MapperFailure.conversionError());
    }
  }

  static Either<MapperFailure, PictureEntity> fromJsonToEntity(
      Map<String, dynamic> json) {
    return fromJsonToModel(json).flatMap(fromModelToEntity);
  }

  static Either<MapperFailure, List<PictureEntity>> fromJsonListToEntityList(
      List<Map<String, dynamic>> jsonList) {
    try {
      final list = jsonList
          .map((json) => fromJsonToEntity(json)
              .getOrElse(() => throw const MapperFailure.conversionError()))
          .toList();

      /// Right
      return Right(list);
    } catch (_) {
      /// Left
      return const Left(MapperFailure.conversionError());
    }
  }

  static Future<Either<MapperFailure, PictureViewModel>> fromJsonToViewModel(
      Map<String, dynamic> json) async {
    final entityEither = fromJsonToEntity(json);
    if (entityEither.isLeft()) {
      return entityEither as Future<Either<MapperFailure, PictureViewModel>>;
    }

    return entityEither.fold(
      /// Left
      (mapperFailure) => Left(mapperFailure),

      /// Right
      (pictureEntity) async => await fromEntityToViewModel(pictureEntity),
    );
  }

  static Either<MapperFailure, Map<String, dynamic>> fromEntityToJson(
      PictureEntity pictureEntity) {
    return fromEntityToModel(pictureEntity).flatMap(fromModelToJson);
  }

  static Either<MapperFailure, List<Map<String, dynamic>>>
      fromEntityListToJsonList(List<PictureEntity> pictureEntityList) {
    try {
      final jsonList = pictureEntityList
          .map((pictureEntity) => fromEntityToJson(pictureEntity)
              .getOrElse(() => throw const MapperFailure.conversionError()))
          .toList();

      /// Right
      return Right(jsonList);
    } catch (_) {
      /// Left
      return const Left(MapperFailure.conversionError());
    }
  }
}
