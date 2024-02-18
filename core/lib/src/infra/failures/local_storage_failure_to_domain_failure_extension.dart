import 'package:nasa_apod_core/nasa_apod_core.dart';

extension LocalStorageFailureToDomainFailureExtension on LocalStorageFailure {
  DomainFailure get toDomain {
    switch (this) {
      case LocalStorageFailure.unknownError:
        return DomainFailure.unexpected;
    }
  }
}
