import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';
import 'package:nasa_apod_design_system/src/helpers/named.dart';

class ApodSpacingsData extends Equatable {
  const ApodSpacingsData({
    required this.none,
    required this.extraSmall,
    required this.small,
    required this.semiSmall,
    required this.large,
    required this.extraLarge,
    required this.superLarge,
  });

  factory ApodSpacingsData.regular() => const ApodSpacingsData(
        none: 0,
        extraSmall: 4,
        small: 8,
        semiSmall: 12,
        large: 22,
        extraLarge: 32,
        superLarge: 48,
      );

  final double none;
  final double extraSmall;
  final double small;
  final double semiSmall;
  final double large;
  final double extraLarge;
  final double superLarge;

  ApodEdgeInsetsSpacingData asInsets() => ApodEdgeInsetsSpacingData(this);

  @override
  List<Object?> get props => [
        none.named('none'),
        extraSmall.named('extraSmall'),
        small.named('small'),
        semiSmall.named('semiSmall'),
        large.named('large'),
        extraLarge.named('extraLarge'),
        superLarge.named('superLarge'),
      ];
}

class ApodEdgeInsetsSpacingData extends Equatable {
  const ApodEdgeInsetsSpacingData(this._spacing);

  EdgeInsets get none => EdgeInsets.all(_spacing.none);
  EdgeInsets get extraSmall => EdgeInsets.all(_spacing.extraSmall);
  EdgeInsets get small => EdgeInsets.all(_spacing.small);
  EdgeInsets get semiSmall => EdgeInsets.all(_spacing.semiSmall);
  EdgeInsets get large => EdgeInsets.all(_spacing.large);
  EdgeInsets get extraLarge => EdgeInsets.all(_spacing.extraLarge);

  final ApodSpacingsData _spacing;

  @override
  List<Object?> get props => [_spacing];
}

enum ApodSpacings {
  none,
  extraSmall,
  small,
  semiSmall,
  large,
  extraLarge,
  superLarge,
}

extension AppSpacingsExtension on ApodSpacings {
  double getSpacing(ApodThemeData theme) => switch (this) {
        ApodSpacings.none => theme.spacings.none,
        ApodSpacings.extraSmall => theme.spacings.extraSmall,
        ApodSpacings.small => theme.spacings.small,
        ApodSpacings.semiSmall => theme.spacings.semiSmall,
        ApodSpacings.large => theme.spacings.large,
        ApodSpacings.extraLarge => theme.spacings.extraLarge,
        ApodSpacings.superLarge => theme.spacings.superLarge,
      };
}
