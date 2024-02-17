import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

abstract class PicturesPagePresenter {
  Future<void> loadPictures(Emitter<PicturesPageState> emit);
  Future<void> loadPictureByDate(PicturesPageEventLoadPictureByDate event,
      Emitter<PicturesPageState> emit);

  void goToPictureDetail(PicturesPageEventGoToPictureDetail event);
}
