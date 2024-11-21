import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

abstract class CatalogPagePresenter {
  Future<void> onLoadCatalog(Emitter<CatalogPageState> emit);
  Future<void> onLoadPictureByDate(
    LoadPictureByDateEvent event,
    Emitter<CatalogPageState> emit,
  );

  void onGoToPictureDetail(GoToPictureDetailEvent event);
}
