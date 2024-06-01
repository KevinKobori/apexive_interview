import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

class CatalogPageBloc extends Bloc<CatalogPageEvent, CatalogPageState>
    implements CatalogPagePresenter {
  final RemoteLoadCatalogByStartDateEndDateUseCase loadCatalogByStartEndDate;

  CatalogPageBloc({
    required this.loadCatalogByStartEndDate,
  }) : super(CatalogPageLoading()) {
    on<LoadCatalog>((event, emit) async {
      await onLoadCatalog(emit);
    });

    on<LoadPictureByDate>((event, emit) async {
      await onLoadPictureByDate(event, emit);
    });

    on<GoToPictureDetail>((event, emit) async {
      await onGoToPictureDetail(event);
    });
  }

  @override
  Future<void> onLoadCatalog(Emitter<CatalogPageState> emit) async {
    emit(CatalogPageLoading());

    /// External, Infra, Data, Domain
    final params = LoadCatalogParams(
      startDate: DateTime.now().subtract(const Duration(days: 9)),
      endDate: DateTime.now(),
    );

    final Either<DomainFailure, List<PictureEntity>> usecaseResult =
        await loadCatalogByStartEndDate.call(params);

    /// Presenter
    final Either<DomainFailure, List<PictureViewModel>> presenterResult =
        await usecaseResult.fold(
      /// Left
      (domainFailure) => Left(domainFailure),

      /// Right
      (pictureEntityList) async {
        final pictureViewModelListResult =
            await PictureMapper.fromEntityListToViewModelList(
                pictureEntityList);
        return pictureViewModelListResult.fold(
          /// Left
          (mapperFailure) => Left(mapperFailure.toDomain()),

          /// Right
          (pictureViewModelList) =>
              Right(pictureViewModelList.toList().reversed.toList()),
        );
      },
    );

    /// UI
    presenterResult.fold(
        (domainFailure) => emit(CatalogPageLoadedFailure(domainFailure.toUI())),
        (pictureViewModelList) =>
            emit(CatalogPageLoadedSuccess(pictureViewModelList)));
  }

  @override
  Future<void> onLoadPictureByDate(
      LoadPictureByDate event, Emitter<CatalogPageState> emit) async {
    emit(CatalogPageLoading());

    /// Infra, Data, Domain
    final datasource = PictureDatasourceImpl(httpClientAdapterFactory());
    final apodDate = DateTimeMapper.getStringFromDateTimeYMD(event.date);
    final datasourceResult = await datasource.fetchPictureByDate(
        apodApiUrlFactory(
            baseURL: ApodDotEnv.instance.baseURL,
            apiKey: ApodDotEnv.instance.apiKey,
            requestPath: '&date=$apodDate'));

    /// Presenter
    final Either<DomainFailure, List<PictureViewModel>> presenterResult =
        await datasourceResult.fold(
      /// Left
      (domainFailure) => Left(domainFailure),

      /// Right
      (pictureModel) async {
        final pictureEntityResult =
            PictureMapper.fromModelToEntity(pictureModel);

        return pictureEntityResult
            .fold((mapperFailure) => Left(mapperFailure.toDomain()),
                (pictureEntity) async {
          final pictureViewModelResult =
              await PictureMapper.fromEntityToViewModel(pictureEntity);

          return pictureViewModelResult.fold(

              /// Left
              (mapperFailure) => Left(mapperFailure.toDomain()),

              /// Right
              (pictureViewModel) => Right([pictureViewModel]));
        });
      },
    );

    /// UI
    presenterResult.fold(
        (domainFailure) => emit(CatalogPageLoadedFailure(domainFailure.toUI())),
        (pictureViewModelList) {
      emit(CatalogPageLoadedSuccess(pictureViewModelList));
    });
  }

  @override
  Future<void> onGoToPictureDetail(GoToPictureDetail event) async {
    await NavigatorManager.pushNamed(
        MainModule.pictureDetailsRoute + event.picture.date);
  }
}
