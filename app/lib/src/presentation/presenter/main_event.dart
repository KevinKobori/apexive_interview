import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
}

class ToggleThemeModeEvent extends MainEvent {
  final ThemeMode themeMode;

  const ToggleThemeModeEvent(this.themeMode);

  @override
  List<Object?> get props => [
        themeMode,
      ];
}
