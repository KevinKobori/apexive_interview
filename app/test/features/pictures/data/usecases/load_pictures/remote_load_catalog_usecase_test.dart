import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';
import 'package:test_utils/test_utils.dart';

void main() {
  late PictureDatasource pictureDatasource;
  late DeviceInfo networkInfo;
  late PictureRepository pictureRepository;
  late RemoteLoadCatalogByStartEndDateUseCase sut;
  late HttpClientSpy httpClient;
  late String apiKey;
  late String url;
  late LoadCatalogParams params;

  setUp(() {
    params = LoadCatalogParams(
      startDate: DateTime.now().subtract(const Duration(days: 9)),
      endDate: DateTime.now(),
    );

    httpClient = HttpClientSpy();
    pictureDatasource = PictureDatasourceImpl(httpClient);
    networkInfo = DeviceInfoImpl(Connectivity());
    pictureRepository = PictureRepositoryImpl(
      networkInfo: networkInfo,
      pictureDatasource: pictureDatasource,
    );
    apiKey = ApodTest.faker.randomGenerator.string(10);

    final nasaApodEndDate =
        RemoteLoadCatalogByStartEndDateUseCaseImpl.getApodDateFormat(
            params.endDate);
    final nasaApodStartDate =
        RemoteLoadCatalogByStartEndDateUseCaseImpl.getApodDateFormat(
            params.startDate);

    url = apodApiUrlFactory(
      apiKey: apiKey,
      requestPath: '&start_date=$nasaApodStartDate&end_date=$nasaApodEndDate',
    );

    sut = RemoteLoadCatalogByStartEndDateUseCaseImpl(
      pictureRepository: pictureRepository,
      apiKey: apiKey,
    );
    registerFallbackValue<HttpMethod>(HttpMethod.get);
  });

  test('Should call HttpClient with correct values', () async {
    final data = json.encode({});

    httpClient.mockRequestSuccess(data);

    await sut.call(params);

    ApodTest.verify(() => httpClient.request(method: HttpMethod.get, url: url));
  });

  test('Should return catalog on 200 with valid data', () async {
    final data =
        json.encode(ApodResponsesFactory().generateValidPictureJsonList());

    httpClient.mockRequestSuccess(data);

    final dynamicList = json.decode(data);

    final pictureJsonListResult =
        JsonMapper.fromDynamicListToJsonList(dynamicList);

    late final List<Map<String, dynamic>> pictureJsonList;

    pictureJsonListResult.fold(
      (l) {},
      (r) {
        pictureJsonList = r;
      },
    );

    late final List<PictureEntity> matcher;

    PictureMapper.fromJsonListToEntityList(pictureJsonList).fold(
      (domainFailure) => null,
      (pictureEntityList) {
        matcher = pictureEntityList;
      },
    );

    final resultSUT = await sut.call(params);

    late List<PictureEntity> actual;

    resultSUT.fold(
      (domainFailure) => null,
      (pictureEntityList) {
        actual = pictureEntityList;
      },
    );

    expect(actual, matcher);
  });

  test(
      'Should throw UnexpectedFailure if HttpClient returns 200 with invalid data',
      () async {
    httpClient.mockRequestSuccess(
        json.encode(ApodResponsesFactory().generateInvalidPictureJsonList()));

    final result = await sut.call(params);

    final actual = result.fold(
      (domainFailure) => domainFailure,
      (pictureEntityList) => pictureEntityList,
    );

    expect(
        actual,
        predicate((element) =>
            element is DomainFailure && element == DomainFailure.unexpected));
  });

  test('Should throw UnexpectedFailure if HttpClient not returns 200',
      () async {
    httpClient
        .mockRequestFailure(ApodResponsesFactory().generateNotFoundFailure());

    final result = await sut.call(params);

    final actual = result.fold(
      (domainFailure) => domainFailure,
      (pictureEntityList) => pictureEntityList,
    );

    expect(
        actual,
        predicate((element) =>
            element is DomainFailure && element == DomainFailure.notFound));
  });
}
