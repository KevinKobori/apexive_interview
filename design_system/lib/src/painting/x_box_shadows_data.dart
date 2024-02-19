part of x_metrics_data;

class XBoxShadowsData extends Equatable {
  final BoxShadow small;
  final BoxShadow medium;
  final BoxShadow large;

  const XBoxShadowsData({
    final BoxShadow? small,
    final BoxShadow? medium,
    final BoxShadow? large,
  })  : small = small ??
            const BoxShadow(
              blurRadius: XAuxiliarySizes.x2,
              spreadRadius: XAuxiliarySizes.x1,
              color: Color(0x44000000),
            ),
        medium = medium ??
            const BoxShadow(
              blurRadius: XStandardSizes.x4,
              spreadRadius: XAuxiliarySizes.x1,
              color: Color(0x44000000),
            ),
        large = large ??
            const BoxShadow(
              blurRadius: XStandardSizes.x8,
              spreadRadius: XAuxiliarySizes.x2,
              color: Color(0x44000000),
            );

  @override
  List<Object?> get props => [
        small.named('small'),
        medium.named('medium'),
        large.named('large'),
      ];
}
