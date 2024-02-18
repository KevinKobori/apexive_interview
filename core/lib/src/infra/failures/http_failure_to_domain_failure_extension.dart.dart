import 'package:nasa_apod_core/nasa_apod_core.dart';

extension HttpFailureToDomainFailureExtension on HttpFailure {
  DomainFailure get toDomain {
    switch (this) {
      case HttpFailure.badRequest:
        return const DomainFailure.unexpected();
      case HttpFailure.forbidden:
        return const DomainFailure.unexpected();
      case HttpFailure.invalidData:
        return const DomainFailure.invalidData();
      case HttpFailure.notFound:
        return const DomainFailure.notFound();
      case HttpFailure.internalServerError:
        return const DomainFailure.internalServerError();
      case HttpFailure.unauthorized:
        return const DomainFailure.unexpected();
      default:
        return const DomainFailure.unexpected();
    }
  }
}
