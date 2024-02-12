import 'package:http/http.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

HttpClient httpClientAdapterFactory() => HttpClientAdapter(Client());
