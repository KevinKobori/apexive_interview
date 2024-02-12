import 'package:flutter/widgets.dart';
import 'package:nasa_apod_design_system/src/theme/theme.dart';

enum AppIconSize {
  small,
  regular,
  big,
}

extension AppIconSizeExtension on AppIconSizesData {
  double resolve(AppIconSize size) {
    switch (size) {
      case AppIconSize.small:
        return small;
      case AppIconSize.regular:
        return regular;
      case AppIconSize.big:
        return big;
    }
  }
}

class AppIcon extends StatelessWidget {
  const AppIcon(
    this.data, {
    super.key,
    this.color,
    this.size = AppIconSize.regular,
  });

  const AppIcon.small(
    this.data, {
    super.key,
    this.color,
  }) : size = AppIconSize.small;

  const AppIcon.regular(
    this.data, {
    super.key,
    this.color,
  }) : size = AppIconSize.regular;

  const AppIcon.big(
    this.data, {
    super.key,
    this.color,
  }) : size = AppIconSize.big;

  final String data;
  final Color? color;
  final AppIconSize size;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final color = this.color ?? theme.colors.foreground;
    return Text(
      data,
      style: TextStyle(
        fontFamily: theme.icons.fontFamily,
        package: theme.icons.fontPackage,
        color: color,
        fontSize: theme.icons.sizes.resolve(size),
        decoration: TextDecoration.none,
      ),
    );
  }
}

class AppAnimatedIcon extends StatelessWidget {
  const AppAnimatedIcon(
    this.data, {
    super.key,
    this.color,
    this.size = AppIconSize.small,
    this.duration = const Duration(milliseconds: 200),
  });

  final String data;
  final Color? color;
  final AppIconSize size;
  final Duration duration;

  bool get isAnimated => duration.inMilliseconds > 0;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final color = this.color ?? theme.colors.foreground;
    if (!isAnimated) {
      return AppIcon(
        data,
        key: key,
        color: color,
        size: size,
      );
    }
    return AnimatedDefaultTextStyle(
      style: TextStyle(
        fontFamily: theme.icons.fontFamily,
        package: theme.icons.fontPackage,
        color: color,
        fontSize: theme.icons.sizes.resolve(size),
        decoration: TextDecoration.none,
      ),
      duration: duration,
      child: Text(data),
    );
  }
}
