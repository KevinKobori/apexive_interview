import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class PictureDetailPageLoadedSuccessView extends StatelessWidget {
  final String pictureDate;
  final PictureViewModel picture;

  const PictureDetailPageLoadedSuccessView({
    required this.pictureDate,
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
  double _aspectRatio = 1;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadAspectRatio();
  }

  void _loadAspectRatio() async {
    try {
      final double aspectRatio =
          await ImageHelper.getImageAspectRatio(widget.picture.url);
      if (mounted) {
        setState(() {
          _aspectRatio = aspectRatio;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ApodTheme.of(context);
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return ApodScaffold(
        backgroundImage: CachedNetworkImageProvider(widget.picture.url),
        body: ApodContentSheet(
          children: _buildBody(context, theme, widget.picture),
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

  List<Widget> _buildBody(
      BuildContext context, ApodThemeData theme, PictureViewModel picture) {
    return [
      ClipRRect(
        borderRadius: theme.radius.asBorderRadius().regular,
        child: AspectRatio(
          aspectRatio: _aspectRatio,
          child: Image(
            fit: BoxFit.cover,
            image: CachedNetworkImageProvider(
              picture.url,
            ),
          ),
        ),
      ),
      const ApodGap.semiSmall(),
      ApodText.title1(picture.title),
      ApodText.title3(
        picture.date,
        color: theme.colors.accent,
      ),
      ApodText.paragraph1(picture.explanation),
      const SizedBox(
        height: 100,
      ),
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
    final theme = ApodTheme.of(context);
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
        action: ApodTextButton(
          icon: theme.icons.characters.addPicture,
          title: 'Add to collections',
          onTap: () {},
        ),
      ),
    );
  }
}
