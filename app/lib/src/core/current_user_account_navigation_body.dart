import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class CurrentUserAccountNavigationBody extends StatelessWidget {
  final AccountOverviewBloc accountOverviewPresenter;

  const CurrentUserAccountNavigationBody({
    required this.accountOverviewPresenter,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ApodTheme.of(context);

    // TODO: NOW REMOVE THIS BLOC
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
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
