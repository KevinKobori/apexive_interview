import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';
import 'package:nasa_apod_design_system/src/helpers/named.dart';

class AppRadiusData extends Equatable {
  const AppRadiusData({
    required this.extraSmall,
    required this.small,
    required this.regular,
    required this.big,
    required this.superLarge,
  });

  const AppRadiusData.regular()
      : extraSmall = const Radius.circular(5),
        small = const Radius.circular(10),
        regular = const Radius.circular(12),
        big = const Radius.circular(16),
        superLarge = const Radius.circular(24);

  final Radius extraSmall;
  final Radius small;
  final Radius regular;
  final Radius big;
  final Radius superLarge;

  AppBorderRadiusData asBorderRadius() => AppBorderRadiusData(this);

  @override
  List<Object?> get props => [
        extraSmall.named('extraSmall'),
        small.named('small'),
        regular.named('regular'),
        big.named('big'),
        superLarge.named('superLarge'),
      ];
}

class AppBorderRadiusData extends Equatable {
  const AppBorderRadiusData(this._radius);

  BorderRadius get extraSmall => BorderRadius.all(_radius.extraSmall);
  BorderRadius get small => BorderRadius.all(_radius.small);
  BorderRadius get regular => BorderRadius.all(_radius.regular);
  BorderRadius get big => BorderRadius.all(_radius.big);
  BorderRadius get superLarge => BorderRadius.all(_radius.superLarge);

  final AppRadiusData _radius;

  @override
  List<Object?> get props => [_radius];
}
