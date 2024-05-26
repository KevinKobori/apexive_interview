import 'package:equatable/equatable.dart';

class DomainFailure extends Equatable implements Exception {
  final String reasonPhrase;
  final String? apiMessage;

  const DomainFailure._(
    this.reasonPhrase,
    this.apiMessage,
  );

  // TODO(all): Create i18n or l10n for reasonPhrase and think the best solution for apiMessage
  const DomainFailure.unexpected([String? apiMessage])
      : this._('Unexpected error occurred.', apiMessage);
  const DomainFailure.resourceNotFound([String? apiMessage])
      : this._('Resource Not found.', apiMessage);
  const DomainFailure.dataNotFound([String? apiMessage])
      : this._('Data not found.', apiMessage);
  const DomainFailure.invalidData([String? apiMessage])
      : this._('Invalid data provided.', apiMessage);
  const DomainFailure.internalServerError([String? apiMessage])
      : this._('Internal server error.', apiMessage);
  const DomainFailure.notHaveInternetConnection([String? apiMessage])
      : this._('Not have internet connection.', apiMessage);

  @override
  String toString() => '''
    const DomainFailure(
      reasonPhrase: $reasonPhrase,
      apiMessage: $apiMessage,
    );
  ''';

  @override
  List<Object?> get props => [
        reasonPhrase,
        apiMessage,
      ];
}
