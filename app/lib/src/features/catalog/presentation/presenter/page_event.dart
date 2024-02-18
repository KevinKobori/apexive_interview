import 'package:equatable/equatable.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

abstract class CatalogPageEvent extends Equatable {
  const CatalogPageEvent();

  @override
  List<Object?> get props => [];
}

class CatalogPageLoadCatalog extends CatalogPageEvent {
  const CatalogPageLoadCatalog();

  @override
  List<Object?> get props => [];
}

class CatalogPageLoadPictureByDate extends CatalogPageEvent {
  final DateTime date;

  const CatalogPageLoadPictureByDate(this.date);

  @override
  List<Object?> get props => [
        date,
      ];
}

class CatalogPageGoToPictureDetail extends CatalogPageEvent {
  final String pictureDate;
  final PictureViewModel? picture;
  final double aspectRatio;

  const CatalogPageGoToPictureDetail({
    required this.pictureDate,
    required this.aspectRatio,
    required this.picture,
  });

  @override
  List<Object?> get props => [
        pictureDate,
        picture,
      ];
}
