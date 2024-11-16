import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class AppWrapBloc extends Bloc<AppWrapEvent, AppWrapState>
    implements AppWrapPresenter {
  AppWrapBloc() : super(AppWrapLoading()) {
    on<ToggleThemeModeEvent>((event, emit) {
      onToggleThemeMode(event, emit);
    });
  }

  @override
  void onToggleThemeMode(
      ToggleThemeModeEvent event, Emitter<AppWrapState> emit) {
    emit(AppWrapLoaded(event.themeMode));
  }
}
