import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class MainBloc extends Bloc<MainEvent, MainState> implements MainPresenter {
  MainBloc() : super(MainLoading()) {
    on<ToggleThemeMode>((event, emit) {
      onToggleThemeMode(event, emit);
    });
  }

  @override
  void onToggleThemeMode(ToggleThemeMode event, Emitter<MainState> emit) {
    emit(MainLoaded(event.themeMode));
  }
}
