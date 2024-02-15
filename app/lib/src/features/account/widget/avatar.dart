import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class CurrentUserAvatar extends StatelessWidget {
  final AccountOverviewBloc accountOverviewPresenter;

  const CurrentUserAvatar({
    required this.accountOverviewPresenter,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountOverviewBloc, AccountOverviewState>(
      bloc: accountOverviewPresenter,
      builder: (context, state) {
        if (state is AccountOverviewStateLoadedData) {
          return UserAvatar(
            url: state.account.pictureUrl,
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    required this.url,
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
