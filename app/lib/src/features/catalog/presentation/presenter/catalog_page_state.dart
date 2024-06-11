import 'package:nasa_apod_core/nasa_apod_core.dart';

abstract class CatalogPageState {}

class CatalogPageIdle extends CatalogPageState {}

class CatalogPageLoading extends CatalogPageState {}

class CatalogPageLoadedSuccess extends CatalogPageState {
  final List<PictureViewModel> catalog;

  CatalogPageLoadedSuccess(this.catalog);
}

class CatalogPageLoadedFailure extends CatalogPageState {
  final String message;

  CatalogPageLoadedFailure(this.message);
}
