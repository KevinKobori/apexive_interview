import 'package:nasa_apod_core/nasa_apod_core.dart';

abstract class AccountOverviewEvent {}

class AccountOverviewEventUpdateData extends AccountOverviewEvent {
  final AccountModel account;
  AccountOverviewEventUpdateData(this.account);
}
