part of x_metrics_data;

class _XBorderRadius extends Equatable {
  final XRadiusData _radius;

  const _XBorderRadius(this._radius);

  BorderRadius get none => BorderRadius.all(_radius.none);
  BorderRadius get extraSmall => BorderRadius.all(_radius.extraSmall);
  BorderRadius get small => BorderRadius.all(_radius.small);
  BorderRadius get semiSmall => BorderRadius.all(_radius.semiSmall);
  BorderRadius get medium => BorderRadius.all(_radius.medium);
  BorderRadius get semiLarge => BorderRadius.all(_radius.semiLarge);
  BorderRadius get large => BorderRadius.all(_radius.large);
  BorderRadius get extraLarge => BorderRadius.all(_radius.extraLarge);
  BorderRadius get superLarge => BorderRadius.all(_radius.superLarge);

  _XShapes get shape => _XShapes(this);

  @override
  List<Object?> get props => [
        _radius,
      ];
}
