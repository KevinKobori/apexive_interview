import 'package:flutter/widgets.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

import '../base/widget.dart';

void main() {
  testAppWidgets(
    'button',
    {
      'text-inactive': const ApodTextButtonLayout.inactive(
        title: 'Buy',
      ),
      'text-hovered': const ApodTextButtonLayout.hovered(
        title: 'Buy',
      ),
      'text-pressed': const ApodTextButtonLayout.pressed(
        title: 'Buy',
      ),
      'icon-inactive': Builder(
        builder: (context) {
          final theme = ApodTheme.of(context);
          return ApodTextButtonLayout.inactive(
            icon: theme.icons.characters.shoppingCart,
          );
        },
      ),
      'icon-hovered': Builder(
        builder: (context) {
          final theme = ApodTheme.of(context);
          return ApodTextButtonLayout.hovered(
            icon: theme.icons.characters.shoppingCart,
          );
        },
      ),
      'icon-pressed': Builder(
        builder: (context) {
          final theme = ApodTheme.of(context);
          return ApodTextButtonLayout.pressed(
            icon: theme.icons.characters.shoppingCart,
          );
        },
      ),
      'both-inactive': Builder(
        builder: (context) {
          final theme = ApodTheme.of(context);
          return ApodTextButtonLayout.inactive(
            title: 'Buy',
            icon: theme.icons.characters.shoppingCart,
          );
        },
      ),
      'both-hovered': Builder(
        builder: (context) {
          final theme = ApodTheme.of(context);
          return ApodTextButtonLayout.hovered(
            title: 'Buy',
            icon: theme.icons.characters.shoppingCart,
          );
        },
      ),
      'both-pressed': Builder(
        builder: (context) {
          final theme = ApodTheme.of(context);
          return ApodTextButtonLayout.pressed(
            title: 'Buy',
            icon: theme.icons.characters.shoppingCart,
          );
        },
      ),
    },
  );
}
