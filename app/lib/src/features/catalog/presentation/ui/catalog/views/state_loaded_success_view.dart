import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class CatalogPageLoadedSuccessView extends StatelessWidget {
  const CatalogPageLoadedSuccessView({
    super.key,
    required this.catalogPagePresenter,
    required this.catalog,
    required this.onLoadCatalog,
    required this.onLoadPictureByDate,
  });

  final CatalogPagePresenter catalogPagePresenter;
  final List<PictureViewModel> catalog;
  final VoidCallback onLoadCatalog;
  final ValueChanged<DateTime> onLoadPictureByDate;

  @override
  Widget build(BuildContext context) {
    return _MobileLayout(
      catalog: catalog,
      onLoadCatalog: onLoadCatalog,
      onLoadPictureByDate: onLoadPictureByDate,
      onViewPictureDetail: (aspectRatio, picture) {
        Modular.to.pushNamed(
          '/picture/detail/${picture.date}/${aspectRatio.toString()}',
          arguments: picture,
        );
      },
    );
  }
}

/// State dependencies :
/// * [CatalogPageBloc]
/// * [AccountOverviewBloc]
/// * [NotificationsOverviewBloc]
/// * [CollectionsOverviewBloc]
class _MobileLayout extends StatelessWidget {
  const _MobileLayout({
    required this.catalog,
    required this.onViewPictureDetail,
    required this.onLoadCatalog,
    required this.onLoadPictureByDate,
  });

  final List<PictureViewModel> catalog;
  final void Function(double, PictureViewModel) onViewPictureDetail;
  final VoidCallback onLoadCatalog;
  final ValueChanged<DateTime> onLoadPictureByDate;

  @override
  Widget build(BuildContext context) {
    return ApodScaffold(
      backgroundImage: CachedNetworkImageProvider(catalog[0].url),
      body: _Body(
        catalog: catalog,
        onLoadCatalog: onLoadCatalog,
        onLoadPictureByDate: onLoadPictureByDate,
        onViewPictureDetail: onViewPictureDetail,
      ),
      floatingBar: _NavigationBar(
        accountOverviewPresenter: Modular.get<AccountOverviewBloc>(),
        collectionsOverviewPresenter: Modular.get<CollectionsOverviewBloc>(),
        notificationsOverviewPresenter:
            Modular.get<NotificationsOverviewBloc>(),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({
    required this.catalog,
    required this.onViewPictureDetail,
    required this.onLoadCatalog,
    required this.onLoadPictureByDate,
  });

  final List<PictureViewModel> catalog;
  final void Function(double, PictureViewModel) onViewPictureDetail;
  final VoidCallback onLoadCatalog;
  final ValueChanged<DateTime> onLoadPictureByDate;

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
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
            child: ApodPageHeader(
              controller: _controller,
              image: CachedNetworkImageProvider(
                  widget.catalog[0].url),
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
                        key: Key(widget.catalog[0].date),
                        title: widget.catalog[0].title,
                        imageUrl: widget.catalog[0].url,
                        date: widget.catalog[0].date,
                        onTap: () => widget.onViewPictureDetail(
                            1, widget.catalog[0]),
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
                          onTap: widget.onLoadCatalog,
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
            child: widget.catalog.length >= 2
                ? ApodPadding(
                    padding: const ApodEdgeInsets.only(
                      left: ApodSpacing.large,
                      top: ApodSpacing.none,
                      right: ApodSpacing.large,
                      bottom: ApodSpacing.semiSmall,
                    ),
                    child: ApodText.title1('Discover Now'),
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
              children: widget.catalog
                  .skip(1)
                  .map(
                    (picture) => ApodPictureTile(
                      key: Key(picture.date),
                      title: picture.title,
                      imageUrl: picture.url,
                      date: picture.date,
                      onTap: () =>
                          widget.onViewPictureDetail(1, picture),
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

class _NavigationBar extends StatelessWidget {
  final AccountOverviewBloc accountOverviewPresenter;
  final CollectionsOverviewBloc collectionsOverviewPresenter;
  final NotificationsOverviewBloc notificationsOverviewPresenter;

  const _NavigationBar({
    required this.accountOverviewPresenter,
    required this.collectionsOverviewPresenter,
    required this.notificationsOverviewPresenter,
  });

  @override
  Widget build(BuildContext context) {
    return NotificationBar(
      notificationsOverviewPresenter: notificationsOverviewPresenter,
      child: ApodNavigationBar(
        leading: CurrentUserAvatar(
          accountOverviewPresenter: accountOverviewPresenter,
        ),
        summary: CollectionsOverview(
          collectionsOverviewPresenter: collectionsOverviewPresenter,
        ),
        body: CurrentUserAccountNavigationBody(
          accountOverviewPresenter: accountOverviewPresenter,
        ),
      ),
    );
  }
}