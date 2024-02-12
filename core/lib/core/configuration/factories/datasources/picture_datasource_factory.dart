import 'package:nasa_apod_core/nasa_apod_core.dart';

PictureDatasourceImpl pictureDatasourceFactory() =>
    PictureDatasourceImpl(httpClientAdapterFactory());
