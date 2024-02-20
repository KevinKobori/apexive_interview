import 'package:flutter/material.dart';

abstract class AppWrapState {}

class AppWrapLoading extends AppWrapState {}

class AppWrapLoaded extends AppWrapState {
  final ThemeMode themeMode;

  AppWrapLoaded(this.themeMode);
}
