import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AppWrapEvent extends Equatable {
  const AppWrapEvent();

  @override
  List<Object?> get props => [];
}

class ToggleThemeModeEvent extends AppWrapEvent {
  final ThemeMode themeMode;

  const ToggleThemeModeEvent(this.themeMode);

  @override
  List<Object?> get props => [
        themeMode,
      ];
}
