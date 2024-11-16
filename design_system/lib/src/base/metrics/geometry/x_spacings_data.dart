// ignore_for_file: must_be_immutable, library_private_types_in_public_api

part of x_metrics_data;

class XSpacingsData extends Equatable {
  final double? _superSmall;
  final double? _extraSmall;
  final double? _small;
  final double? _semiSmall;
  final double? _medium;
  final double? _semiLarge;
  final double? _large;
  final double? _extraLarge;
  final double? _superLarge;

  XSpacingsData({
    final Optional<double?>? superSmall,
    final Optional<double?>? extraSmall,
    final Optional<double?>? small,
    final Optional<double?>? semiSmall,
    final Optional<double?>? medium,
    final Optional<double?>? semiLarge,
    final Optional<double?>? large,
    final Optional<double?>? extraLarge,
    final Optional<double?>? superLarge,
  })  : _superSmall =
            superSmall == null ? XAuxiliarySizes.x2 : superSmall.value,
        _extraSmall = extraSmall == null ? XStandardSizes.x4 : extraSmall.value,
        _small = small == null ? XStandardSizes.x8 : small.value,
        _semiSmall = semiSmall == null ? XStandardSizes.x12 : semiSmall.value,
        _medium = medium == null ? XStandardSizes.x16 : medium.value,
        _semiLarge = semiLarge == null ? XStandardSizes.x20 : semiLarge.value,
        _large = large == null ? XStandardSizes.x24 : large.value,
        _extraLarge =
            extraLarge == null ? XStandardSizes.x32 : extraLarge.value,
        _superLarge =
            superLarge == null ? XStandardSizes.x48 : superLarge.value;

  double get none => XStandardSizes.zero;
  double get superSmall =>
      _superSmall ??
      (throw UnsupportedError(getUnsupportedErrorMessage(
          attribute: 'superSmall', location: 'spacings')));
  double get extraSmall =>
      _extraSmall ??
      (throw UnsupportedError(getUnsupportedErrorMessage(
          attribute: 'extraSmall', location: 'spacings')));
  double get small =>
      _small ??
      (throw UnsupportedError(getUnsupportedErrorMessage(
          attribute: 'small', location: 'spacings')));
  double get semiSmall =>
      _semiSmall ??
      (throw UnsupportedError(getUnsupportedErrorMessage(
          attribute: 'semiSmall', location: 'spacings')));
  double get medium =>
      _medium ??
      (throw UnsupportedError(getUnsupportedErrorMessage(
          attribute: 'medium', location: 'spacings')));
  double get semiLarge =>
      _semiLarge ??
      (throw UnsupportedError(getUnsupportedErrorMessage(
          attribute: 'semiLarge', location: 'spacings')));
  double get large =>
      _large ??
      (throw UnsupportedError(getUnsupportedErrorMessage(
          attribute: 'large', location: 'spacings')));
  double get extraLarge =>
      _extraLarge ??
      (throw UnsupportedError(getUnsupportedErrorMessage(
          attribute: 'extraLarge', location: 'spacings')));
  double get superLarge =>
      _superLarge ??
      (throw UnsupportedError(getUnsupportedErrorMessage(
          attribute: 'superLarge', location: 'spacings')));
  _XGaps get gaps => _XGaps(this);
  _XEdgeInsets get edgeInsets => _XEdgeInsets(this);

  @override
  List<Object?> get props => [
        none.named('none'),
        superSmall.named('superSmall'),
        extraSmall.named('extraSmall'),
        small.named('small'),
        semiSmall.named('semiSmall'),
        medium.named('medium'),
        semiLarge.named('semiLarge'),
        large.named('large'),
        extraLarge.named('extraLarge'),
        superLarge.named('superLarge'),
        gaps.named('gaps'),
        edgeInsets.named('edgeInsets'),
      ];
}
