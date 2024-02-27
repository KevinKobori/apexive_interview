import 'package:flutter/material.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

import '../base/widget.dart';

void main() {
  testAppWidgets(
    'action_button',
    {
      'inactive': Builder(
        builder: (context) {
          final metrics = Theme.of(context).extension<ApodThemeData>()!;
          return ApodActionButtonLayout.inactive(
            icon: (metrics.icons.characters as ApodIconCharactersData).arrowBack,
          );
        },
      ),
      'hovered': Builder(
        builder: (context) {
          final metrics = Theme.of(context).extension<ApodThemeData>()!;
          return ApodActionButtonLayout.hovered(
            icon: (metrics.icons.characters as ApodIconCharactersData).arrowBack,
          );
        },
      ),
      'pressed': Builder(
        builder: (context) {
          final metrics = Theme.of(context).extension<ApodThemeData>()!;
          return ApodActionButtonLayout.pressed(
            icon: (metrics.icons.characters as ApodIconCharactersData).arrowBack,
          );
        },
      ),
    },
  );
}
