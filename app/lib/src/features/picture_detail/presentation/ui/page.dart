import 'package:dartz/dartz.dart' as dz;
import 'package:flutter/widgets.dart';
import 'package:localstorage/localstorage.dart' as ls;
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

class PictureDetailPage extends StatefulWidget {
  const PictureDetailPage({
    required this.aspectRatio,
    required this.pictureDate,
    required this.picture,
    super.key,
  });

  final double aspectRatio;
  final String pictureDate;
  final PictureViewModel? picture;

  @override
  State<PictureDetailPage> createState() => _PictureDetailPageState();
}

class _PictureDetailPageState extends State<PictureDetailPage> {
  final ValueNotifier<PictureViewModel?> rxPicture =
      ValueNotifier<PictureViewModel?>(null);

  Future<dz.Either<DomainFailure, PictureViewModel>>
      getPictureViewModelFromLocalStorage() async {
    final pictureJsonList =
        await ls.LocalStorage(localStorageConfigKeyPathFactory())
            .getItem(localLoadCatalogUseCaseImplFactory().itemKey);

    final int pictureMapIndex = pictureJsonList.indexWhere(
        (dynamic pictureJson) => pictureJson['date'] == widget.pictureDate);
    final pictureJson = pictureJsonList[pictureMapIndex];

    final viewModelResult = PictureMapper.fromJsonToViewModel(pictureJson);
    return viewModelResult.fold((mapperFailure) {
      return dz.Left(mapperFailure.toDomain);
    }, (pictureViewModel) {
      return dz.Right(pictureViewModel);
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.picture == null) {
        final result = await getPictureViewModelFromLocalStorage();

        result.fold(
          (domainFailure) => null,
          (pictureViewModel) {
            rxPicture.value = pictureViewModel;
          },
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: rxPicture,
      builder: (_, pictureViewModel, __) {
        final picture = widget.picture ?? pictureViewModel;
        return PictureDetailPageLoadedSuccessView(
          pictureDate: widget.pictureDate,
          picture: picture!,
        );
      },
    );
  }
}
