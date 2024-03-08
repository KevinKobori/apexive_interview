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
      (throw UnimplementedError(
          'superSmall is not implemented in metrics.spacings'));
  double get extraSmall =>
      _extraSmall ??
      (throw UnimplementedError(
          'extraSmall is not implemented in metrics.spacings'));
  double get small =>
      _small ??
      (throw UnimplementedError(
          'small is not implemented in metrics.spacings'));
  double get semiSmall =>
      _semiSmall ??
      (throw UnimplementedError(
          'semiSmall is not implemented in metrics.spacings'));
  double get medium =>
      _medium ??
      (throw UnimplementedError(
          'medium is not implemented in metrics.spacings'));
  double get semiLarge =>
      _semiLarge ??
      (throw UnimplementedError(
          'semiLarge is not implemented in metrics.spacings'));
  double get large =>
      _large ??
      (throw UnimplementedError(
          'large is not implemented in metrics.spacings'));
  double get extraLarge =>
      _extraLarge ??
      (throw UnimplementedError(
          'extraLarge is not implemented in metrics.spacings'));
  double get superLarge =>
      _superLarge ??
      (throw UnimplementedError(
          'superLarge is not implemented in metrics.spacings'));
  _XGapsData get gaps => _XGapsData(this);
  _XEdgeInsetsData get edgeInsets => _XEdgeInsetsData(this);

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