import 'package:dartz/dartz.dart';
import 'package:localstorage/localstorage.dart' as ls;
import 'package:nasa_apod_core/nasa_apod_core.dart';

class LocalStorageAdapter implements LocalStorage {
  final ls.LocalStorage localStorage;

  LocalStorageAdapter({required this.localStorage});

  @override
  Future<Either<LocalStorageFailure, void>> save(
      {required String itemKey, required dynamic itemValue}) async {
    try {
      await localStorage.deleteItem(itemKey);
      await localStorage.setItem(itemKey, itemValue);

      /// Right
      return const Right(null);
    } catch (_) {
      /// Left
      return const Left(LocalStorageFailure.unknownError());
    }
  }

  @override
  Future<Either<LocalStorageFailure, void>> delete(String itemKey) async {
    try {
      await localStorage.deleteItem(itemKey);

      /// Right
      return const Right(null);
    } catch (_) {
      /// Left
      return const Left(LocalStorageFailure.unknownError());
    }
  }

  @override
  Future<Either<LocalStorageFailure, dynamic>> fetch(String itemKey) async {
    try {
      final data = await localStorage.getItem(itemKey);
      if (data == null) {
        /// Left
        return const Left(LocalStorageFailure.dataNotFound());
      } else {
        /// Right
        return Right(data);
      }
    } catch (_) {
      /// Left
      return const Left(LocalStorageFailure.unknownError());
    }
  }
}
