import 'package:nasa_apod_core/nasa_apod_core.dart';

abstract class PicturesPageState {}

class PicturesPageStateIdle extends PicturesPageState {}

class PicturesPageStateLoading extends PicturesPageState {}

class PicturesPageStateLoadedSuccess extends PicturesPageState {
  final List<PictureViewModel> pictureViewModelList;

  PicturesPageStateLoadedSuccess(this.pictureViewModelList);
}

class PicturesPageStateLoadedFailure extends PicturesPageState {
  final String failureMessage;

  PicturesPageStateLoadedFailure(this.failureMessage);
}
