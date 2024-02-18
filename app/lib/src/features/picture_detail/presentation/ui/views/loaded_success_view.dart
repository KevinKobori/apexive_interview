import 'package:cached_network_image/cached_network_image.dart';
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
    final theme = Theme.of(context).extension<ApodThemeData>()!;
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

  List<Widget> _buildBody(
      BuildContext context, ApodThemeData theme, PictureViewModel picture) {
    return [
      ClipRRect(
        borderRadius: theme.radius.asBorderRadius().regular,
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
    final theme = Theme.of(context).extension<ApodThemeData>()!;
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
