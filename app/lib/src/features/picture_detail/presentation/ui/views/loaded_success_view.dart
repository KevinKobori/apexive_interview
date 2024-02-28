import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class PictureDetailPageLoadedSuccessView extends StatelessWidget {
  final PictureViewModel picture;

  const PictureDetailPageLoadedSuccessView({
    required this.picture,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _MobileLayout(
      picture: picture,
    );
  }
}

class _MobileLayout extends StatefulWidget {
  final PictureViewModel picture;

  const _MobileLayout({
    required this.picture,
  });

  @override
  State<_MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<_MobileLayout> {
  @override
  Widget build(BuildContext context) {
    return ApodScaffold(
      backgroundImage: CachedNetworkImageProvider(widget.picture.url),
      body: ApodContentSheet(
        children: _buildBody(context, widget.picture),
      ),
      floatingBar: _NavigationBar(
        accountOverviewPresenter: Modular.get<AccountOverviewBloc>(),
        collectionsOverviewPresenter: Modular.get<CollectionsOverviewBloc>(),
        notificationsOverviewPresenter:
            Modular.get<NotificationsOverviewBloc>(),
      ),
    );
  }

  List<Widget> _buildBody(BuildContext context, PictureViewModel picture) {
    final metrics = Theme.of(context).extension<XMetricsData>()!;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return [
      const Align(
        alignment: Alignment.centerRight,
        child: ThemeSwitch(),
      ),
      ClipRRect(
        borderRadius: metrics.radius.border.semiSmall,
        child: AspectRatio(
          aspectRatio: picture.aspectRatio,
          child: Image(
            fit: BoxFit.cover,
            image: CachedNetworkImageProvider(
              picture.url,
            ),
          ),
        ),
      ),
      metrics.spacings.gaps.semiSmall,
      Text(
        picture.title,
        style: textTheme.titleLarge!,
      ),
      Text(
        picture.date,
        style: textTheme.titleSmall!.copyWith(
          color: colorScheme.primary,
        ),
      ),
      Text(
        picture.explanation,
        style: textTheme.bodyLarge!,
      ),
      metrics.spacings.gaps.superLarge,
      metrics.spacings.gaps.superLarge,
    ];
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
    final metrics = Theme.of(context).extension<XMetricsData>()!;
    final assets = Theme.of(context).extension<ApodAssetsData>()!;
    final textTheme = Theme.of(context).textTheme;
    final route = ModalRoute.of(context);

    return NotificationBar(
      notificationsOverviewPresenter: notificationsOverviewPresenter,
      child: ApodNavigationBar(
          animation: route?.animation,
          canNavigateBack: true,
          leading: AccountAvatar(
            accountOverviewPresenter: accountOverviewPresenter,
          ),
          summary: CollectionsOverview(
            collectionsOverviewPresenter: collectionsOverviewPresenter,
          ),
          body: AccountNavigationBarBody(
            accountOverviewPresenter: accountOverviewPresenter,
          ),
          action: ApodElevatedButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Add to collections',
                  style: textTheme.titleSmall!,
                ),
                metrics.spacings.gaps.semiSmall,
                ApodIcon.regular(
                    (assets.icons.characters as ApodIconCharactersData)
                        .addPicture),
              ],
            ),
          )),
    );
  }
}
