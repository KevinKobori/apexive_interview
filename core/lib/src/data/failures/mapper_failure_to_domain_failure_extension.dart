import 'package:nasa_apod_core/nasa_apod_core.dart';

extension MapperFailureToDomainFailureExtension on MapperFailure {
  DomainFailure get toDomain {
    switch (this) {
      case MapperFailure.invalidJsonFormat:
        return const DomainFailure.unexpected();
      case MapperFailure.conversionError:
        return const DomainFailure.unexpected();
      case MapperFailure.unknownError:
        return const DomainFailure.unexpected();
      default:
        return const DomainFailure.unexpected();
    }
  }
}
