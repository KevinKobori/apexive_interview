import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class AccountNavigationBarBody extends StatelessWidget {
  final AccountOverviewBloc accountOverviewPresenter;

  const AccountNavigationBarBody({
    required this.accountOverviewPresenter,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<AccountOverviewBloc, AccountOverviewState>(
      bloc: accountOverviewPresenter,
      builder: (context, state) {
        if (state is AccountOverviewStateLoadedSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              ApodText.custom(
                'Account',
                style: textTheme.bodyLarge!.copyWith(
                  color: colorScheme.onSurface,
                ),
              ),
              ApodText.custom(
                state.account.name,
                style: textTheme.titleSmall!.copyWith(
                  color: colorScheme.onSurface,
                ),
              ),
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
