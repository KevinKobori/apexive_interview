import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

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
        if (state is AccountOverviewLoadedSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Account',
                style: textTheme.bodyLarge!.copyWith(
                  color: colorScheme.onSurface,
                ),
              ),
              Text(
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
