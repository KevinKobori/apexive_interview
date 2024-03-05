import 'package:nasa_apod_core/nasa_apod_core.dart';

extension DomainFailureToUIFailureExtension on DomainFailure {
  String get toUI {
    switch (this) {
      case DomainFailure.notHaveInternetConnection:
        return I18n.strings.notHaveInternetConnectionFailure;
      case DomainFailure.internalServerError:
        return I18n.strings.internalServerErrorFailure;
      case DomainFailure.invalidData:
        return I18n.strings.invalidDataFailure;
      case DomainFailure.resourceNotFound:
        return I18n.strings.resourceNotFoundFailure;
      case DomainFailure.dataNotFound:
        return I18n.strings.dataNotFoundFailure;

      case DomainFailure.unexpected:
        return I18n.strings.unexpectedFailure;
      default:
        return I18n.strings.unexpectedFailure;
    }
  }
}
