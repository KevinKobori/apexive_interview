import 'package:equatable/equatable.dart';
import 'package:http/http.dart';

class HttpSuccess extends Equatable implements Exception {
  final String reasonPhrase;
  final int statusCode;
  final dynamic body;

  const HttpSuccess._(
    this.reasonPhrase,
    this.statusCode,
    this.body,
  );

  /// 1xx Informative
  const HttpSuccess.continueProccess(dynamic body)
      : this._('Continue', 100, body);
  const HttpSuccess.switchingProtocols(dynamic body)
      : this._('Switching Protocols', 101, body);
  const HttpSuccess.processing(dynamic body) : this._('Processing', 102, body);

  /// 2xx Success
  const HttpSuccess.ok(dynamic body) : this._('OK', 200, body);
  const HttpSuccess.created(dynamic body) : this._('Created', 201, body);
  const HttpSuccess.accepted(dynamic body) : this._('Accepted', 202, body);
  const HttpSuccess.nonAuthoritativeInformation(dynamic body)
      : this._('Non-authoritative Information', 203, body);
  const HttpSuccess.noContent(dynamic body) : this._('No Content', 204, body);
  const HttpSuccess.resetContent(dynamic body)
      : this._('Reset Content', 205, body);
  const HttpSuccess.partialContent(dynamic body)
      : this._('Partial Content', 206, body);
  const HttpSuccess.multiStatus(dynamic body)
      : this._('Multi-Status', 207, body);
  const HttpSuccess.alreadyReported(dynamic body)
      : this._('Already Reported', 208, body);
  const HttpSuccess.iMUsed(dynamic body) : this._('IM Used', 226, body);

  /// 3xx Redirecting
  const HttpSuccess.multipleChoices(dynamic body)
      : this._('Multiple Choices', 300, body);
  const HttpSuccess.movedPermanently(dynamic body)
      : this._('Moved Permanently', 301, body);
  const HttpSuccess.found(dynamic body) : this._('Found', 302, body);
  const HttpSuccess.seeOther(dynamic body) : this._('See Other', 303, body);
  const HttpSuccess.notModified(dynamic body)
      : this._('Not Modified', 304, body);
  const HttpSuccess.useProxy(dynamic body) : this._('Use Proxy', 305, body);
  const HttpSuccess.temporaryRedirect(dynamic body)
      : this._('Temporary Redirect', 307, body);
  const HttpSuccess.permanentRedirect(dynamic body)
      : this._('Permanent Redirect', 308, body);

  factory HttpSuccess.fromResponse(Response response) {
    final reasonPhrase = response.reasonPhrase;
    final statusCode = response.statusCode;
    final body = response.body;

    if (reasonPhrase != null) {
      return HttpSuccess._(reasonPhrase, statusCode, body);
    } else {
      switch (statusCode) {
        case 100:
          return HttpSuccess.continueProccess(body);
        case 101:
          return HttpSuccess.switchingProtocols(body);
        case 102:
          return HttpSuccess.processing(body);
        case 200:
          return HttpSuccess.ok(body);
        case 201:
          return HttpSuccess.created(body);
        case 202:
          return HttpSuccess.accepted(body);
        case 203:
          return HttpSuccess.nonAuthoritativeInformation(body);
        case 204:
          return HttpSuccess.noContent(body);
        case 205:
          return HttpSuccess.resetContent(body);
        case 206:
          return HttpSuccess.partialContent(body);
        case 207:
          return HttpSuccess.multiStatus(body);
        case 208:
          return HttpSuccess.alreadyReported(body);
        case 226:
          return HttpSuccess.iMUsed(body);
        case 300:
          return HttpSuccess.multipleChoices(body);
        case 301:
          return HttpSuccess.movedPermanently(body);
        case 302:
          return HttpSuccess.found(body);
        case 303:
          return HttpSuccess.seeOther(body);
        case 304:
          return HttpSuccess.notModified(body);
        case 305:
          return HttpSuccess.useProxy(body);
        case 307:
          return HttpSuccess.temporaryRedirect(body);
        case 308:
          return HttpSuccess.permanentRedirect(body);
        default:
          return HttpSuccess._(
              'Unknown HTTP status code: $statusCode', statusCode, body);
      }
    }
  }

  @override
  String toString() => '''
    const HttpSuccess(
      reasonPhrase: $reasonPhrase,
      statusCode: $statusCode,
      body: $body,
    );
  ''';

  @override
  List<Object?> get props => [
        reasonPhrase,
        statusCode,
      ];
}
