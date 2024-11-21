import 'package:dartz/dartz.dart' as dz;
import 'package:flutter/widgets.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

class PictureDetailPage extends StatefulWidget {
  const PictureDetailPage({
    required this.pictureDate,
    super.key,
  });

  final String pictureDate;

  @override
  State<PictureDetailPage> createState() => _PictureDetailPageState();
}

class _PictureDetailPageState extends State<PictureDetailPage> {
  final ValueNotifier<PictureViewModel?> rxPicture =
      ValueNotifier<PictureViewModel?>(null);

  Future<dz.Either<DomainFailure, PictureViewModel>>
      getPictureViewModelFromLocalStorage() async {
    final pictureJsonList =
        await ApodLocalStorage(localStorageConfigKeyPathFactory())
            .getItem(localLoadCatalogUseCaseImplFactory().itemKey);

    final int pictureMapIndex =
        pictureJsonList.indexWhere((dynamic pictureJson) {
      final apodDate = DateTimeMapper.getStringFromDateTimeYMD(
          DateTime.parse(pictureJson['date']));

      return apodDate == widget.pictureDate;
    });
    final pictureJson = pictureJsonList[pictureMapIndex];

    final viewModelResult =
        await PictureMapper.fromJsonToViewModel(pictureJson);
    return viewModelResult.fold((mapperFailure) {
      return dz.Left(mapperFailure.toDomain);
    }, (pictureViewModel) {
      return dz.Right(pictureViewModel);
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final localStorageResult = await getPictureViewModelFromLocalStorage();

      localStorageResult.fold(
        (domainFailure) => null,
        (pictureViewModel) {
          rxPicture.value = pictureViewModel;
        },
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: rxPicture,
      builder: (_, pictureViewModel, __) {
        if (pictureViewModel == null) {
          return const Center(
            // TODO:
            child: Text('ERROR'),
          );
        } else {
          return PictureDetailPageLoadedSuccessView(
            picture: pictureViewModel,
          );
        }
      },
    );
  }
}
