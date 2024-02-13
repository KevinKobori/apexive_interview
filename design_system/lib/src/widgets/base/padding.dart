import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:nasa_apod_design_system/src/theme/theme.dart';

class ApodEdgeInsets extends Equatable {
  const ApodEdgeInsets.all(ApodSpacings value)
      : left = value,
        top = value,
        right = value,
        bottom = value;

  const ApodEdgeInsets.symmetric({
    ApodSpacings vertical = ApodSpacings.none,
    ApodSpacings horizontal = ApodSpacings.none,
  })  : left = horizontal,
        top = vertical,
        right = horizontal,
        bottom = vertical;

  const ApodEdgeInsets.only({
    this.left = ApodSpacings.none,
    this.top = ApodSpacings.none,
    this.right = ApodSpacings.none,
    this.bottom = ApodSpacings.none,
  });

  const ApodEdgeInsets.extraSmall()
      : left = ApodSpacings.extraSmall,
        top = ApodSpacings.extraSmall,
        right = ApodSpacings.extraSmall,
        bottom = ApodSpacings.extraSmall;

  const ApodEdgeInsets.small()
      : left = ApodSpacings.small,
        top = ApodSpacings.small,
        right = ApodSpacings.small,
        bottom = ApodSpacings.small;

  const ApodEdgeInsets.semiSmall()
      : left = ApodSpacings.semiSmall,
        top = ApodSpacings.semiSmall,
        right = ApodSpacings.semiSmall,
        bottom = ApodSpacings.semiSmall;

  const ApodEdgeInsets.large()
      : left = ApodSpacings.large,
        top = ApodSpacings.large,
        right = ApodSpacings.large,
        bottom = ApodSpacings.large;

  const ApodEdgeInsets.extraLarge()
      : left = ApodSpacings.extraLarge,
        top = ApodSpacings.extraLarge,
        right = ApodSpacings.extraLarge,
        bottom = ApodSpacings.extraLarge;

  final ApodSpacings left;
  final ApodSpacings top;
  final ApodSpacings right;
  final ApodSpacings bottom;

  @override
  List<Object?> get props => [
        left,
        top,
        right,
        bottom,
      ];

  EdgeInsets toEdgeInsets(ApodThemeData theme) {
    return EdgeInsets.only(
      left: left.getSpacing(theme),
      top: top.getSpacing(theme),
      right: right.getSpacing(theme),
      bottom: bottom.getSpacing(theme),
    );
  }
}

class ApodPadding extends StatelessWidget {
  const ApodPadding({
    super.key,
    this.padding = const ApodEdgeInsets.all(ApodSpacings.none),
    this.child,
  });

  const ApodPadding.extraSmall({
    super.key,
    this.child,
  }) : padding = const ApodEdgeInsets.all(ApodSpacings.extraSmall);

  const ApodPadding.small({
    super.key,
    this.child,
  }) : padding = const ApodEdgeInsets.all(ApodSpacings.small);

  const ApodPadding.semiSmall({
    super.key,
    this.child,
  }) : padding = const ApodEdgeInsets.all(ApodSpacings.semiSmall);

  const ApodPadding.large({
    super.key,
    this.child,
  }) : padding = const ApodEdgeInsets.all(ApodSpacings.large);

  const ApodPadding.extraLarge({
    super.key,
    this.child,
  }) : padding = const ApodEdgeInsets.all(ApodSpacings.extraLarge);

  final ApodEdgeInsets padding;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final theme = ApodTheme.of(context);
    return Padding(
      padding: padding.toEdgeInsets(theme),
      child: child,
    );
  }
}
