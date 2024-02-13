import 'package:flutter/widgets.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';
import 'package:tap_builder/tap_builder.dart';

class ApodActionButton extends StatelessWidget {
  const ApodActionButton({
    required this.icon,
    super.key,
    this.onTap,
  });

  final String icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TapBuilder(
      onTap: onTap,
      builder: (context, state, hasFocus) {
        switch (state) {
          case TapState.hover:
            return ApodActionButtonLayout.hovered(icon: icon);
          case TapState.pressed:
            return ApodActionButtonLayout.pressed(icon: icon);
          default:
            return ApodActionButtonLayout.inactive(icon: icon);
        }
      },
    );
  }
}

class ApodActionButtonLayout extends StatelessWidget {
  const ApodActionButtonLayout.inactive({
    required this.icon,
    super.key,
  }) : _state = ApodTextButtonState.inactive;

  const ApodActionButtonLayout.hovered({
    required this.icon,
    super.key,
  }) : _state = ApodTextButtonState.hovered;

  const ApodActionButtonLayout.pressed({
    required this.icon,
    super.key,
  }) : _state = ApodTextButtonState.pressed;

  final String icon;
  final ApodTextButtonState _state;

  @override
  Widget build(BuildContext context) {
    final theme = ApodTheme.of(context);
    switch (_state) {
      case ApodTextButtonState.hovered:
        return ApodTextButtonLayout.hovered(
          icon: icon,
          hoveredBackgroundColor: theme.colors.accentOpposite.withOpacity(0.15),
        );
      case ApodTextButtonState.pressed:
        return ApodTextButtonLayout.pressed(
          icon: icon,
          pressedBackgroundColor: theme.colors.accentOpposite.withOpacity(0.20),
        );
      case ApodTextButtonState.inactive:
        return ApodTextButtonLayout.inactive(
          icon: icon,
          inactiveBackgroundColor: theme.colors.accentOpposite.withOpacity(0),
        );
    }
  }
}
