import 'package:nasa_apod_core/nasa_apod_core.dart';

abstract class AccountOverviewEvent {}

class LoadAccountEvent extends AccountOverviewEvent {
  final AccountModel account;
  LoadAccountEvent(this.account);
}
