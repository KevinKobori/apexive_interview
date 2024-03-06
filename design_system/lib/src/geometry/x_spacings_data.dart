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

class _XGapsData extends Equatable {
  final XSpacingsData _spacings;

  const _XGapsData(
    this._spacings,
  );

  Gap get none => Gap(_spacings.none);
  Gap get superSmall => Gap(_spacings.superSmall);
  Gap get extraSmall => Gap(_spacings.extraSmall);
  Gap get small => Gap(_spacings.small);
  Gap get semiSmall => Gap(_spacings.semiSmall);
  Gap get medium => Gap(_spacings.medium);
  Gap get semiLarge => Gap(_spacings.semiLarge);
  Gap get large => Gap(_spacings.large);
  Gap get extraLarge => Gap(_spacings.extraLarge);
  Gap get superLarge => Gap(_spacings.superLarge);

  @override
  List<Object?> get props => [
        _spacings,
      ];
}

class _XEdgeInsetsData extends Equatable {
  final XSpacingsData _spacings;

  const _XEdgeInsetsData(
    this._spacings,
  );

  EdgeInsets get allNone => EdgeInsets.all(_spacings.none);
  EdgeInsets get allSuperSmall => EdgeInsets.all(_spacings.superSmall);
  EdgeInsets get allExtraSmall => EdgeInsets.all(_spacings.extraSmall);
  EdgeInsets get allSmall => EdgeInsets.all(_spacings.small);
  EdgeInsets get allSemiSmall => EdgeInsets.all(_spacings.semiSmall);
  EdgeInsets get allMedium => EdgeInsets.all(_spacings.medium);
  EdgeInsets get allSemiLarge => EdgeInsets.all(_spacings.semiLarge);
  EdgeInsets get allLarge => EdgeInsets.all(_spacings.large);
  EdgeInsets get allExtraLarge => EdgeInsets.all(_spacings.extraLarge);
  EdgeInsets get allSuperLarge => EdgeInsets.all(_spacings.superLarge);

  EdgeInsets get verticalNone => EdgeInsets.symmetric(vertical: _spacings.none);
  EdgeInsets get verticalSuperSmall =>
      EdgeInsets.symmetric(vertical: _spacings.superSmall);
  EdgeInsets get verticalExtraSmall =>
      EdgeInsets.symmetric(vertical: _spacings.extraSmall);
  EdgeInsets get verticalSmall =>
      EdgeInsets.symmetric(vertical: _spacings.small);
  EdgeInsets get verticalSemiSmall =>
      EdgeInsets.symmetric(vertical: _spacings.semiSmall);
  EdgeInsets get verticalMedium =>
      EdgeInsets.symmetric(vertical: _spacings.medium);
  EdgeInsets get verticalSemiLarge =>
      EdgeInsets.symmetric(vertical: _spacings.semiLarge);
  EdgeInsets get verticalLarge =>
      EdgeInsets.symmetric(vertical: _spacings.large);
  EdgeInsets get verticalExtraLarge =>
      EdgeInsets.symmetric(vertical: _spacings.extraLarge);
  EdgeInsets get verticalSuperLarge =>
      EdgeInsets.symmetric(vertical: _spacings.superLarge);

  EdgeInsets get horizontalNone =>
      EdgeInsets.symmetric(horizontal: _spacings.none);
  EdgeInsets get horizontalSuperSmall =>
      EdgeInsets.symmetric(horizontal: _spacings.superSmall);
  EdgeInsets get horizontalExtraSmall =>
      EdgeInsets.symmetric(horizontal: _spacings.extraSmall);
  EdgeInsets get horizontalSmall =>
      EdgeInsets.symmetric(horizontal: _spacings.small);
  EdgeInsets get horizontalSemiSmall =>
      EdgeInsets.symmetric(horizontal: _spacings.semiSmall);
  EdgeInsets get horizontalMedium =>
      EdgeInsets.symmetric(horizontal: _spacings.medium);
  EdgeInsets get horizontalSemiLarge =>
      EdgeInsets.symmetric(horizontal: _spacings.semiLarge);
  EdgeInsets get horizontalLarge =>
      EdgeInsets.symmetric(horizontal: _spacings.large);
  EdgeInsets get horizontalExtraLarge =>
      EdgeInsets.symmetric(horizontal: _spacings.extraLarge);
  EdgeInsets get horizontalSuperLarge =>
      EdgeInsets.symmetric(horizontal: _spacings.superLarge);

  EdgeInsets only({
    final XSpacing? left,
    final XSpacing? top,
    final XSpacing? right,
    final XSpacing? bottom,
  }) =>
      EdgeInsets.only(
        left: (left ?? XSpacing.none).toDouble(_spacings),
        top: (top ?? XSpacing.none).toDouble(_spacings),
        right: (right ?? XSpacing.none).toDouble(_spacings),
        bottom: (bottom ?? XSpacing.none).toDouble(_spacings),
      );

  _XPaddingsData get paddings => _XPaddingsData(this);

  @override
  List<Object?> get props => [
        _spacings,
      ];
}

class _XPaddingsData extends Equatable {
  final _XEdgeInsetsData _edgeInsets;

  const _XPaddingsData(
    this._edgeInsets,
  );

  Padding allNone({Widget? child}) => Padding(padding: _edgeInsets.allNone);
  Padding allSuperSmall({Widget? child}) =>
      Padding(padding: _edgeInsets.allSuperSmall, child: child);
  Padding allExtraSmall({Widget? child}) =>
      Padding(padding: _edgeInsets.allExtraSmall, child: child);
  Padding allSmall({Widget? child}) =>
      Padding(padding: _edgeInsets.allSmall, child: child);
  Padding allSemiSmall({Widget? child}) =>
      Padding(padding: _edgeInsets.allSemiSmall, child: child);
  Padding allMedium({Widget? child}) =>
      Padding(padding: _edgeInsets.allMedium, child: child);
  Padding allSemiLarge({Widget? child}) =>
      Padding(padding: _edgeInsets.allSemiLarge, child: child);
  Padding allLarge({Widget? child}) =>
      Padding(padding: _edgeInsets.allLarge, child: child);
  Padding allExtraLarge({Widget? child}) =>
      Padding(padding: _edgeInsets.allExtraLarge, child: child);
  Padding allSuperLarge({Widget? child}) =>
      Padding(padding: _edgeInsets.allSuperLarge, child: child);

  Padding verticalNone({Widget? child}) =>
      Padding(padding: _edgeInsets.verticalNone, child: child);
  Padding verticalSuperSmall({Widget? child}) =>
      Padding(padding: _edgeInsets.verticalSuperSmall, child: child);
  Padding verticalExtraSmall({Widget? child}) =>
      Padding(padding: _edgeInsets.verticalExtraSmall, child: child);
  Padding verticalSmall({Widget? child}) =>
      Padding(padding: _edgeInsets.verticalSmall, child: child);
  Padding verticalSemiSmall({Widget? child}) =>
      Padding(padding: _edgeInsets.verticalSemiSmall, child: child);
  Padding verticalMedium({Widget? child}) =>
      Padding(padding: _edgeInsets.verticalMedium, child: child);
  Padding verticalSemiLarge({Widget? child}) =>
      Padding(padding: _edgeInsets.verticalSemiLarge, child: child);
  Padding verticalLarge({Widget? child}) =>
      Padding(padding: _edgeInsets.verticalLarge, child: child);
  Padding verticalExtraLarge({Widget? child}) =>
      Padding(padding: _edgeInsets.verticalExtraLarge, child: child);
  Padding verticalSuperLarge({Widget? child}) =>
      Padding(padding: _edgeInsets.verticalSuperLarge, child: child);

  Padding horizontalNone({Widget? child}) =>
      Padding(padding: _edgeInsets.horizontalNone, child: child);
  Padding horizontalSuperSmall({Widget? child}) =>
      Padding(padding: _edgeInsets.horizontalSuperSmall, child: child);
  Padding horizontalExtraSmall({Widget? child}) =>
      Padding(padding: _edgeInsets.horizontalExtraSmall, child: child);
  Padding horizontalSmall({Widget? child}) =>
      Padding(padding: _edgeInsets.horizontalSmall, child: child);
  Padding horizontalSemiSmall({Widget? child}) =>
      Padding(padding: _edgeInsets.horizontalSemiSmall, child: child);
  Padding horizontalMedium({Widget? child}) =>
      Padding(padding: _edgeInsets.horizontalMedium, child: child);
  Padding horizontalSemiLarge({Widget? child}) =>
      Padding(padding: _edgeInsets.horizontalSemiLarge, child: child);
  Padding horizontalLarge({Widget? child}) =>
      Padding(padding: _edgeInsets.horizontalLarge, child: child);
  Padding horizontalExtraLarge({Widget? child}) =>
      Padding(padding: _edgeInsets.horizontalExtraLarge, child: child);
  Padding horizontalSuperLarge({Widget? child}) =>
      Padding(padding: _edgeInsets.horizontalSuperLarge, child: child);

  @override
  List<Object?> get props => [
        _edgeInsets,
      ];
}

enum XSpacing {
  none,
  superSmall,
  extraSmall,
  small,
  semiSmall,
  medium,
  semiLarge,
  large,
  extraLarge,
  superLarge,
}

extension XSpacingExtension on XSpacing {
  double toDouble(XSpacingsData spacings) {
    return switch (this) {
      XSpacing.none => spacings.none,
      XSpacing.superSmall => spacings.superSmall,
      XSpacing.extraSmall => spacings.extraSmall,
      XSpacing.small => spacings.small,
      XSpacing.semiSmall => spacings.semiSmall,
      XSpacing.medium => spacings.medium,
      XSpacing.semiLarge => spacings.semiLarge,
      XSpacing.large => spacings.large,
      XSpacing.extraLarge => spacings.extraLarge,
      XSpacing.superLarge => spacings.superLarge,
    };
  }
}
