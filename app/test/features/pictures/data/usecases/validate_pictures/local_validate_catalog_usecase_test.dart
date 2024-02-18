import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';
import 'package:test_utils/test_utils.dart';

void main() {
  late LocalValidateCatalogUseCase sut;
  late LocalStorageSpy localStorage;
  late String itemKey;

  setUp(() {
    localStorage = LocalStorageSpy();
    itemKey = 'catalog';
    sut = LocalValidateCatalogUseCaseImpl(
      localStorage: localStorage,
      itemKey: itemKey,
    );
  });

  group('Validating', () {
    test('When validate data should call localStorage with correct key',
        () async {
      localStorage.mockFetchSuccess(
          DeviceLocalStorageFactory().generateInvalidPictureJsonList());

      await sut.call(null);

      verify(() => localStorage.fetch('catalog')).called(1);
    });

    test('When validate data should delete localStorage if it is invalid',
        () async {
      localStorage.mockFetchSuccess(
          DeviceLocalStorageFactory().generateInvalidPictureJsonList());

      final result = await sut.call(null);

      result.fold((domainFailure) => domainFailure, (_) => _);

      verify(() => localStorage.delete('catalog')).called(1);
    });

    test('When validate data should delete localStorage if it is incomplete',
        () async {
      localStorage.mockFetchSuccess(
          DeviceLocalStorageFactory().generateIncompletePictureJsonList());

      await sut.call(null);

      verify(() => localStorage.delete('catalog')).called(1);
    });

    test('When validate data should delete localStorage if fetch fails',
        () async {
      localStorage.mockFetchFailure(LocalStorageFailure.unknownError);

      final result = await sut.call(null);

      result.fold((l) => l, (r) => r);

      verify(() => localStorage.delete('catalog')).called(1);
    });
  });
}
