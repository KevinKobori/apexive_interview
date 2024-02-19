import 'package:equatable/equatable.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class XIconSizesData extends Equatable {
  final double extraSmall;
  final double small;
  final double semiSmall;
  final double medium;
  final double semiLarge;
  final double large;
  final double extraLarge;
  final double superLarge;

  const XIconSizesData({
    final double? extraSmall,
    final double? small,
    final double? semiSmall,
    final double? medium,
    final double? semiLarge,
    final double? large,
    final double? extraLarge,
    final double? superLarge,
  })  : extraSmall = extraSmall ?? XStandardSizes.x16,
        small = small ?? XAuxiliarySizes.x18,
        semiSmall = semiSmall ?? XStandardSizes.x20,
        medium = medium ?? XStandardSizes.x24,
        semiLarge = semiLarge ?? XStandardSizes.x32,
        large = large ?? XStandardSizes.x48,
        extraLarge = extraLarge ?? XStandardSizes.x96,
        superLarge = superLarge ?? XStandardSizes.x192;

  @override
  List<Object?> get props => [
        extraSmall.named('extraSmall'),
        small.named('small'),
        semiSmall.named('semiSmall'),
        medium.named('medium'),
        semiLarge.named('semiLarge'),
        large.named('large'),
        extraLarge.named('extraLarge'),
        superLarge.named('superLarge'),
      ];
}

enum XIconSize {
  extraSmall,
  small,
  semiSmall,
  medium,
  semiLarge,
  large,
  extraLarge,
  superLarge,
}

extension XIconSizesExtension on XIconSize {
  double toDouble(XIconSizesData xIconSizes) => switch (this) {
        XIconSize.extraSmall => xIconSizes.extraSmall,
        XIconSize.small => xIconSizes.small,
        XIconSize.semiSmall => xIconSizes.semiSmall,
        XIconSize.medium => xIconSizes.medium,
        XIconSize.semiLarge => xIconSizes.semiLarge,
        XIconSize.large => xIconSizes.large,
        XIconSize.extraLarge => xIconSizes.extraLarge,
        XIconSize.superLarge => xIconSizes.superLarge,
      };
}
