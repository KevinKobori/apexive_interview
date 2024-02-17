import 'package:nasa_apod_core/nasa_apod_core.dart';

PictureRepository pictureRepositoryFactory() => PictureRepositoryImpl(
      networkInfo: networkInfoFactory(),
      pictureDatasource: pictureDatasourceFactory(),
    );
