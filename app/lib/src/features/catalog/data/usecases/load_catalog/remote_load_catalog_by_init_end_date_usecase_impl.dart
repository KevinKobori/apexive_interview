import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class RemoteLoadCatalogByStartEndDateUseCaseImpl
    implements RemoteLoadCatalogByStartDateEndDateUseCase {
  final PictureRepository pictureRepository;

  RemoteLoadCatalogByStartEndDateUseCaseImpl({
    required this.pictureRepository,
  });

  @override
  Future<Either<DomainFailure, List<PictureEntity>>> call(
      LoadCatalogParams params) async {
    final apodStartDate = getApodDateFormat(params.startDate);
    final apodEndDate = getApodDateFormat(params.endDate);

    final repositoryResult = await pictureRepository.getCatalogByStartEndDate(
      apodApiUrlFactory(
        baseURL: ApodDotEnv.instance.baseURL,
        apiKey: ApodDotEnv.instance.apiKey,
        requestPath: '&start_date=$apodStartDate&end_date=$apodEndDate',
      ),
    );

    return repositoryResult;
  }

  static String getApodDateFormat(DateTime localDateTime) {
    tz.initializeTimeZones();
    final tz.Location apodLocation = tz.getLocation('America/New_York');
    final tz.TZDateTime apodDateTime =
        tz.TZDateTime.from(localDateTime, apodLocation);

    final dateRequestAPIFormat = DateTime(apodDateTime.year, apodDateTime.month,
        apodDateTime.day, apodDateTime.hour);
    final String year = dateRequestAPIFormat.year.toString();
    final String month = dateRequestAPIFormat.month.toString().padLeft(2, '0');
    final String day = dateRequestAPIFormat.day.toString().padLeft(2, '0');
    return '$year-$month-$day';
  }
}
