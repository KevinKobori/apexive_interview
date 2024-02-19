import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

enum ApodIconSize {
  extraSmall,
  medium,
  semiLarge,
}

extension ApodIconSizeExtension on ApodIconSizesData {
  double resolve(ApodIconSize size) {
    switch (size) {
      case ApodIconSize.extraSmall:
        return extraSmall;
      case ApodIconSize.medium:
        return medium;
      case ApodIconSize.semiLarge:
        return semiLarge;
    }
  }
}

class ApodIcon extends StatelessWidget {
  const ApodIcon(
    this.data, {
    super.key,
    this.color,
    this.size = ApodIconSize.medium,
  });

  const ApodIcon.small(
    this.data, {
    super.key,
    this.color,
  }) : size = ApodIconSize.extraSmall;

  const ApodIcon.regular(
    this.data, {
    super.key,
    this.color,
  }) : size = ApodIconSize.medium;

  const ApodIcon.big(
    this.data, {
    super.key,
    this.color,
  }) : size = ApodIconSize.semiLarge;

  final String data;
  final Color? color;
  final ApodIconSize size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ApodThemeData>()!;
    final colors = Theme.of(context).colorScheme;

    final color = this.color ?? colors.onBackground;
    return Text(
      data,
      style: TextStyle(
        fontFamily: theme.icons.fontFamily,
        package: theme.icons.fontPackage,
        color: color,
        fontSize: (theme.icons.sizes as ApodIconSizesData).resolve(size),
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
    this.size = ApodIconSize.extraSmall,
    this.duration = const Duration(milliseconds: 200),
  });

  final String data;
  final Color? color;
  final ApodIconSize size;
  final Duration duration;

  bool get isAnimated => duration.inMilliseconds > 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ApodThemeData>()!;
    final colors = Theme.of(context).colorScheme;
    final color = this.color ?? colors.onBackground;
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
        fontSize: (theme.icons.sizes as ApodIconSizesData).resolve(size),
        decoration: TextDecoration.none,
      ),
      duration: duration,
      child: Text(data),
    );
  }
}
