import 'package:dartz/dartz.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

abstract final class PictureMapper {
  static Either<MapperFailure, PictureModel> fromEntityToModel(
      PictureEntity pictureEntity) {
    final model = PictureModel(
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

    return Right(model);
  }

  static Either<MapperFailure, List<PictureModel>> fromEntityListToModelList(
      List<PictureEntity> pictureEntityList) {
    try {
      final pictureModelList = pictureEntityList
          .map((pictureEntity) => fromEntityToModel(pictureEntity)
              .getOrElse(() => throw const MapperFailure.conversionError()))
          .toList();
      return Right(pictureModelList);
    } catch (_) {
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

  // static Future<Either<MapperFailure, List<PictureViewModel>>>
  //     fromEntityListToViewModelList(
  //         List<PictureEntity> pictureEntityList) async {
  //   try {
  //     final pictureViewModelList = pictureEntityList.map((pictureEntity) async {
  //       final result = await fromEntityToViewModel(pictureEntity);
  //       return result
  //           .getOrElse(() => throw const MapperFailure.conversionError());
  //     }).toList();

  //     return Right(pictureViewModelList);
  //   } catch (_) {
  //     return const Left(MapperFailure.conversionError());
  //   }
  // }

  static Future<Either<MapperFailure, List<PictureViewModel>>>
      fromEntityListToViewModelList(
          List<PictureEntity> pictureEntityList) async {
    final List<PictureViewModel> pictureViewModelList = [];
    for (final pictureEntity in pictureEntityList) {
      final result = await fromEntityToViewModel(pictureEntity);
      if (result.isLeft()) {
        // If any conversion fails, return immediately with the failure
        return const Left(MapperFailure.conversionError());
      }
      // Assuming the failure doesn't stop the process, add the view model to the list
      result.fold(
          (l) =>
              null, // This block shouldn't execute due to the isLeft check above
          (r) => pictureViewModelList.add(r));
    }
    // If all entities were successfully converted, return the list of view models
    return Right(pictureViewModelList);
  }

  static Either<MapperFailure, Map<String, dynamic>> fromModelToJson(
      PictureModel model) {
    try {
      final json = model.toJson();
      return Right(json);
    } catch (_) {
      return const Left(MapperFailure.conversionError());
    }
  }

  static Either<MapperFailure, List<Map<String, dynamic>>>
      fromModelListToJsonList(List<PictureModel> modelList) {
    try {
      final jsonList = modelList
          .map((model) => fromModelToJson(model)
              .getOrElse(() => throw const MapperFailure.conversionError()))
          .toList();
      return Right(jsonList);
    } catch (_) {
      return const Left(MapperFailure.conversionError());
    }
  }

  static Either<MapperFailure, PictureModel> fromJsonToModel(
      Map<String, dynamic> json) {
    try {
      // TODO: NOW HERE
      final pictureModel = PictureModel.fromJson(json);
      return Right(pictureModel);
    } catch (_) {
      return const Left(MapperFailure.conversionError());
    }
  }

  static Either<MapperFailure, List<PictureModel>> fromJsonListToModelList(
      List<Map<String, dynamic>> jsonList) {
    try {
      // TODO: NOW HERE
      final pictureModelList = jsonList
          .map((json) => fromJsonToModel(json)
              .getOrElse(() => throw const MapperFailure.conversionError()))
          .toList();
      return Right(pictureModelList);
    } catch (_) {
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
      return Right(list);
    } catch (_) {
      return const Left(MapperFailure.conversionError());
    }
  }

  // static Either<MapperFailure, PictureViewModel> fromJsonToViewModel(
  //     Map<String, dynamic> json) {
  //   return fromJsonToEntity(json).flatMap(fromEntityToViewModel);
  // }

  static Future<Either<MapperFailure, PictureViewModel>> fromJsonToViewModel(
      Map<String, dynamic> json) async {
    // Convert JSON to Entity and check for failure
    final entityEither = fromJsonToEntity(json);
    if (entityEither.isLeft()) {
      // If the conversion failed, immediately return the failure
      return entityEither as Future<Either<MapperFailure, PictureViewModel>>;
    }

    // Await the asynchronous operation of converting Entity to ViewModel
    return entityEither.fold(
      (failure) async => Left(failure), // Pass through failure
      (entity) async => await fromEntityToViewModel(
          entity), // Await the conversion from entity to ViewModel
    );
  }

  // TODO: NOW - REMOVE IT
  static Future<Either<MapperFailure, PictureViewModel>> fromModelToViewModel(
      PictureModel pictureModel) async {
    return await fromModelToEntity(pictureModel).fold(
      (mapperFailure) {
        return Left(mapperFailure);
      },
      (pictureEntity) async {
        return await PictureMapper.fromEntityToViewModel(pictureEntity);
      },
    );
  }

  static Either<MapperFailure, Map<String, dynamic>> fromEntityToJson(
      PictureEntity entity) {
    return fromEntityToModel(entity).flatMap(fromModelToJson);
  }

  static Either<MapperFailure, List<Map<String, dynamic>>>
      fromEntityListToJsonList(List<PictureEntity> entityList) {
    try {
      final jsonList = entityList
          .map((entity) => fromEntityToJson(entity)
              .getOrElse(() => throw const MapperFailure.conversionError()))
          .toList();
      return Right(jsonList);
    } catch (_) {
      return const Left(MapperFailure.conversionError());
    }
  }
}
