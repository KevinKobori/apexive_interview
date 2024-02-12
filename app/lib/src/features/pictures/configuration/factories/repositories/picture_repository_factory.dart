import 'package:nasa_apod_core/nasa_apod_core.dart';

PictureRepositoryImpl pictureRepositoryFactory() => PictureRepositoryImpl(
      networkInfo: networkInfoFactory(),
      pictureDatasource: pictureDatasourceFactory(),
    );
