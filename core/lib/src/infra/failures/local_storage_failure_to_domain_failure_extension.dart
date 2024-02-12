import 'package:nasa_apod_core/nasa_apod_core.dart';

extension LocalStorageFailureToDomainFailureExtension on LocalStorageFailure {
  DomainFailure get fromLocalStorageToDomain {
    switch (this) {
      case LocalStorageFailure.unknownError:
        return DomainFailure.unexpected;
    }
  }
}
