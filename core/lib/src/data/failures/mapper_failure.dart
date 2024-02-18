import 'package:equatable/equatable.dart';

class MapperFailure extends Equatable implements Exception {
  final String message;

  const MapperFailure.invalidJsonFormat() : message = 'Invalid Json Format';
  const MapperFailure.conversionError() : message = 'Conversion Error';
  const MapperFailure.unknownError() : message = 'Unknown Error';

  @override
  String toString() => 'MapperFailure: $message';

  @override
  List<Object?> get props => [message];
}
