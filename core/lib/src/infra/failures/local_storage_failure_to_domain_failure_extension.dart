import 'package:nasa_apod_core/nasa_apod_core.dart';

extension LocalStorageFailureToDomainFailureExtension on LocalStorageFailure {
  DomainFailure get toDomain {
    switch (this) {
      case LocalStorageFailure.unknownError:
        return const DomainFailure.unexpected();
      case LocalStorageFailure.dataNotFound:
        return const DomainFailure.dataNotFound();
      default:
        return const DomainFailure.unexpected();
    }
  }
}
