import 'package:equatable/equatable.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

abstract class CatalogPageEvent extends Equatable {
  const CatalogPageEvent();

  @override
  List<Object?> get props => [];
}

class LoadCatalogEvent extends CatalogPageEvent {
  const LoadCatalogEvent();

  @override
  List<Object?> get props => [];
}

class LoadPictureByDateEvent extends CatalogPageEvent {
  final DateTime date;

  const LoadPictureByDateEvent(this.date);

  @override
  List<Object?> get props => [
        date,
      ];
}

class GoToPictureDetailEvent extends CatalogPageEvent {
  final PictureViewModel picture;

  const GoToPictureDetailEvent(
    this.picture,
  );

  @override
  List<Object?> get props => [
        picture,
      ];
}
