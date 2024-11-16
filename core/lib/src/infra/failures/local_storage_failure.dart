import 'package:equatable/equatable.dart';

class LocalStorageFailure extends Equatable implements Exception {
  final String message;

  const LocalStorageFailure.unknownError() : message = 'Unknown Error';
  const LocalStorageFailure.dataNotFound() : message = 'Data Not Found';

  @override
  String toString() => 'LocalStorageFailure: $message';

  @override
  List<Object?> get props => [
        message,
      ];
}
