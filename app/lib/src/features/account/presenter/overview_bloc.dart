import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

// AccountNotifier
class AccountOverviewBloc
    extends Bloc<AccountOverviewEvent, AccountOverviewState> {
  AccountOverviewBloc() : super(AccountOverviewStateLoadedSuccess.demo()) {
    on<LoadAccountEvent>((event, emit) async {
      onLoadAccount(event, emit);
    });
  }

  void onLoadAccount(
      LoadAccountEvent event, Emitter<AccountOverviewState> emit) async {
    emit(AccountOverviewStateLoadedSuccess(account: event.account));
  }
}
