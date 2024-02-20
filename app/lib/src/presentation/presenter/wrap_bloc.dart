import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class AppWrapBloc extends Bloc<AppWrapEvent, AppWrapState>
    implements AppWrapPresenter {
  AppWrapBloc() : super(AppWrapLoading()) {
    on<AppWrapSwitchThemeMode>((event, emit) {
      switchThemeMode(event, emit);
    });
  }

  @override
  void switchThemeMode(
      AppWrapSwitchThemeMode event, Emitter<AppWrapState> emit) async {
    emit(AppWrapLoaded(event.themeMode));
  }
}
