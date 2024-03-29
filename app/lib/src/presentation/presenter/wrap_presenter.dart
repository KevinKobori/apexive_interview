import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

mixin AppWrapPresenter {
  void onToggleThemeMode(
      ToggleThemeModeEvent event, Emitter<AppWrapState> emit);
}
