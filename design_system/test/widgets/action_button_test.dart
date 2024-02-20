import 'package:flutter/material.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

import '../base/widget.dart';

void main() {
  testAppWidgets(
    'action_button',
    {
      'inactive': Builder(
        builder: (context) {
          final theme = Theme.of(context).extension<ApodThemeData>()!;
          return ApodActionButtonLayout.inactive(
            icon: (theme.icons.characters as ApodIconCharactersData).arrowBack,
          );
        },
      ),
      'hovered': Builder(
        builder: (context) {
          final theme = Theme.of(context).extension<ApodThemeData>()!;
          return ApodActionButtonLayout.hovered(
            icon: (theme.icons.characters as ApodIconCharactersData).arrowBack,
          );
        },
      ),
      'pressed': Builder(
        builder: (context) {
          final theme = Theme.of(context).extension<ApodThemeData>()!;
          return ApodActionButtonLayout.pressed(
            icon: (theme.icons.characters as ApodIconCharactersData).arrowBack,
          );
        },
      ),
    },
  );
}
