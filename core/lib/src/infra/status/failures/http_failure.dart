import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:http/http.dart';

// TODO(all): add apiMessage to be returned in all failures layers
class HttpFailure extends Equatable implements Exception {
  final String reasonPhrase;
  final int statusCode;
  final String? apiMessage;

  const HttpFailure._(
    this.reasonPhrase,
    this.statusCode,
    this.apiMessage,
  );

  const HttpFailure.unknownError([String? apiMessage])
      : this._('Unknown Error', -1, apiMessage);

  /// 4xx Client Error
  const HttpFailure.badRequest([String? apiMessage])
      : this._('Bad Request', 400, apiMessage);
  const HttpFailure.unauthorized([String? apiMessage])
      : this._('Unauthorized', 401, apiMessage);
  const HttpFailure.paymentRequired([String? apiMessage])
      : this._('Payment Required', 402, apiMessage);
  const HttpFailure.forbidden([String? apiMessage])
      : this._('Forbidden', 403, apiMessage);
  const HttpFailure.notFound([String? apiMessage])
      : this._('Not Found', 404, apiMessage);
  const HttpFailure.methodNotAllowed([String? apiMessage])
      : this._('Method Not Allowed', 405, apiMessage);
  const HttpFailure.notAcceptable([String? apiMessage])
      : this._('Not Acceptable', 406, apiMessage);
  const HttpFailure.proxyAuthenticationRequired([String? apiMessage])
      : this._('Proxy Authentication Required', 407, apiMessage);
  const HttpFailure.requestTimeout([String? apiMessage])
      : this._('Request Timeout', 408, apiMessage);
  const HttpFailure.conflict([String? apiMessage])
      : this._('Conflict', 409, apiMessage);
  const HttpFailure.gone([String? apiMessage])
      : this._('Gone', 410, apiMessage);
  const HttpFailure.lengthRequired([String? apiMessage])
      : this._('Length Required', 411, apiMessage);
  const HttpFailure.preconditionFailed([String? apiMessage])
      : this._('Precondition Failed', 412, apiMessage);
  const HttpFailure.payloadTooLarge([String? apiMessage])
      : this._('Payload Too Large', 413, apiMessage);
  const HttpFailure.requestURITooLong([String? apiMessage])
      : this._('Request-URI Too Long', 414, apiMessage);
  const HttpFailure.unsupportedMediaType([String? apiMessage])
      : this._('Unsupported Media Type', 415, apiMessage);
  const HttpFailure.requestedRangeNotSatisfiable([String? apiMessage])
      : this._('Requested Range Not Satisfiable', 416, apiMessage);
  const HttpFailure.expectationFailed([String? apiMessage])
      : this._('Expectation Failed', 417, apiMessage);
  const HttpFailure.iamATeapot([String? apiMessage])
      : this._('I\'m a teapot', 418, apiMessage);
  const HttpFailure.misdirectedRequest([String? apiMessage])
      : this._('Misdirected Request', 421, apiMessage);
  const HttpFailure.unprocessableEntity([String? apiMessage])
      : this._('Unprocessable Entity', 422, apiMessage);
  const HttpFailure.locked([String? apiMessage])
      : this._('Locked', 423, apiMessage);
  const HttpFailure.failedDependency([String? apiMessage])
      : this._('Failed Dependency', 424, apiMessage);
  const HttpFailure.upgradeRequired([String? apiMessage])
      : this._('Upgrade Required', 426, apiMessage);
  const HttpFailure.preconditionRequired([String? apiMessage])
      : this._('Precondition Required', 428, apiMessage);
  const HttpFailure.tooManyRequests([String? apiMessage])
      : this._('Too Many Requests', 429, apiMessage);
  const HttpFailure.requestHeaderFieldsTooLarge([String? apiMessage])
      : this._('Request Header Fields Too Large', 431, apiMessage);
  const HttpFailure.connectionClosedWithoutResponse([String? apiMessage])
      : this._('Connection Closed Without Response', 444, apiMessage);
  const HttpFailure.unavailableForLegalReasons([String? apiMessage])
      : this._('Unavailable For Legal Reasons', 451, apiMessage);
  const HttpFailure.clientClosedRequest([String? apiMessage])
      : this._('Client Closed Request', 499, apiMessage);

  /// 5xx Server Error
  const HttpFailure.internalServerError([String? apiMessage])
      : this._('Internal Server Error', 500, apiMessage);
  const HttpFailure.notImplemented([String? apiMessage])
      : this._('Not Implemented', 501, apiMessage);
  const HttpFailure.badGateway([String? apiMessage])
      : this._('Bad Gateway', 502, apiMessage);
  const HttpFailure.serviceUnavailable([String? apiMessage])
      : this._('Service Unavailable', 503, apiMessage);
  const HttpFailure.gatewayTimeout([String? apiMessage])
      : this._('Gateway Timeout', 504, apiMessage);
  const HttpFailure.hTTPVersionNotSupported([String? apiMessage])
      : this._('HTTP Version Not Supported', 505, apiMessage);
  const HttpFailure.variantAlsoNegociates([String? apiMessage])
      : this._('Variant Also Negociates', 506, apiMessage);
  const HttpFailure.insufficientStorage([String? apiMessage])
      : this._('Insufficient Storage', 507, apiMessage);
  const HttpFailure.loopDetected([String? apiMessage])
      : this._('Loop Detected', 508, apiMessage);
  const HttpFailure.notExtended([String? apiMessage])
      : this._('Not Extended', 510, apiMessage);
  const HttpFailure.networkAuthenticationRequired([String? apiMessage])
      : this._('Network Authentication Required', 511, apiMessage);
  const HttpFailure.networkConnectionTimeoutError([String? apiMessage])
      : this._('Network Connection Timeout Error', 599, apiMessage);

  factory HttpFailure.fromResponse(Response response) {
    final reasonPhrase = response.reasonPhrase;
    final statusCode = response.statusCode;
    final body = json.decode(response.body);
    final apiMessage = body['errorMessage'] as String?;

    if (reasonPhrase != null) {
      return HttpFailure._(reasonPhrase, statusCode, apiMessage);
    } else {
      switch (statusCode) {
        case -1:
          return HttpFailure.unknownError(apiMessage);
        case 400:
          return HttpFailure.badRequest(apiMessage);
        case 401:
          return HttpFailure.unauthorized(apiMessage);
        case 402:
          return HttpFailure.paymentRequired(apiMessage);
        case 403:
          return HttpFailure.forbidden(apiMessage);
        case 404:
          return HttpFailure.notFound(apiMessage);
        case 405:
          return HttpFailure.methodNotAllowed(apiMessage);
        case 406:
          return HttpFailure.notAcceptable(apiMessage);
        case 407:
          return HttpFailure.proxyAuthenticationRequired(apiMessage);
        case 408:
          return HttpFailure.requestTimeout(apiMessage);
        case 409:
          return HttpFailure.conflict(apiMessage);
        case 410:
          return HttpFailure.gone(apiMessage);
        case 411:
          return HttpFailure.lengthRequired(apiMessage);
        case 412:
          return HttpFailure.preconditionFailed(apiMessage);
        case 413:
          return HttpFailure.payloadTooLarge(apiMessage);
        case 414:
          return HttpFailure.requestURITooLong(apiMessage);
        case 415:
          return HttpFailure.unsupportedMediaType(apiMessage);
        case 416:
          return HttpFailure.requestedRangeNotSatisfiable(apiMessage);
        case 417:
          return HttpFailure.expectationFailed(apiMessage);
        case 418:
          return HttpFailure.iamATeapot(apiMessage);
        case 421:
          return HttpFailure.misdirectedRequest(apiMessage);
        case 422:
          return HttpFailure.unprocessableEntity(apiMessage);
        case 423:
          return HttpFailure.locked(apiMessage);
        case 424:
          return HttpFailure.failedDependency(apiMessage);
        case 426:
          return HttpFailure.upgradeRequired(apiMessage);
        case 428:
          return HttpFailure.preconditionRequired(apiMessage);
        case 429:
          return HttpFailure.tooManyRequests(apiMessage);
        case 431:
          return HttpFailure.requestHeaderFieldsTooLarge(apiMessage);
        case 444:
          return HttpFailure.connectionClosedWithoutResponse(apiMessage);
        case 451:
          return HttpFailure.unavailableForLegalReasons(apiMessage);
        case 499:
          return HttpFailure.clientClosedRequest(apiMessage);
        case 500:
          return HttpFailure.internalServerError(apiMessage);
        case 501:
          return HttpFailure.notImplemented(apiMessage);
        case 502:
          return HttpFailure.badGateway(apiMessage);
        case 503:
          return HttpFailure.serviceUnavailable(apiMessage);
        case 504:
          return HttpFailure.gatewayTimeout(apiMessage);
        case 505:
          return HttpFailure.hTTPVersionNotSupported(apiMessage);
        case 506:
          return HttpFailure.variantAlsoNegociates(apiMessage);
        case 507:
          return HttpFailure.insufficientStorage(apiMessage);
        case 508:
          return HttpFailure.loopDetected(apiMessage);
        case 510:
          return HttpFailure.notExtended(apiMessage);
        case 511:
          return HttpFailure.networkAuthenticationRequired(apiMessage);
        case 599:
          return HttpFailure.networkConnectionTimeoutError(apiMessage);
        default:
          return HttpFailure._(
              'Unknown HTTP status code: $statusCode', statusCode, apiMessage);
      }
    }
  }

  @override
  String toString() => '''
    const HttpFailure(
      reasonPhrase: $reasonPhrase,
      statusCode: $statusCode,
      apiMessage: $apiMessage,
    );
  ''';

  @override
  List<Object?> get props => [
        reasonPhrase,
        statusCode,
      ];
}
