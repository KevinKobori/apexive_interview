import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
}

class ToggleThemeMode extends MainEvent {
  final ThemeMode themeMode;

  const ToggleThemeMode(this.themeMode);

  @override
  List<Object?> get props => [
        themeMode,
      ];
}
