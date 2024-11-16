import 'package:nasa_apod_core/nasa_apod_core.dart';

abstract class AccountOverviewState {}

class AccountOverviewLoadedSuccess extends AccountOverviewState {
  final AccountModel account;

  AccountOverviewLoadedSuccess({required this.account});

  factory AccountOverviewLoadedSuccess.demo() =>
      AccountOverviewLoadedSuccess(
        account: const AccountModel(
          name: 'Kevin Kobori',
          pictureUrl:
              'https://media.licdn.com/dms/image/D5603AQFAMYa_2cuuIQ/profile-displayphoto-shrink_800_800/0/1692304062975?e=2147483647&v=beta&t=o7ZDGbri7J2DgnyFU4KrzZM-7eVVzvT3yasZ510wTVE',
        ),
      );
}
