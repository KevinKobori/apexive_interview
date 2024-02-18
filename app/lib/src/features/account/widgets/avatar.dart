import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class AccountAvatar extends StatelessWidget {
  final AccountOverviewBloc accountOverviewPresenter;

  const AccountAvatar({
    required this.accountOverviewPresenter,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountOverviewBloc, AccountOverviewState>(
      bloc: accountOverviewPresenter,
      builder: (context, state) {
        if (state is AccountOverviewStateLoadedSuccess) {
          return AccountAvatarSuccessView(
            url: state.account.pictureUrl,
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class AccountAvatarSuccessView extends StatelessWidget {
  const AccountAvatarSuccessView({
    required this.url,
    super.key,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: BoxFit.cover,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        return ClipOval(
          child: child,
        );
      },
    );
  }
}
