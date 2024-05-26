import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

mixin MainPresenter {
  void onToggleThemeMode(ToggleThemeMode event, Emitter<MainState> emit);
}
