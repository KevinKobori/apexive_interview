import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

// AccountNotifier
class AccountOverviewBloc
    extends Bloc<AccountOverviewEvent, AccountOverviewState> {
  AccountOverviewBloc() : super(AccountOverviewLoadedSuccess.demo()) {
    on<LoadAccount>((event, emit) async {
      onLoadAccount(event, emit);
    });
  }

  void onLoadAccount(
      LoadAccount event, Emitter<AccountOverviewState> emit) async {
    emit(AccountOverviewLoadedSuccess(account: event.account));
  }
}
