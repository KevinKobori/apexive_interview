// ignore_for_file: must_be_immutable, library_private_types_in_public_api
part of x_metrics_data;

/// LAYER: GEOMETRY
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
      (throw UnimplementedError(
          'extraSmall is not implemented in metrics.radius'));
  Radius get small =>
      _small ??
      (throw UnimplementedError('small is not implemented in metrics.radius'));
  Radius get semiSmall =>
      _semiSmall ??
      (throw UnimplementedError(
          'semiSmall is not implemented in metrics.radius'));
  Radius get medium =>
      _medium ??
      (throw UnimplementedError('medium is not implemented in metrics.radius'));
  Radius get semiLarge =>
      _semiLarge ??
      (throw UnimplementedError(
          'semiLarge is not implemented in metrics.radius'));
  Radius get large =>
      _large ??
      (throw UnimplementedError('large is not implemented in metrics.radius'));
  Radius get extraLarge =>
      _extraLarge ??
      (throw UnimplementedError(
          'extraLarge is not implemented in metrics.radius'));
  Radius get superLarge =>
      _superLarge ??
      (throw UnimplementedError(
          'superLarge is not implemented in metrics.radius'));
  _XBorderRadiusData get border => _XBorderRadiusData(this);

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

/// LAYER: PAINTING
class _XBorderRadiusData extends Equatable {
  final XRadiusData _radius;

  const _XBorderRadiusData(
    this._radius,
  );

  BorderRadius get none => BorderRadius.all(_radius.none);
  BorderRadius get extraSmall => BorderRadius.all(_radius.extraSmall);
  BorderRadius get small => BorderRadius.all(_radius.small);
  BorderRadius get semiSmall => BorderRadius.all(_radius.semiSmall);
  BorderRadius get medium => BorderRadius.all(_radius.medium);
  BorderRadius get semiLarge => BorderRadius.all(_radius.semiLarge);
  BorderRadius get large => BorderRadius.all(_radius.large);
  BorderRadius get extraLarge => BorderRadius.all(_radius.extraLarge);
  BorderRadius get superLarge => BorderRadius.all(_radius.superLarge);

  _XShapesData get shape => _XShapesData(this);

  @override
  List<Object?> get props => [
        _radius,
      ];
}

/// LAYER: PAINTING
class _XShapesData {
  final _XBorderRadiusData _borderRadius;

  const _XShapesData(this._borderRadius);

  RoundedRectangleBorder get none =>
      RoundedRectangleBorder(borderRadius: _borderRadius.none);
  RoundedRectangleBorder get extraSmall =>
      RoundedRectangleBorder(borderRadius: _borderRadius.extraSmall);
  RoundedRectangleBorder get small =>
      RoundedRectangleBorder(borderRadius: _borderRadius.small);
  RoundedRectangleBorder get semiSmall =>
      RoundedRectangleBorder(borderRadius: _borderRadius.semiSmall);
  RoundedRectangleBorder get medium =>
      RoundedRectangleBorder(borderRadius: _borderRadius.medium);
  RoundedRectangleBorder get semiLarge =>
      RoundedRectangleBorder(borderRadius: _borderRadius.semiLarge);
  RoundedRectangleBorder get large =>
      RoundedRectangleBorder(borderRadius: _borderRadius.large);
  RoundedRectangleBorder get extraLarge =>
      RoundedRectangleBorder(borderRadius: _borderRadius.extraLarge);
  RoundedRectangleBorder get superLarge =>
      RoundedRectangleBorder(borderRadius: _borderRadius.superLarge);
}
