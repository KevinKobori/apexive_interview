import 'package:nasa_apod_core/nasa_apod_core.dart';

import '../../../../../../apod.dart';

class ApodResponsesFactory with PictureFactory {
  HttpFailure generateNotFoundFailure() => HttpFailure.notFound;
}
