import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

class HttpClientAdapter implements HttpClient {
  final Client client;

  HttpClientAdapter(this.client);

  @override
  Future<Either<HttpFailure, HttpSuccess>> request(
      {required String url,
      required HttpMethod method,
      Map<String, dynamic>? body,
      Map<String, dynamic>? headers}) async {
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll(
          {'content-type': 'application/json', 'accept': 'application/json'});
    final jsonBody = body != null ? json.encode(body) : null;
    var response = Response('', 500);
    Future<Response>? futureResponse;
    try {
      if (method == HttpMethod.post) {
        futureResponse = client.post(Uri.parse(url),
            headers: defaultHeaders, body: jsonBody);
      } else if (method == HttpMethod.put) {
        futureResponse =
            client.put(Uri.parse(url), headers: defaultHeaders, body: jsonBody);
      } else if (method == HttpMethod.get) {
        futureResponse = client.get(Uri.parse(url), headers: defaultHeaders);
      } else if (method == HttpMethod.delete) {
        futureResponse = client.delete(Uri.parse(url), headers: defaultHeaders);
      }
      if (futureResponse != null) {
        response = await futureResponse.timeout(const Duration(seconds: 30));
      }
      return _handleResponse(response);
    } catch (_) {
      /// Left
      return const Left(HttpFailure.unknownError());
    }
  }

  Either<HttpFailure, HttpSuccess> _handleResponse(Response response) {
    final statusCode = response.statusCode;

    if (statusCode > 0 || statusCode < 400) {
      /// Right
      return Right(HttpSuccess.fromResponse(response));
    } else {
      /// Left
      return Left(HttpFailure.fromResponse(response));
    }
  }
}
