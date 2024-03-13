part of x_metrics_data;

class _XGaps extends Equatable {
  final XSpacingsData _spacings;

  const _XGaps(this._spacings);

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
