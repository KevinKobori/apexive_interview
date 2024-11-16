// ignore_for_file: library_private_types_in_public_api

part of x_metrics_data;

class XRadiusData extends Equatable {
  final Radius? _extraSmall;
  final Radius? _small;
  final Radius? _semiSmall;
  final Radius? _medium;
  final Radius? _semiLarge;
  final Radius? _large;
  final Radius? _extraLarge;
  final Radius? _superLarge;

  XRadiusData({
    final Optional<Radius?>? extraSmall,
    final Optional<Radius?>? small,
    final Optional<Radius?>? semiSmall,
    final Optional<Radius?>? medium,
    final Optional<Radius?>? semiLarge,
    final Optional<Radius?>? large,
    final Optional<Radius?>? extraLarge,
    final Optional<Radius?>? superLarge,
  })  : _extraSmall = extraSmall == null
            ? const Radius.circular(XStandardSizes.x4)
            : extraSmall.value,
        _small = small == null
            ? const Radius.circular(XStandardSizes.x8)
            : small.value,
        _semiSmall = semiSmall == null
            ? const Radius.circular(XStandardSizes.x12)
            : semiSmall.value,
        _medium = medium == null
            ? const Radius.circular(XStandardSizes.x16)
            : medium.value,
        _semiLarge = semiLarge == null
            ? const Radius.circular(XStandardSizes.x20)
            : semiLarge.value,
        _large = large == null
            ? const Radius.circular(XStandardSizes.x24)
            : large.value,
        _extraLarge = extraLarge == null
            ? const Radius.circular(XStandardSizes.x32)
            : extraLarge.value,
        _superLarge = superLarge == null
            ? const Radius.circular(XStandardSizes.x48)
            : superLarge.value;

  Radius get none => Radius.zero;
  Radius get extraSmall =>
      _extraSmall ??
      (throw UnsupportedError(getUnsupportedErrorMessage(
          attribute: 'extraSmall', location: 'radius')));
  Radius get small =>
      _small ??
      (throw UnsupportedError(
          getUnsupportedErrorMessage(attribute: 'small', location: 'radius')));
  Radius get semiSmall =>
      _semiSmall ??
      (throw UnsupportedError(getUnsupportedErrorMessage(
          attribute: 'semiSmall', location: 'radius')));
  Radius get medium =>
      _medium ??
      (throw UnsupportedError(
          getUnsupportedErrorMessage(attribute: 'medium', location: 'radius')));
  Radius get semiLarge =>
      _semiLarge ??
      (throw UnsupportedError(getUnsupportedErrorMessage(
          attribute: 'semiLarge', location: 'radius')));
  Radius get large =>
      _large ??
      (throw UnsupportedError(
          getUnsupportedErrorMessage(attribute: 'large', location: 'radius')));
  Radius get extraLarge =>
      _extraLarge ??
      (throw UnsupportedError(getUnsupportedErrorMessage(
          attribute: 'extraLarge', location: 'radius')));
  Radius get superLarge =>
      _superLarge ??
      (throw UnsupportedError(getUnsupportedErrorMessage(
          attribute: 'superLarge', location: 'radius')));
  _XBorderRadius get border => _XBorderRadius(this);

  @override
  List<Object?> get props => [
        none.named('none'),
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
