part of x_metrics_data;

enum XSpacings {
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

extension XSpacingsExtension on XSpacings {
  double toDouble(XSpacingsData spacings) {
    return switch (this) {
      XSpacings.none => spacings.none,
      XSpacings.superSmall => spacings.superSmall,
      XSpacings.extraSmall => spacings.extraSmall,
      XSpacings.small => spacings.small,
      XSpacings.semiSmall => spacings.semiSmall,
      XSpacings.medium => spacings.medium,
      XSpacings.semiLarge => spacings.semiLarge,
      XSpacings.large => spacings.large,
      XSpacings.extraLarge => spacings.extraLarge,
      XSpacings.superLarge => spacings.superLarge,
    };
  }
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
    final XSpacings? left,
    final XSpacings? top,
    final XSpacings? right,
    final XSpacings? bottom,
  }) =>
      EdgeInsets.only(
        left: (left ?? XSpacings.none).toDouble(_spacings),
        top: (top ?? XSpacings.none).toDouble(_spacings),
        right: (right ?? XSpacings.none).toDouble(_spacings),
        bottom: (bottom ?? XSpacings.none).toDouble(_spacings),
      );

  _XPaddingsData get paddings => _XPaddingsData(this);

  @override
  List<Object?> get props => [
        _spacings,
      ];
}
