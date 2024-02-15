import 'package:dartz/dartz.dart' as dz;
import 'package:flutter/widgets.dart';
import 'package:localstorage/localstorage.dart' as ls;
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

class PictureDetailPage extends StatefulWidget {
  const PictureDetailPage({
    required this.aspectRatio,
    required this.pictureDate,
    required this.pictureViewModel,
    super.key,
  });

  final double aspectRatio;
  final String pictureDate;
  final PictureViewModel? pictureViewModel;

  @override
  State<PictureDetailPage> createState() => _PictureDetailPageState();
}

class _PictureDetailPageState extends State<PictureDetailPage> {
  final ValueNotifier<PictureViewModel?> rxPictureViewModel =
      ValueNotifier<PictureViewModel?>(null);

  Future<dz.Either<DomainFailure, PictureViewModel>>
      getPictureViewModelFromLocalStorage() async {
    final pictureJsonList =
        await ls.LocalStorage(localStorageConfigKeyPathFactory())
            .getItem(localLoadPicturesUseCaseFactory().itemKey);

    final int pictureMapIndex = pictureJsonList.indexWhere(
        (dynamic pictureJson) => pictureJson['date'] == widget.pictureDate);
    final pictureJson = pictureJsonList[pictureMapIndex];

    final viewModelResult = PictureMapper.fromJsonToViewModel(pictureJson);
    return viewModelResult.fold((l) {
      return dz.Left(l.fromJsonperToDomain);
    }, (r) {
      return dz.Right(r);
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.pictureViewModel == null) {
        final result = await getPictureViewModelFromLocalStorage();
        result.fold(
          (domainFailure) {},
          (pictureViewModel) {
            rxPictureViewModel.value = pictureViewModel;
          },
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: rxPictureViewModel,
      builder: (_, pictureViewModel, __) {
        final picture = widget.pictureViewModel ?? pictureViewModel;
        return PictureDetailPageStateLoadedSuccessView(
          pictureDate: widget.pictureDate,
          pictureViewModel: picture!,
        );
      },
    );
  }
}
