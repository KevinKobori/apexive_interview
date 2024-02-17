import 'package:flutter/widgets.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

StatefulWidget pictureDetailPageFactory({
  required double aspectRatio,
  required String pictureDate,
  PictureViewModel? picture,
}) =>
    PictureDetailPage(
      aspectRatio: aspectRatio,
      pictureDate: pictureDate,
      picture: picture,
    );
