import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

abstract class CatalogPagePresenter {
  Future<void> loadCatalog(Emitter<CatalogPageState> emit);
  Future<void> loadPictureByDate(
    CatalogPageLoadPictureByDate event,
    Emitter<CatalogPageState> emit,
  );

  void goToPictureDetail(CatalogPageGoToPictureDetail event);
}
