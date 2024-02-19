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
    final colors = Theme.of(context).colorScheme;

    return BlocBuilder<AccountOverviewBloc, AccountOverviewState>(
      bloc: accountOverviewPresenter,
      builder: (context, state) {
        if (state is AccountOverviewStateLoadedSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              ApodText.paragraph1(
                'Account',
                color: colors.onSurface,
              ),
              ApodText.title3(
                state.account.name,
                color: colors.onSurface,
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
