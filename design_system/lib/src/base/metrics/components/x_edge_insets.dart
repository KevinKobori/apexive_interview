part of x_metrics_data;

class XEdgeInsets extends Equatable {
  final XSpacings left;
  final XSpacings top;
  final XSpacings right;
  final XSpacings bottom;

  const XEdgeInsets.all(XSpacings value)
      : left = value,
        top = value,
        right = value,
        bottom = value;

  const XEdgeInsets.symetric({
    XSpacings vertical = XSpacings.none,
    XSpacings horizontal = XSpacings.none,
  })  : left = horizontal,
        top = vertical,
        right = horizontal,
        bottom = vertical;

  const XEdgeInsets.only({
    this.left = XSpacings.none,
    this.top = XSpacings.none,
    this.right = XSpacings.none,
    this.bottom = XSpacings.none,
  });

  const XEdgeInsets.none()
      : left = XSpacings.none,
        top = XSpacings.none,
        right = XSpacings.none,
        bottom = XSpacings.none;

  const XEdgeInsets.allSuperSmall()
      : left = XSpacings.superSmall,
        top = XSpacings.superSmall,
        right = XSpacings.superSmall,
        bottom = XSpacings.superSmall;

  const XEdgeInsets.allExtraSmall()
      : left = XSpacings.extraSmall,
        top = XSpacings.extraSmall,
        right = XSpacings.extraSmall,
        bottom = XSpacings.extraSmall;

  const XEdgeInsets.allSmall()
      : left = XSpacings.small,
        top = XSpacings.small,
        right = XSpacings.small,
        bottom = XSpacings.small;

  const XEdgeInsets.allSemiSmall()
      : left = XSpacings.semiSmall,
        top = XSpacings.semiSmall,
        right = XSpacings.semiSmall,
        bottom = XSpacings.semiSmall;

  const XEdgeInsets.allMedium()
      : left = XSpacings.medium,
        top = XSpacings.medium,
        right = XSpacings.medium,
        bottom = XSpacings.medium;

  const XEdgeInsets.allSemiLarge()
      : left = XSpacings.semiLarge,
        top = XSpacings.semiLarge,
        right = XSpacings.semiLarge,
        bottom = XSpacings.semiLarge;

  const XEdgeInsets.allLarge()
      : left = XSpacings.large,
        top = XSpacings.large,
        right = XSpacings.large,
        bottom = XSpacings.large;

  const XEdgeInsets.allExtraLarge()
      : left = XSpacings.extraLarge,
        top = XSpacings.extraLarge,
        right = XSpacings.extraLarge,
        bottom = XSpacings.extraLarge;

  const XEdgeInsets.allSuperLarge()
      : left = XSpacings.superLarge,
        top = XSpacings.superLarge,
        right = XSpacings.superLarge,
        bottom = XSpacings.superLarge;

  const XEdgeInsets.verticalSuperSmall()
      : left = XSpacings.none,
        top = XSpacings.superSmall,
        right = XSpacings.none,
        bottom = XSpacings.superSmall;

  const XEdgeInsets.verticalExtraSmall()
      : left = XSpacings.none,
        top = XSpacings.extraSmall,
        right = XSpacings.none,
        bottom = XSpacings.extraSmall;

  const XEdgeInsets.verticalSmall()
      : left = XSpacings.none,
        top = XSpacings.small,
        right = XSpacings.none,
        bottom = XSpacings.small;

  const XEdgeInsets.verticalSemiSmall()
      : left = XSpacings.none,
        top = XSpacings.semiSmall,
        right = XSpacings.none,
        bottom = XSpacings.semiSmall;

  const XEdgeInsets.verticalMedium()
      : left = XSpacings.none,
        top = XSpacings.medium,
        right = XSpacings.none,
        bottom = XSpacings.medium;

  const XEdgeInsets.verticalSemiLarge()
      : left = XSpacings.none,
        top = XSpacings.semiLarge,
        right = XSpacings.none,
        bottom = XSpacings.semiLarge;

  const XEdgeInsets.verticalLarge()
      : left = XSpacings.none,
        top = XSpacings.large,
        right = XSpacings.none,
        bottom = XSpacings.large;

  const XEdgeInsets.verticalExtraLarge()
      : left = XSpacings.none,
        top = XSpacings.extraLarge,
        right = XSpacings.none,
        bottom = XSpacings.extraLarge;

  const XEdgeInsets.verticalSuperLarge()
      : left = XSpacings.none,
        top = XSpacings.superLarge,
        right = XSpacings.none,
        bottom = XSpacings.superLarge;

  const XEdgeInsets.horizontalSuperSmall()
      : left = XSpacings.superSmall,
        top = XSpacings.none,
        right = XSpacings.superSmall,
        bottom = XSpacings.none;

  const XEdgeInsets.horizontalExtraSmall()
      : left = XSpacings.extraSmall,
        top = XSpacings.none,
        right = XSpacings.extraSmall,
        bottom = XSpacings.none;

  const XEdgeInsets.horizontalSmall()
      : left = XSpacings.small,
        top = XSpacings.none,
        right = XSpacings.small,
        bottom = XSpacings.none;

  const XEdgeInsets.horizontalSemiSmall()
      : left = XSpacings.semiSmall,
        top = XSpacings.none,
        right = XSpacings.semiSmall,
        bottom = XSpacings.none;

  const XEdgeInsets.horizontalMedium()
      : left = XSpacings.medium,
        top = XSpacings.none,
        right = XSpacings.medium,
        bottom = XSpacings.none;

  const XEdgeInsets.horizontalSemiLarge()
      : left = XSpacings.semiLarge,
        top = XSpacings.none,
        right = XSpacings.semiLarge,
        bottom = XSpacings.none;

  const XEdgeInsets.horizontalLarge()
      : left = XSpacings.large,
        top = XSpacings.none,
        right = XSpacings.large,
        bottom = XSpacings.none;

  const XEdgeInsets.horizontalExtraLarge()
      : left = XSpacings.extraLarge,
        top = XSpacings.none,
        right = XSpacings.extraLarge,
        bottom = XSpacings.none;

  const XEdgeInsets.horizontalSuperLarge()
      : left = XSpacings.superLarge,
        top = XSpacings.none,
        right = XSpacings.superLarge,
        bottom = XSpacings.none;

  EdgeInsets toEdgeInsets(XSpacingsData spacings) {
    return EdgeInsets.only(
      left: left.toDouble(spacings),
      top: top.toDouble(spacings),
      right: right.toDouble(spacings),
      bottom: bottom.toDouble(spacings),
    );
  }

  @override
  List<Object?> get props => [
        left,
        top,
        right,
        bottom,
      ];
}
