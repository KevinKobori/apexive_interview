import 'package:flutter/widgets.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class PictureDetailNavigationBar extends StatelessWidget {
  final AccountOverviewBloc accountOverviewPresenter;
  final CollectionsOverviewBloc collectionsOverviewPresenter;
  final NotificationsOverviewBloc notificationsOverviewPresenter;

  const PictureDetailNavigationBar({
    required this.accountOverviewPresenter,
    required this.collectionsOverviewPresenter,
    required this.notificationsOverviewPresenter,
    super.key,
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
        leading: CurrentUserAvatar(
          accountOverviewPresenter: accountOverviewPresenter,
        ),
        summary: CollectionsOverview(
          collectionsOverviewPresenter: collectionsOverviewPresenter,
        ),
        body: CurrentUserAccountNavigationBody(
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
