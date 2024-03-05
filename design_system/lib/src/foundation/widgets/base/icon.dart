import 'package:flutter/material.dart';
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
    final assets = Theme.of(context).extension<ApodAssetsData>()!;
    final colorScheme = Theme.of(context).colorScheme;
    final color = this.color ?? colorScheme.onBackground;

    return Text(
      data,
      style: TextStyle(
        fontFamily: assets.icons.fontFamily,
        package: assets.icons.fontPackage,
        color: color,
        fontSize: (assets.icons.sizes as ApodIconSizesData).resolve(size),
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
    final assets = Theme.of(context).extension<ApodAssetsData>()!;
    final colorScheme = Theme.of(context).colorScheme;
    final color = this.color ?? colorScheme.onBackground;

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
        fontFamily: assets.icons.fontFamily,
        package: assets.icons.fontPackage,
        color: color,
        fontSize: (assets.icons.sizes as ApodIconSizesData).resolve(size),
        decoration: TextDecoration.none,
      ),
      duration: duration,
      child: Text(data),
    );
  }
}
