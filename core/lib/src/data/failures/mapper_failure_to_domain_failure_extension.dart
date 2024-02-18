import 'package:nasa_apod_core/nasa_apod_core.dart';

extension MapperFailureToDomainFailureExtension on MapperFailure {
  DomainFailure get toDomain {
    switch (this) {
      case MapperFailure.invalidJsonFormat:
        return DomainFailure.unexpected;
      case MapperFailure.conversionError:
        return DomainFailure.unexpected;
      case MapperFailure.unknownError:
        return DomainFailure.unexpected;
    }
  }
}
