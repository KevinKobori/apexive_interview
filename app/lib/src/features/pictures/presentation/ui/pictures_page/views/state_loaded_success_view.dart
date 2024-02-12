import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

import '../widgets/header.dart';
import '../widgets/navigation_bar.dart';

class PicturesPageStateLoadedSuccessView extends StatelessWidget {
  const PicturesPageStateLoadedSuccessView({
    super.key,
    required this.picturesPagePresenter,
    required this.pictureViewModelList,
    required this.onLoadAllPicturesList,
    required this.onLoadPictureByDate,
  });

  final PicturesPagePresenter picturesPagePresenter;
  final List<PictureViewModel> pictureViewModelList;
  final VoidCallback onLoadAllPicturesList;
  final ValueChanged<DateTime> onLoadPictureByDate;

  @override
  Widget build(BuildContext context) {
    return PicturesPageStateLoadedSuccessViewMobileLayout(
      pictureViewModelList: pictureViewModelList,
      onLoadAllPicturesList: onLoadAllPicturesList,
      onLoadPictureByDate: onLoadPictureByDate,
      onViewPictureDetail: (aspectRatio, pictureViewModel) {
        Modular.to.pushNamed(
          '/picture/detail/${pictureViewModel.date}/${aspectRatio.toString()}',
          arguments: pictureViewModel,
        );
      },
    );
  }
}

/// State dependencies :
/// * [PicturesPageBloc]
/// * [AccountOverviewBloc]
/// * [NotificationsOverviewBloc]
/// * [CollectionsOverviewBloc]
class PicturesPageStateLoadedSuccessViewMobileLayout extends StatelessWidget {
  const PicturesPageStateLoadedSuccessViewMobileLayout({
    super.key,
    required this.pictureViewModelList,
    required this.onViewPictureDetail,
    required this.onLoadAllPicturesList,
    required this.onLoadPictureByDate,
  });

  final List<PictureViewModel> pictureViewModelList;
  final void Function(double, PictureViewModel) onViewPictureDetail;
  final VoidCallback onLoadAllPicturesList;
  final ValueChanged<DateTime> onLoadPictureByDate;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundImage: CachedNetworkImageProvider(pictureViewModelList[0].url),
      body: _BodyWithProducts(
        pictureViewModelList: pictureViewModelList,
        onLoadAllPicturesList: onLoadAllPicturesList,
        onLoadPictureByDate: onLoadPictureByDate,
        onViewPictureDetail: onViewPictureDetail,
      ),
      floatingBar: PicturesPageNavigationBar(
        accountOverviewPresenter: Modular.get<AccountOverviewBloc>(),
        collectionsOverviewPresenter: Modular.get<CollectionsOverviewBloc>(),
        notificationsOverviewPresenter:
            Modular.get<NotificationsOverviewBloc>(),
      ),
    );
  }
}

class _BodyWithProducts extends StatefulWidget {
  const _BodyWithProducts({
    required this.pictureViewModelList,
    required this.onViewPictureDetail,
    required this.onLoadAllPicturesList,
    required this.onLoadPictureByDate,
  });

  final List<PictureViewModel> pictureViewModelList;
  final void Function(double, PictureViewModel) onViewPictureDetail;
  final VoidCallback onLoadAllPicturesList;
  final ValueChanged<DateTime> onLoadPictureByDate;

  @override
  State<_BodyWithProducts> createState() => _BodyWithProductsState();
}

class _BodyWithProductsState extends State<_BodyWithProducts> {
  late final ScrollController _controller = ScrollController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = AppTheme.of(context);
    return LayoutBuilder(builder: (context, constraints) {
      return CustomScrollView(
        controller: _controller,
        slivers: [
          SliverToBoxAdapter(
            child: PicturesPageHeader(
              controller: _controller,
              image: CachedNetworkImageProvider(
                  widget.pictureViewModelList[1].url),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: AppEdgeInsets.only(
                left: AppGapSize.large,
                top: AppGapSize.large,
                right: AppGapSize.large,
                bottom: AppGapSize.none,
              ).toEdgeInsets(theme),
              child: Column(
                children: [
                  OutlinedButton(
                    onPressed: () => widget.onLoadAllPicturesList,
                    child: const Text('List all'),
                  ),
                  ApodDatePickerDialog(
                      onLoadPictureByDate: widget.onLoadPictureByDate),
                  Stack(
                    children: [
                      PictureTile(
                        key: Key(widget.pictureViewModelList[0].date),
                        title: widget.pictureViewModelList[0].title,
                        imageUrl: widget.pictureViewModelList[0].url,
                        date: widget.pictureViewModelList[0].date,
                        // aspectRatio: widget.pictureViewModelList[0].aspectRatio,
                        onTap: () => widget.onViewPictureDetail(
                            1, widget.pictureViewModelList[0]),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          margin: AppEdgeInsets.semiSmall().toEdgeInsets(theme),
                          height: theme.typography.title1.fontSize! * 1.3,
                          width: theme.typography.title1.fontSize! * 1.3,
                          alignment: Alignment.centerLeft,
                          child: SvgPicture(theme.images.appLogo),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: AppPadding(
              padding: const AppEdgeInsets.only(
                left: AppGapSize.large,
                top: AppGapSize.large,
                right: AppGapSize.large,
                bottom: AppGapSize.none,
              ),
              child: AppText.title1('Discover Now'),
            ),
          ),
          SliverSafeArea(
            top: false,
            sliver: AppTileSliverGrid(
              padding: EdgeInsets.only(
                left: theme.spacing.large,
                top: theme.spacing.extraSmall,
                right: theme.spacing.large,
                bottom: math.max(
                  mediaQuery.padding.bottom,
                  theme.spacing.large,
                ),
              ),
              crossAxisCount: (constraints.maxWidth / 300).ceil(),
              children: [
                ...widget.pictureViewModelList.skip(1).map(
                      (pictureViewModel) => PictureTile(
                        key: Key(pictureViewModel.date), // .id
                        title: pictureViewModel.title,
                        imageUrl: pictureViewModel.url,
                        date: pictureViewModel.date,
                        // aspectRatio: pictureViewModel.aspectRatio,
                        onTap: () =>
                            widget.onViewPictureDetail(1, pictureViewModel),
                      ),
                    ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
