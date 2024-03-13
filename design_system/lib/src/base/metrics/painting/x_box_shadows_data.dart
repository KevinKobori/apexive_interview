part of x_metrics_data;

class XBoxShadowsData extends Equatable {
  final BoxShadow? _small;
  final BoxShadow? _medium;
  final BoxShadow? _large;

  XBoxShadowsData({
    final Optional<BoxShadow?>? small,
    final Optional<BoxShadow?>? medium,
    final Optional<BoxShadow?>? large,
  })  : _small = small == null
            ? const BoxShadow(
                blurRadius: XAuxiliarySizes.x2,
                spreadRadius: XAuxiliarySizes.x1,
                color: Color(0x44000000),
              )
            : small.value,
        _medium = medium == null
            ? const BoxShadow(
                blurRadius: XStandardSizes.x4,
                spreadRadius: XAuxiliarySizes.x1,
                color: Color(0x44000000),
              )
            : medium.value,
        _large = large == null
            ? const BoxShadow(
                blurRadius: XStandardSizes.x8,
                spreadRadius: XAuxiliarySizes.x2,
                color: Color(0x44000000),
              )
            : large.value;

  BoxShadow get small =>
      _small ??
      (throw UnsupportedError(getUnsupportedErrorMessage(
          attribute: 'small', location: 'boxShadows')));
  BoxShadow get medium =>
      _medium ??
      (throw UnsupportedError(getUnsupportedErrorMessage(
          attribute: 'medium', location: 'boxShadows')));
  BoxShadow get large =>
      _large ??
      (throw UnsupportedError(getUnsupportedErrorMessage(
          attribute: 'large', location: 'boxShadows')));

  @override
  List<Object?> get props => [
        small.named('small'),
        medium.named('medium'),
        large.named('large'),
      ];

  // @override
  // String toString() => '''
  //   XBoxShadowsData(
  //     small: $small,
  //     medium: $medium,
  //     large: $large,
  //   )
  // ''';
}
