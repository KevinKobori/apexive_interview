import 'package:equatable/equatable.dart';

class HttpFailure extends Equatable implements Exception {
  final String message;
  final int statusCode;

  const HttpFailure._(
    this.message,
    this.statusCode,
  );

  const HttpFailure.unknownError() : this._('Unknown Error', -1);
  const HttpFailure.invalidData() : this._('Invalid Data', -2);

  /// 1xx Informative
  const HttpFailure.continueProccess() : this._('Continue', 100);
  const HttpFailure.switchingProtocols() : this._('Switching Protocols', 101);
  const HttpFailure.processing() : this._('Processing', 102);

  /// 2xx Success
  const HttpFailure.ok() : this._('OK', 200);
  const HttpFailure.created() : this._('Created', 201);
  const HttpFailure.accepted() : this._('Accepted', 202);
  const HttpFailure.nonAuthoritativeInformation()
      : this._('Non-authoritative Information', 203);
  const HttpFailure.noContent() : this._('No Content', 204);
  const HttpFailure.resetContent() : this._('Reset Content', 205);
  const HttpFailure.partialContent() : this._('Partial Content', 206);
  const HttpFailure.multiStatus() : this._('Multi-Status', 207);
  const HttpFailure.alreadyReported() : this._('Already Reported', 208);
  const HttpFailure.iMUsed() : this._('IM Used', 226);

  /// 3xx Redirecting
  const HttpFailure.multipleChoices() : this._('Multiple Choices', 300);
  const HttpFailure.movedPermanently() : this._('Moved Permanently', 301);
  const HttpFailure.found() : this._('Found', 302);
  const HttpFailure.seeOther() : this._('See Other', 303);
  const HttpFailure.notModified() : this._('Not Modified', 304);
  const HttpFailure.useProxy() : this._('Use Proxy', 305);
  const HttpFailure.temporaryRedirect() : this._('Temporary Redirect', 307);
  const HttpFailure.permanentRedirect() : this._('Permanent Redirect', 308);

  /// 4xx Client Error
  const HttpFailure.badRequest() : this._('Bad Request', 400);
  const HttpFailure.unauthorized() : this._('Unauthorized', 401);
  const HttpFailure.paymentRequired() : this._('Payment Required', 402);
  const HttpFailure.forbidden() : this._('Forbidden', 403);
  const HttpFailure.notFound() : this._('Not Found', 404);
  const HttpFailure.methodNotAllowed() : this._('Method Not Allowed', 405);
  const HttpFailure.notAcceptable() : this._('Not Acceptable', 406);
  const HttpFailure.proxyAuthenticationRequired()
      : this._('Proxy Authentication Required', 407);
  const HttpFailure.requestTimeout() : this._('Request Timeout', 408);
  const HttpFailure.conflict() : this._('Conflict', 409);
  const HttpFailure.gone() : this._('Gone', 410);
  const HttpFailure.lengthRequired() : this._('Length Required', 411);
  const HttpFailure.preconditionFailed() : this._('Precondition Failed', 412);
  const HttpFailure.payloadTooLarge() : this._('Payload Too Large', 413);
  const HttpFailure.requestURITooLong() : this._('Request-URI Too Long', 414);
  const HttpFailure.unsupportedMediaType()
      : this._('Unsupported Media Type', 415);
  const HttpFailure.requestedRangeNotSatisfiable()
      : this._('Requested Range Not Satisfiable', 416);
  const HttpFailure.expectationFailed() : this._('Expectation Failed', 417);
  const HttpFailure.iamATeapot() : this._('I\'m a teapot', 418);
  const HttpFailure.misdirectedRequest() : this._('Misdirected Request', 421);
  const HttpFailure.unprocessableEntity() : this._('Unprocessable Entity', 422);
  const HttpFailure.locked() : this._('Locked', 423);
  const HttpFailure.failedDependency() : this._('Failed Dependency', 424);
  const HttpFailure.upgradeRequired() : this._('Upgrade Required', 426);
  const HttpFailure.preconditionRequired()
      : this._('Precondition Required', 428);
  const HttpFailure.tooManyRequests() : this._('Too Many Requests', 429);
  const HttpFailure.requestHeaderFieldsTooLarge()
      : this._('Request Header Fields Too Large', 431);
  const HttpFailure.connectionClosedWithoutResponse()
      : this._('Connection Closed Without Response', 444);
  const HttpFailure.unavailableForLegalReasons()
      : this._('Unavailable For Legal Reasons', 451);
  const HttpFailure.clientClosedRequest()
      : this._('Client Closed Request', 499);

  /// 5xx Server Error
  const HttpFailure.internalServerError()
      : this._('Internal Server Error', 500);
  const HttpFailure.notImplemented() : this._('Not Implemented', 501);
  const HttpFailure.badGateway() : this._('Bad Gateway', 502);
  const HttpFailure.serviceUnavailable() : this._('Service Unavailable', 503);
  const HttpFailure.gatewayTimeout() : this._('Gateway Timeout', 504);
  const HttpFailure.hTTPVersionNotSupported()
      : this._('HTTP Version Not Supported', 505);
  const HttpFailure.variantAlsoNegociates()
      : this._('Variant Also Negociates', 506);
  const HttpFailure.insufficientStorage() : this._('Insufficient Storage', 507);
  const HttpFailure.loopDetected() : this._('Loop Detected', 508);
  const HttpFailure.notExtended() : this._('Not Extended', 510);
  const HttpFailure.networkAuthenticationRequired()
      : this._('Network Authentication Required', 511);
  const HttpFailure.networkConnectionTimeoutError()
      : this._('Network Connection Timeout Error', 599);

  factory HttpFailure.fromStatusCode(int statusCode, [String? message]) {
    switch (statusCode) {
      case -1:
        return const HttpFailure._('Unknown Error', -1);
      case -2:
        return const HttpFailure._('Invalid Data', -2);
      case 100:
        return const HttpFailure._('Continue', 100);
      case 101:
        return const HttpFailure._('Switching Protocols', 101);
      case 102:
        return const HttpFailure._('Processing', 102);
      case 200:
        return const HttpFailure._('OK', 200);
      case 201:
        return const HttpFailure._('Created', 201);
      case 202:
        return const HttpFailure._('Accepted', 202);
      case 203:
        return const HttpFailure._('Non-authoritative Information', 203);
      case 204:
        return const HttpFailure._('No Content', 204);
      case 205:
        return const HttpFailure._('Reset Content', 205);
      case 206:
        return const HttpFailure._('Partial Content', 206);
      case 207:
        return const HttpFailure._('Multi-Status', 207);
      case 208:
        return const HttpFailure._('Already Reported', 208);
      case 226:
        return const HttpFailure._('IM Used', 226);
      case 300:
        return const HttpFailure._('Multiple Choices', 300);
      case 301:
        return const HttpFailure._('Moved Permanently', 301);
      case 302:
        return const HttpFailure._('Found', 302);
      case 303:
        return const HttpFailure._('See Other', 303);
      case 304:
        return const HttpFailure._('Not Modified', 304);
      case 305:
        return const HttpFailure._('Use Proxy', 305);
      case 307:
        return const HttpFailure._('Temporary Redirect', 307);
      case 308:
        return const HttpFailure._('Permanent Redirect', 308);
      case 400:
        return const HttpFailure._('Bad Request', 400);
      case 401:
        return const HttpFailure._('Unauthorized', 401);
      case 402:
        return const HttpFailure._('Payment Required', 402);
      case 403:
        return const HttpFailure._('Forbidden', 403);
      case 404:
        return const HttpFailure._('Not Found', 404);
      case 405:
        return const HttpFailure._('Method Not Allowed', 405);
      case 406:
        return const HttpFailure._('Not Acceptable', 406);
      case 407:
        return const HttpFailure._('Proxy Authentication Required', 407);
      case 408:
        return const HttpFailure._('Request Timeout', 408);
      case 409:
        return const HttpFailure._('Conflict', 409);
      case 410:
        return const HttpFailure._('Gone', 410);
      case 411:
        return const HttpFailure._('Length Required', 411);
      case 412:
        return const HttpFailure._('Precondition Failed', 412);
      case 413:
        return const HttpFailure._('Payload Too Large', 413);
      case 414:
        return const HttpFailure._('Request-URI Too Long', 414);
      case 415:
        return const HttpFailure._('Unsupported Media Type', 415);
      case 416:
        return const HttpFailure._('Requested Range Not Satisfiable', 416);
      case 417:
        return const HttpFailure._('Expectation Failed', 417);
      case 418:
        return const HttpFailure._('I\'m a teapot', 418);
      case 421:
        return const HttpFailure._('Misdirected Request', 421);
      case 422:
        return const HttpFailure._('Unprocessable Entity', 422);
      case 423:
        return const HttpFailure._('Locked', 423);
      case 424:
        return const HttpFailure._('Failed Dependency', 424);
      case 426:
        return const HttpFailure._('Upgrade Required', 426);
      case 428:
        return const HttpFailure._('Precondition Required', 428);
      case 429:
        return const HttpFailure._('Too Many Requests', 429);
      case 431:
        return const HttpFailure._('Request Header Fields Too Large', 431);
      case 444:
        return const HttpFailure._('Connection Closed Without Response', 444);
      case 451:
        return const HttpFailure._('Unavailable For Legal Reasons', 451);
      case 499:
        return const HttpFailure._('Client Closed Request', 499);
      case 500:
        return const HttpFailure._('Internal Server Error', 500);
      case 501:
        return const HttpFailure._('Not Implemented', 501);
      case 502:
        return const HttpFailure._('Bad Gateway', 502);
      case 503:
        return const HttpFailure._('Service Unavailable', 503);
      case 504:
        return const HttpFailure._('Gateway Timeout', 504);
      case 505:
        return const HttpFailure._('HTTP Version Not Supported', 505);
      case 506:
        return const HttpFailure._('Variant Also Negotiates', 506);
      case 507:
        return const HttpFailure._('Insufficient Storage', 507);
      case 508:
        return const HttpFailure._('Loop Detected', 508);
      case 510:
        return const HttpFailure._('Not Extended', 510);
      case 511:
        return const HttpFailure._('Network Authentication Required', 511);
      case 599:
        return const HttpFailure._('Network Connection Timeout Error', 599);
      default:
        return HttpFailure._(
            message ?? 'Unknown HTTP status code: $statusCode', statusCode);
    }
  }

  @override
  String toString() => 'HttpFailure: $message (Status Code: $statusCode)';

  @override
  List<Object?> get props => [
        message,
        statusCode,
      ];
}
