import 'package:equatable/equatable.dart';

class LocalStorageFailure extends Equatable implements Exception {
  final String reasonPhrase;

  const LocalStorageFailure._(
    this.reasonPhrase,
  );

  const LocalStorageFailure.unknownError() : this._('Unknown Error');
  const LocalStorageFailure.dataNotFound() : this._('Data Not Found');

  @override
  String toString() => '''
    const LocalStorageFailure(
      reasonPhrase: $reasonPhrase,
    );
  ''';

  @override
  List<Object?> get props => [
        reasonPhrase,
      ];
}
