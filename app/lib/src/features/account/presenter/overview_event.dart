import 'package:equatable/equatable.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

abstract class AccountOverviewEvent extends Equatable {}

class LoadAccount extends AccountOverviewEvent {
  final AccountModel account;

  LoadAccount(this.account);

  @override
  List<Object?> get props => [
        account,
      ];
}
