import 'package:http/http.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

HttpClientAdapter httpClientAdapterFactory() => HttpClientAdapter(Client());
