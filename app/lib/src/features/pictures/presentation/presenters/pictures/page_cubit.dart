import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

class PicturesPageCubit extends Cubit<PicturesPageState>
    implements PicturesPagePresenter {
  final RemoteLoadLastTenDaysPicturesByDateUseCase
      loadLastTenDaysPicturesByDate;
  List<PictureViewModel>? pictureViewModelList;

  PicturesPageCubit({
    required this.loadLastTenDaysPicturesByDate,
  }) : super(PicturesPageStateIdle());

  @override
  void loadPictures() async {
    emit(PicturesPageStateLoading());

    final loadPicturesResult = await _loadPictures();
    loadPicturesResult.fold(
        (domainFailure) =>
            emit(PicturesPageStateLoadedFailure(domainFailure.toUIFailure)),
        (pictureViewModelList) {
      this.pictureViewModelList = pictureViewModelList;
      emit(PicturesPageStateLoadedSuccess(this.pictureViewModelList!));
    });
  }

  Future<Either<DomainFailure, List<PictureViewModel>>> _loadPictures() async {
    final nowDate = DateTime.now();
    final result = await loadLastTenDaysPicturesByDate.call(nowDate);

    return result.fold(
      (domainFailure) => Left(domainFailure),
      (pictureEntityList) {
        final pictureViewModelListResult =
            PictureMapper.fromEntityListToViewModelList(pictureEntityList);
        return pictureViewModelListResult.fold(
          (mapperFailure) => Left(mapperFailure.fromJsonperToDomain),
          (pictureViewModelList) =>
              Right(pictureViewModelList.toList().reversed.toList()),
        );
      },
    );
  }

  @override
  void loadPictureByDate(BuildContext context, {required DateTime date}) async {
    emit(PicturesPageStateLoading());

    final loadPictureByDateResult = await _loadPictureByDate(date);

    loadPictureByDateResult.fold(
        (domainFailure) =>
            emit(PicturesPageStateLoadedFailure(domainFailure.toUIFailure)),
        (pictureViewModelList) {
      emit(PicturesPageStateLoadedSuccess(this.pictureViewModelList!));
    });
  }

  Future<Either<DomainFailure, List<PictureViewModel>>> _loadPictureByDate(
      DateTime date) async {
    final datasource = PictureDatasourceImpl(httpClientAdapterFactory());
    final apodDate = DateTimeMapper.getStringFromDateTimeYMD(date);
    final result = await datasource.fetchByDate(apodApiUrlFactory(
        apiKey: ApodEnvironmentConstants.apiKey,
        requestPath: '&date=$apodDate'));
    return result.fold(
      (domainFailure) => Left(domainFailure),
      (pictureModel) {
        final pictureViewModelResult =
            PictureMapper.fromModelToViewModel(pictureModel);
        return pictureViewModelResult.fold(
          (mapperFailure) => Left(mapperFailure.fromJsonperToDomain),
          (pictureViewModel) => Right([pictureViewModel]),
        );
      },
    );
  }

  @override
  void pushToPictureDetails(String pictureDate,
      {required PictureViewModel pictureViewModel}) {
    NavigatorManager.pushNamed('picture/detail/$pictureDate',
        arguments: pictureViewModel);
  }
}
