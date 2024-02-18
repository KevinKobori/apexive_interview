import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

// AccountNotifier
class AccountOverviewBloc
    extends Bloc<AccountOverviewEvent, AccountOverviewState> {
  AccountOverviewBloc() : super(AccountOverviewStateLoadedSuccess.demo()) {
    on<AccountOverviewEventUpdateData>((event, emit) {
      emit(AccountOverviewStateLoadedSuccess(account: event.account));
    });
  }
}
