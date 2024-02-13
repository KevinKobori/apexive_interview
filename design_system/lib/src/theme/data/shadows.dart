import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';
import 'package:nasa_apod_design_system/src/helpers/named.dart';

class ApodShadowsData extends Equatable {
  const ApodShadowsData({required this.big});

  factory ApodShadowsData.regular() => const ApodShadowsData(
        big: BoxShadow(
          blurRadius: 32,
          color: Color(0x44000000),
        ),
      );

  final BoxShadow big;

  @override
  List<Object?> get props => [
        big.named('big'),
      ];
}
