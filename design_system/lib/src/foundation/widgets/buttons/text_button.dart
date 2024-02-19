import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';
import 'package:tap_builder/tap_builder.dart';

class ApodTextButton extends StatelessWidget {
  const ApodTextButton({
    super.key,
    this.icon,
    this.title,
    this.onTap,
    this.mainAxisSize = MainAxisSize.min,
  }) : assert(icon != null || title != null);

  final String? icon;
  final String? title;
  final MainAxisSize mainAxisSize;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TapBuilder(
      onTap: onTap,
      builder: (context, state, hasFocus) {
        switch (state) {
          case TapState.hover:
            return Semantics(
              enabled: true,
              selected: true,
              child: ApodTextButtonLayout.hovered(
                icon: icon,
                title: title,
                mainAxisSize: mainAxisSize,
              ),
            );
          case TapState.pressed:
            return Semantics(
              enabled: true,
              selected: true,
              child: ApodTextButtonLayout.pressed(
                icon: icon,
                title: title,
                mainAxisSize: mainAxisSize,
              ),
            );
          default:
            return Semantics(
              enabled: true,
              selected: true,
              child: ApodTextButtonLayout.inactive(
                icon: icon,
                title: title,
                mainAxisSize: mainAxisSize,
              ),
            );
        }
      },
    );
  }
}

enum ApodTextButtonState {
  inactive,
  hovered,
  pressed,
}

class ApodTextButtonLayout extends StatelessWidget {
  const ApodTextButtonLayout.inactive({
    super.key,
    this.icon,
    this.title,
    this.mainAxisSize = MainAxisSize.min,
    this.inactiveBackgroundColor,
    this.hoveredBackgroundColor,
    this.pressedBackgroundColor,
    this.foregroundColor,
  })  : _state = ApodTextButtonState.inactive,
        assert(icon != null || title != null);

  const ApodTextButtonLayout.hovered({
    super.key,
    this.icon,
    this.title,
    this.mainAxisSize = MainAxisSize.min,
    this.inactiveBackgroundColor,
    this.hoveredBackgroundColor,
    this.pressedBackgroundColor,
    this.foregroundColor,
  })  : _state = ApodTextButtonState.hovered,
        assert(icon != null || title != null);

  const ApodTextButtonLayout.pressed({
    super.key,
    this.icon,
    this.title,
    this.mainAxisSize = MainAxisSize.min,
    this.inactiveBackgroundColor,
    this.hoveredBackgroundColor,
    this.pressedBackgroundColor,
    this.foregroundColor,
  })  : _state = ApodTextButtonState.pressed,
        assert(icon != null || title != null);

  final String? icon;
  final String? title;
  final MainAxisSize mainAxisSize;
  final ApodTextButtonState _state;
  final Color? inactiveBackgroundColor;
  final Color? hoveredBackgroundColor;
  final Color? pressedBackgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ApodThemeData>()!;
    final colors = Theme.of(context).colorScheme;
    final title = this.title;
    final icon = this.icon;
    final hasBoth = title != null && icon != null;
    final foregroundColor = this.foregroundColor ?? colors.onPrimary;
    final backgroundColor = () {
      switch (_state) {
        case ApodTextButtonState.inactive:
          return inactiveBackgroundColor ?? colors.primary;
        case ApodTextButtonState.hovered:
          return hoveredBackgroundColor ?? colors.secondary;
        case ApodTextButtonState.pressed:
          return pressedBackgroundColor ?? colors.tertiary;
      }
    }();
    return AnimatedContainer(
      duration: theme.durations.quick,
      decoration: BoxDecoration(
        borderRadius: theme.radius.xBorder.small,
        color: backgroundColor,
      ),
      padding: EdgeInsets.symmetric(
        vertical: theme.spacings.small,
        horizontal: title != null ? theme.spacings.large : theme.spacings.small,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null)
            ApodText.title3(
              title,
              color: foregroundColor,
            ),
          if (hasBoth) const ApodGap.semiSmall(),
          if (icon != null) ApodIcon.regular(icon, color: foregroundColor),
        ],
      ),
    );
  }
}
