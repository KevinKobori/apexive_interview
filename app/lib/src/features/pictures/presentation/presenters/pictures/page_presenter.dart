import 'package:flutter/widgets.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

abstract class PicturesPagePresenter {
  void loadPictures();
  void loadPictureByDate(
    BuildContext context, {
    required DateTime date,
  });
  void pushToPictureDetails(
    String pictureDate, {
    required PictureViewModel pictureViewModel,
  });
}
