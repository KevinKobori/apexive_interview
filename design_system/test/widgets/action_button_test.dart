import 'package:flutter/widgets.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

import '../base/widget.dart';

void main() {
  testAppWidgets(
    'action_button',
    {
      'inactive': Builder(
        builder: (context) {
          final theme = ApodTheme.of(context);
          return ApodActionButtonLayout.inactive(
            icon: theme.icons.characters.arrowBack,
          );
        },
      ),
      'hovered': Builder(
        builder: (context) {
          final theme = ApodTheme.of(context);
          return ApodActionButtonLayout.hovered(
            icon: theme.icons.characters.arrowBack,
          );
        },
      ),
      'pressed': Builder(
        builder: (context) {
          final theme = ApodTheme.of(context);
          return ApodActionButtonLayout.pressed(
            icon: theme.icons.characters.arrowBack,
          );
        },
      ),
    },
  );
}
