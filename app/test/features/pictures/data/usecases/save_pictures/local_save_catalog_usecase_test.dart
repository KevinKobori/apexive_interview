import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';
import 'package:test_utils/test_utils.dart';

void main() {
  late LocalSaveCatalogUseCase sut;
  late LocalStorageSpy localStorage;
  late String itemKey;

  setUp(() {
    localStorage = LocalStorageSpy();
    itemKey = 'catalog';
    sut = LocalSaveCatalogUseCaseImpl(
      localStorage: localStorage,
      itemKey: itemKey,
    );
  });

  group('Saving', () {
    test('When save data should call localStorage with correct values',
        () async {
      final data = DeviceLocalStorageFactory().generateValidPictureJsonList();
      final pictureJsonList = data;

      localStorage.mockSaveSuccess();

      await PictureMapper.fromJsonListToEntityList(pictureJsonList).fold(
        (domainFailure) => null,
        (pictureEntityList) async {
          final result = await sut.call(pictureEntityList);

          return result.fold(
            (domainFailure) => null,
            (_) {},
          );
        },
      );

      verify(() => localStorage.save(
          itemKey: 'catalog',
          itemValue: any<dynamic>(named: 'itemValue'))).called(1);
    });

    test('When save data should throw UnexpectedFailure if save throws',
        () async {
      final pictureJsonList =
          DeviceLocalStorageFactory().generateValidPictureJsonList();

      localStorage.mockSaveFailure(const LocalStorageFailure.unknownError());

      late final List<PictureEntity> matcher;

      PictureMapper.fromJsonListToEntityList(pictureJsonList).fold(
        (domainFailure) => null,
        (pictureEntityList) {
          matcher = pictureEntityList;
        },
      );

      final result = await sut.call(matcher);

      final actual = result.fold(
        (domainFailure) => domainFailure,
        (_) {},
      );

      expect(
          actual,
          predicate((element) =>
              element is DomainFailure &&
              element == DomainFailure.unexpected &&
              element == const DomainFailure.unexpected()));
    });
  });
}
