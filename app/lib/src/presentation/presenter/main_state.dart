import 'package:flutter/material.dart';

abstract class MainState {}

class MainLoading extends MainState {}

class MainLoaded extends MainState {
  final ThemeMode themeMode;

  MainLoaded(this.themeMode);
}
