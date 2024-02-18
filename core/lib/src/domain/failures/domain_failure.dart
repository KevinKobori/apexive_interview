import 'package:equatable/equatable.dart';

class DomainFailure extends Equatable implements Exception {
  final String message;

  const DomainFailure.unexpected() : message = 'Unexpected error occurred.';
  const DomainFailure.notFound() : message = 'Resource not found.';
  const DomainFailure.invalidData() : message = 'Invalid data provided.';
  const DomainFailure.internalServerError()
      : message = 'Internal server error.';
  const DomainFailure.notHaveInternetConnection()
      : message = 'Not have internet connection.';

  @override
  String toString() => 'DomainFailure: $message';

  @override
  List<Object?> get props => [
        message,
      ];
}
