import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class PicturesPageNavigationBar extends StatelessWidget {
  final AccountOverviewBloc accountOverviewPresenter;
  final CollectionsOverviewBloc collectionsOverviewPresenter;
  final NotificationsOverviewBloc notificationsOverviewPresenter;

  const PicturesPageNavigationBar({
    required this.accountOverviewPresenter,
    required this.collectionsOverviewPresenter,
    required this.notificationsOverviewPresenter,
    super.key,
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

class CurrentUserAccountNavigationBody extends StatelessWidget {
  final AccountOverviewBloc accountOverviewPresenter;

  const CurrentUserAccountNavigationBody({
    required this.accountOverviewPresenter,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ApodTheme.of(context);

    return BlocBuilder<AccountOverviewBloc, AccountOverviewState>(
      bloc: accountOverviewPresenter,
      builder: (context, state) {
        if (state is AccountOverviewStateLoadedData) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              ApodText.paragraph1(
                'Account',
                color: theme.colors.actionBarForeground,
              ),
              ApodText.title3(
                state.account.name,
                color: theme.colors.actionBarForeground,
              ),
            ],
          );
        } else {
          return Text('PUT LOADING HERE 2');
        }
      },
    );
  }
}
