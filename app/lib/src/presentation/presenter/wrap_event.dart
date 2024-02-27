import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AppWrapEvent extends Equatable {
  const AppWrapEvent();

  @override
  List<Object?> get props => [];
}

class AppWrapSwitchThemeMode extends AppWrapEvent {
  final ThemeMode themeMode;

  const AppWrapSwitchThemeMode(this.themeMode);

  @override
  List<Object?> get props => [
        themeMode,
      ];
}
