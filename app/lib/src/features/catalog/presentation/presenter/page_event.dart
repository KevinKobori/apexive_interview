import 'package:equatable/equatable.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

abstract class CatalogPageEvent extends Equatable {
  const CatalogPageEvent();
}

class LoadCatalog extends CatalogPageEvent {
  const LoadCatalog();

  @override
  List<Object?> get props => [];
}

class LoadPictureByDate extends CatalogPageEvent {
  final DateTime date;

  const LoadPictureByDate(this.date);

  @override
  List<Object?> get props => [
        date,
      ];
}

class GoToPictureDetail extends CatalogPageEvent {
  final PictureViewModel picture;

  const GoToPictureDetail(this.picture);

  @override
  List<Object?> get props => [
        picture,
      ];
}
