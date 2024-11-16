import 'package:dartz/dartz.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

enum HttpMethod {
  get,
  post,
  put,
  delete,
}

mixin HttpClient {
  Future<Either<HttpFailure, dynamic>> request({
    required String url,
    required HttpMethod method,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? body,
  });
}
