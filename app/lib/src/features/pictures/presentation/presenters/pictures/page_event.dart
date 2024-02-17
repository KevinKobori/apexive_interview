import 'package:equatable/equatable.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

abstract class PicturesPageEvent extends Equatable {
  const PicturesPageEvent();

  @override
  List<Object> get props => [];
}

class PicturesPageEventLoading extends PicturesPageEvent {
  const PicturesPageEventLoading();

  @override
  List<Object> get props => [];
}

class PicturesPageEventLoadPictures extends PicturesPageEvent {
  const PicturesPageEventLoadPictures();

  @override
  List<Object> get props => [];
}

class PicturesPageEventLoadPictureByDate extends PicturesPageEvent {
  final DateTime date;

  const PicturesPageEventLoadPictureByDate(this.date);

  @override
  List<Object> get props => [date];
}

class PicturesPageEventGoToPictureDetail extends PicturesPageEvent {
  final String pictureDate;
  final PictureViewModel pictureViewModel;

  const PicturesPageEventGoToPictureDetail({
    required this.pictureDate,
    required this.pictureViewModel,
  });

  @override
  List<Object> get props => [pictureDate, pictureViewModel];
}
