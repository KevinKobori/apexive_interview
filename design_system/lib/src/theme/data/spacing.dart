import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:nasa_apod_design_system/src/helpers/named.dart';

class AppSpacingData extends Equatable {
  const AppSpacingData({
    required this.extraSmall,
    required this.small,
    required this.semiSmall,
    required this.large,
    required this.extraLarge,
    required this.superLarge,
  });

  factory AppSpacingData.regular() => const AppSpacingData(
        extraSmall: 4,
        small: 8,
        semiSmall: 12,
        large: 22,
        extraLarge: 32,
        superLarge: 48,
      );

  final double extraSmall;
  final double small;
  final double semiSmall;
  final double large;
  final double extraLarge;
  final double superLarge;

  AppEdgeInsetsSpacingData asInsets() => AppEdgeInsetsSpacingData(this);

  @override
  List<Object?> get props => [
        extraSmall.named('extraSmall'),
        small.named('small'),
        semiSmall.named('semiSmall'),
        large.named('large'),
        extraLarge.named('extraLarge'),
      ];
}

class AppEdgeInsetsSpacingData extends Equatable {
  const AppEdgeInsetsSpacingData(this._spacing);

  EdgeInsets get extraSmall => EdgeInsets.all(_spacing.extraSmall);
  EdgeInsets get small => EdgeInsets.all(_spacing.small);
  EdgeInsets get semiSmall => EdgeInsets.all(_spacing.semiSmall);
  EdgeInsets get large => EdgeInsets.all(_spacing.large);
  EdgeInsets get extraLarge => EdgeInsets.all(_spacing.extraLarge);

  final AppSpacingData _spacing;

  @override
  List<Object?> get props => [_spacing];
}
