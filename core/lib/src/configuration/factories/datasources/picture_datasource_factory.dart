import 'package:nasa_apod_core/nasa_apod_core.dart';

PictureDatasource pictureDatasourceFactory() =>
    PictureDatasourceImpl(httpClientAdapterFactory());
