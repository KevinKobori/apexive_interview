import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

class JsonMapper {
  static Either<MapperFailure, void> dataIsValidMap(dynamic data) {
    if (data is Map<String, dynamic>) {
      /// Right
      return const Right(null);
    } else {
      /// Left
      return const Left(MapperFailure.invalidJsonFormat());
    }
  }

  static Either<MapperFailure, void> dataIsValidMapList(dynamic data) {
    if (data is List<Map<String, dynamic>> || (data is List && data.isEmpty)) {
      /// Right
      return const Right(null);
    } else {
      /// Left
      return const Left(MapperFailure.invalidJsonFormat());
    }
  }

  static Either<MapperFailure, String> tryEncode(Map<String, dynamic> data) {
    try {
      /// Right
      return Right(json.encode(data));
    } catch (_) {
      /// Left
      return const Left(MapperFailure.invalidJsonFormat());
    }
  }

  static Either<MapperFailure, dynamic> tryDecode(String data) {
    try {
      /// Right
      return Right(json.decode(data));
    } catch (_) {
      /// Left
      return const Left(MapperFailure.invalidJsonFormat());
    }
  }

  static Either<MapperFailure, List<Map<String, dynamic>>>
      fromDynamicListToJsonList(dynamic pictureJsonList) {
    try {
      final list = List<Map<String, dynamic>>.from(
        (pictureJsonList as List<dynamic>).map(
          (dynamic pictureJson) => pictureJson as Map<String, dynamic>,
        ),
      ).toList();

      /// Right
      return Right(list);
    } catch (_) {
      /// Left
      return const Left(MapperFailure.invalidJsonFormat());
    }
  }
}
