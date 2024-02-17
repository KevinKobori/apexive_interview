import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

// TODO: NOW - CHANGE TI TO RECEIVE START AND END DATES
class RemoteLoadLastTenDaysPicturesByDateUseCaseImpl
    implements RemoteLoadLastTenDaysPicturesByDateUseCase {
  final PictureRepository picturesRepository;
  final String apiKey;

  RemoteLoadLastTenDaysPicturesByDateUseCaseImpl({
    required this.picturesRepository,
    required this.apiKey,
  });

  @override
  Future<Either<DomainFailure, List<PictureEntity>>> call(DateTime date) async {
    final apodEndDate = getApodEndDate(date);
    final apodStartDate = getApodStartDate(date);

    final result = await picturesRepository.getLastTenDaysData(
      apodApiUrlFactory(
        apiKey: apiKey,
        requestPath: '&start_date=$apodStartDate&end_date=$apodEndDate',
      ),
    );
    return result;
  }

  static String getApodEndDate(DateTime localDateTime) {
    return getApodDateFormat(localDateTime);
  }

  static String getApodStartDate(DateTime localDateTime) {
    final lastTenDaysUS = DateTime(localDateTime.year, localDateTime.month,
        localDateTime.day - 9, localDateTime.hour);
    return getApodDateFormat(lastTenDaysUS);
  }

  static String getApodDateFormat(DateTime localDateTime) {
    tz.initializeTimeZones();
    tz.Location apodLocation = tz.getLocation('America/New_York');
    tz.TZDateTime apodDateTime =
        tz.TZDateTime.from(localDateTime, apodLocation);

    final dateRequestAPIFormat = DateTime(apodDateTime.year, apodDateTime.month,
        apodDateTime.day, apodDateTime.hour);
    final String year = dateRequestAPIFormat.year.toString();
    final String month = dateRequestAPIFormat.month.toString().padLeft(2, '0');
    final String day = dateRequestAPIFormat.day.toString().padLeft(2, '0');
    return '$year-$month-$day';
  }
}
