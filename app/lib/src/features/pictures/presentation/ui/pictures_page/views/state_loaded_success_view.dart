import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

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
    return ApodScaffold(
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
    final theme = ApodTheme.of(context);
    return LayoutBuilder(builder: (context, constraints) {
      return CustomScrollView(
        controller: _controller,
        slivers: [
          SliverToBoxAdapter(
            child: PicturesPageHeader(
              controller: _controller,
              image: CachedNetworkImageProvider(
                  widget.pictureViewModelList[0].url),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: ApodEdgeInsets.only(
                left: ApodSpacing.large,
                top: ApodSpacing.large,
                right: ApodSpacing.large,
                bottom: ApodSpacing.large,
              ).toEdgeInsets(theme),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(
                    children: [
                      ApodPictureTile(
                        key: Key(widget.pictureViewModelList[0].date),
                        title: widget.pictureViewModelList[0].title,
                        imageUrl: widget.pictureViewModelList[0].url,
                        date: widget.pictureViewModelList[0].date,
                        onTap: () => widget.onViewPictureDetail(
                            1, widget.pictureViewModelList[0]),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          margin:
                              ApodEdgeInsets.semiSmall().toEdgeInsets(theme),
                          height: theme.icons.sizes.big,
                          width: theme.icons.sizes.big,
                          alignment: Alignment.centerLeft,
                          child: SvgPicture(theme.images.appLogo),
                        ),
                      ),
                    ],
                  ),
                  ApodGap.large(),
                  SizedBox(
                    height: 38,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ApodTextButton(
                          onTap: widget.onLoadAllPicturesList,
                          title: 'List all',
                        ),
                        ApodGap.semiSmall(),
                        ApodDatePickerDialog(
                            onLoadPictureByDate: widget.onLoadPictureByDate),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: widget.pictureViewModelList.length >= 2
                ? FittedBox(
                    child: ApodPadding(
                      padding: const ApodEdgeInsets.only(
                        left: ApodSpacing.large,
                        top: ApodSpacing.none,
                        right: ApodSpacing.large,
                        bottom: ApodSpacing.semiSmall,
                      ),
                      child: ApodText.title1('Astronomy Picture of the Day'),
                    ),
                  )
                : SizedBox.shrink(),
          ),
          SliverSafeArea(
            top: false,
            sliver: ApodSliverGridTile(
              padding: EdgeInsets.only(
                left: theme.spacings.large,
                top: theme.spacings.extraSmall,
                right: theme.spacings.large,
                bottom: math.max(
                  mediaQuery.padding.bottom,
                  theme.spacings.large,
                ),
              ),
              crossAxisCount: (constraints.maxWidth / 300).ceil(),
              children: widget.pictureViewModelList
                  .skip(1)
                  .map(
                    (pictureViewModel) => ApodPictureTile(
                      key: Key(pictureViewModel.date),
                      title: pictureViewModel.title,
                      imageUrl: pictureViewModel.url,
                      date: pictureViewModel.date,
                      onTap: () =>
                          widget.onViewPictureDetail(1, pictureViewModel),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      );
    });
  }
}
