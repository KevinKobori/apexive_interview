import 'package:flutter/material.dart';
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
          final theme = Theme.of(context).extension<ApodThemeData>()!;
          return ApodTextButtonLayout.inactive(
            icon:
                (theme.icons.characters as ApodIconCharactersData).shoppingCart,
          );
        },
      ),
      'icon-hovered': Builder(
        builder: (context) {
          final theme = Theme.of(context).extension<ApodThemeData>()!;
          return ApodTextButtonLayout.hovered(
            icon:
                (theme.icons.characters as ApodIconCharactersData).shoppingCart,
          );
        },
      ),
      'icon-pressed': Builder(
        builder: (context) {
          final theme = Theme.of(context).extension<ApodThemeData>()!;
          return ApodTextButtonLayout.pressed(
            icon:
                (theme.icons.characters as ApodIconCharactersData).shoppingCart,
          );
        },
      ),
      'both-inactive': Builder(
        builder: (context) {
          final theme = Theme.of(context).extension<ApodThemeData>()!;
          return ApodTextButtonLayout.inactive(
            title: 'Buy',
            icon:
                (theme.icons.characters as ApodIconCharactersData).shoppingCart,
          );
        },
      ),
      'both-hovered': Builder(
        builder: (context) {
          final theme = Theme.of(context).extension<ApodThemeData>()!;
          return ApodTextButtonLayout.hovered(
            title: 'Buy',
            icon:
                (theme.icons.characters as ApodIconCharactersData).shoppingCart,
          );
        },
      ),
      'both-pressed': Builder(
        builder: (context) {
          final theme = Theme.of(context).extension<ApodThemeData>()!;
          return ApodTextButtonLayout.pressed(
            title: 'Buy',
            icon:
                (theme.icons.characters as ApodIconCharactersData).shoppingCart,
          );
        },
      ),
    },
  );
}
