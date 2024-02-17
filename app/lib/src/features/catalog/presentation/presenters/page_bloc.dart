import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

class CatalogPageBloc extends Bloc<CatalogPageEvent, CatalogPageState>
    implements CatalogPagePresenter {
  final RemoteLoadCatalogByInitEndDateUseCase loadCatalogByInitEndDate;

  CatalogPageBloc({
    required this.loadCatalogByInitEndDate,
  }) : super(CatalogPageLoading()) {
    on<CatalogPageLoadCatalog>((event, emit) async {
      await loadCatalog(emit);
    });

    on<CatalogPageLoadPictureByDate>((event, emit) async {
      await loadPictureByDate(event, emit);
    });

    on<CatalogPageGoToPictureDetail>((event, emit) {
      goToPictureDetail(event);
    });
  }

  @override
  Future<void> loadCatalog(Emitter<CatalogPageState> emit) async {
    emit(CatalogPageLoading());

    /// Infra, Data, Domain
    final now = DateTime.now();
    final Either<DomainFailure, List<PictureEntity>> usecaseResult =
        await loadCatalogByInitEndDate.call(now);

    /// Presenter
    final Either<DomainFailure, List<PictureViewModel>> presenterResult =
        await usecaseResult.fold(
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

    /// UI
    presenterResult.fold(
        (domainFailure) =>
            emit(CatalogPageLoadedFailure(domainFailure.toUIFailure)),
        (pictureViewModelList) {
      emit(CatalogPageLoadedSuccess(pictureViewModelList));
    });
  }

  @override
  Future<void> loadPictureByDate(CatalogPageLoadPictureByDate event,
      Emitter<CatalogPageState> emit) async {
    emit(CatalogPageLoading());

    /// Infra, Data, Domain
    final datasource = PictureDatasourceImpl(httpClientAdapterFactory());
    final apodDate = DateTimeMapper.getStringFromDateTimeYMD(event.date);
    final datasourceResult = await datasource.fetchByDate(apodApiUrlFactory(
        apiKey: ApodEnvironmentConstants.apiKey,
        requestPath: '&date=$apodDate'));

    /// Presenter
    final Either<DomainFailure, List<PictureViewModel>> presenterResult =
        datasourceResult.fold(
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

    /// UI
    presenterResult.fold(
        (domainFailure) =>
            emit(CatalogPageLoadedFailure(domainFailure.toUIFailure)),
        (pictureViewModelList) {
      emit(CatalogPageLoadedSuccess(pictureViewModelList));
    });
  }

  @override
  void goToPictureDetail(CatalogPageGoToPictureDetail event) {
    NavigatorManager.pushNamed('picture/detail/$event.pictureDate',
        arguments: event.picture);
  }
}
