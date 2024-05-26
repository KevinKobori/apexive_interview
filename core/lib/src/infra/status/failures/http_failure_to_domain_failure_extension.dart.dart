import 'package:nasa_apod_core/nasa_apod_core.dart';

extension HttpFailureToDomainFailureExtension on HttpFailure {
  DomainFailure toDomain() {
    switch (this) {
      case HttpFailure.badRequest:
        return DomainFailure.unexpected(apiMessage);
      case HttpFailure.forbidden:
        return DomainFailure.unexpected(apiMessage);
      case HttpFailure.unprocessableEntity:
        return DomainFailure.invalidData(apiMessage);
      case HttpFailure.notFound:
        return DomainFailure.resourceNotFound(apiMessage);
      case HttpFailure.internalServerError:
        return DomainFailure.internalServerError(apiMessage);
      case HttpFailure.unauthorized:
        return DomainFailure.unexpected(apiMessage);
      default:
        return DomainFailure.unexpected(apiMessage);
    }
  }
}
