import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';
import 'package:timezone/data/latest.dart' as tz1;
import 'package:timezone/timezone.dart' as tz2;

class RemoteLoadCatalogByStartEndDateUseCaseImpl
    implements RemoteLoadCatalogByStartEndDateUseCase {
  final PictureRepository pictureRepository;
  final String apiKey;

  RemoteLoadCatalogByStartEndDateUseCaseImpl({
    required this.pictureRepository,
    required this.apiKey,
  });

  @override
  Future<Either<DomainFailure, List<PictureEntity>>> call(
      LoadCatalogParams params) async {
    final apodStartDate = getApodDateFormat(params.startDate);
    final apodEndDate = getApodDateFormat(params.endDate);

    final repositoryResult = await pictureRepository.getCatalogByStartEndDate(
      apodApiUrlFactory(
        apiKey: apiKey,
        requestPath: '&start_date=$apodStartDate&end_date=$apodEndDate',
      ),
    );

    return repositoryResult;
  }

  static String getApodDateFormat(DateTime localDateTime) {
    tz1.initializeTimeZones();
    final tz2.Location apodLocation = tz2.getLocation('America/New_York');
    final tz2.TZDateTime apodDateTime =
        tz2.TZDateTime.from(localDateTime, apodLocation);

    final dateRequestAPIFormat = DateTime(apodDateTime.year, apodDateTime.month,
        apodDateTime.day, apodDateTime.hour);
    final String year = dateRequestAPIFormat.year.toString();
    final String month = dateRequestAPIFormat.month.toString().padLeft(2, '0');
    final String day = dateRequestAPIFormat.day.toString().padLeft(2, '0');
    return '$year-$month-$day';
  }
}
