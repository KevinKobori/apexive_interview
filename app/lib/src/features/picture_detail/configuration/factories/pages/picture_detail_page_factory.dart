import 'package:nasa_apod_app/nasa_apod_app.dart';

PictureDetailPage pictureDetailPageFactory({
  required double aspectRatio,
  required String pictureDate,
}) =>
    PictureDetailPage(
      aspectRatio: aspectRatio,
      pictureDate: pictureDate,
    );
