import 'package:flutter/widgets.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

enum ApodIconSize {
  small,
  regular,
  big,
}

extension ApodIconSizeExtension on ApodIconSizesData {
  double resolve(ApodIconSize size) {
    switch (size) {
      case ApodIconSize.small:
        return small;
      case ApodIconSize.regular:
        return regular;
      case ApodIconSize.big:
        return big;
    }
  }
}

class ApodIcon extends StatelessWidget {
  const ApodIcon(
    this.data, {
    super.key,
    this.color,
    this.size = ApodIconSize.regular,
  });

  const ApodIcon.small(
    this.data, {
    super.key,
    this.color,
  }) : size = ApodIconSize.small;

  const ApodIcon.regular(
    this.data, {
    super.key,
    this.color,
  }) : size = ApodIconSize.regular;

  const ApodIcon.big(
    this.data, {
    super.key,
    this.color,
  }) : size = ApodIconSize.big;

  final String data;
  final Color? color;
  final ApodIconSize size;

  @override
  Widget build(BuildContext context) {
    final theme = ApodTheme.of(context);
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

class ApodAnimatedIcon extends StatelessWidget {
  const ApodAnimatedIcon(
    this.data, {
    super.key,
    this.color,
    this.size = ApodIconSize.small,
    this.duration = const Duration(milliseconds: 200),
  });

  final String data;
  final Color? color;
  final ApodIconSize size;
  final Duration duration;

  bool get isAnimated => duration.inMilliseconds > 0;

  @override
  Widget build(BuildContext context) {
    final theme = ApodTheme.of(context);
    final color = this.color ?? theme.colors.foreground;
    if (!isAnimated) {
      return ApodIcon(
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
