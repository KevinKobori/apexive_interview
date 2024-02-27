import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

class CatalogPageBloc extends Bloc<CatalogPageEvent, CatalogPageState>
    implements CatalogPagePresenter {
  final RemoteLoadCatalogByStartEndDateUseCase loadCatalogByStartEndDate;

  CatalogPageBloc({
    required this.loadCatalogByStartEndDate,
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
    final params = LoadCatalogParams(
      startDate: DateTime.now().subtract(const Duration(days: 9)),
      endDate: DateTime.now(),
    );
    final Either<DomainFailure, List<PictureEntity>> usecaseResult =
        await loadCatalogByStartEndDate.call(params);

    /// Presenter
    final Either<DomainFailure, List<PictureViewModel>> presenterResult =
        await usecaseResult.fold(
      (domainFailure) => Left(domainFailure),
      (pictureEntityList) async {
        final pictureViewModelListResult =
            await PictureMapper.fromEntityListToViewModelList(
                pictureEntityList);
        return pictureViewModelListResult.fold(
          (mapperFailure) => Left(mapperFailure.toDomain),
          (pictureViewModelList) =>
              Right(pictureViewModelList.toList().reversed.toList()),
        );
      },
    );

    /// UI
    presenterResult.fold(
        (domainFailure) => emit(CatalogPageLoadedFailure(domainFailure.toUI)),
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
    final datasourceResult = await datasource.fetchPictureByDate(
        apodApiUrlFactory(
            apiKey: ApodEnvironmentConstants.apiKey,
            requestPath: '&date=$apodDate'));

    /// Presenter
    final Either<DomainFailure, List<PictureViewModel>> presenterResult =
        await datasourceResult.fold(
      (domainFailure) => Left(domainFailure),
      (pictureModel) async {
        final pictureEntityResult =
            PictureMapper.fromModelToEntity(pictureModel);

        return pictureEntityResult
            .fold((mapperFailure) => Left(mapperFailure.toDomain),
                (pictureEntity) async {
          final pictureViewModelResult =
              await PictureMapper.fromEntityToViewModel(pictureEntity);

          if (pictureViewModelResult.isLeft()) {
            return Left(const MapperFailure.conversionError().toDomain);
          }
          return pictureViewModelResult.fold(
              (mapperFailure) => Left(mapperFailure.toDomain),
              (pictureViewModel) => Right([pictureViewModel]));
        });
      },
    );

    /// UI
    presenterResult.fold(
        (domainFailure) => emit(CatalogPageLoadedFailure(domainFailure.toUI)),
        (pictureViewModelList) {
      emit(CatalogPageLoadedSuccess(pictureViewModelList));
    });
  }

  @override
  void goToPictureDetail(CatalogPageGoToPictureDetail event) async {
    await NavigatorManager.pushNamed('/picture/detail/${event.picture.date}');
  }
}
