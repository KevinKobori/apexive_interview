import 'package:equatable/equatable.dart';
import 'package:nasa_apod_design_system/src/helpers/named.dart';

class ApodDurationsData extends Equatable {
  const ApodDurationsData({
    required this.areAnimationEnabled,
    required this.regular,
    required this.quick,
  });

  factory ApodDurationsData.regular() => const ApodDurationsData(
        areAnimationEnabled: true,
        regular: Duration(milliseconds: 250),
        quick: Duration(milliseconds: 100),
      );

  final bool areAnimationEnabled;
  final Duration regular;
  final Duration quick;

  @override
  List<Object?> get props => [
        areAnimationEnabled,
        regular.named('regular'),
        quick.named('quick'),
      ];
}
