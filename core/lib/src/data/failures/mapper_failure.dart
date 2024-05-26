import 'package:equatable/equatable.dart';

class MapperFailure extends Equatable implements Exception {
  final String reasonPhrase;

  const MapperFailure._(
    this.reasonPhrase,
  );

  const MapperFailure.unknownError() : this._('Unknown Error');
  const MapperFailure.invalidJsonFormat() : this._('Invalid Json Format');
  const MapperFailure.conversionError() : this._('Conversion Error');

  @override
  String toString() => '''
    const MapperFailure(
      reasonPhrase: $reasonPhrase,
    );
  ''';

  @override
  List<Object?> get props => [
        reasonPhrase,
      ];
}
