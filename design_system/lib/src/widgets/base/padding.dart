import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:nasa_apod_design_system/src/theme/theme.dart';

class ApodEdgeInsets extends Equatable {
  const ApodEdgeInsets.all(ApodSpacing value)
      : left = value,
        top = value,
        right = value,
        bottom = value;

  const ApodEdgeInsets.symmetric({
    ApodSpacing vertical = ApodSpacing.none,
    ApodSpacing horizontal = ApodSpacing.none,
  })  : left = horizontal,
        top = vertical,
        right = horizontal,
        bottom = vertical;

  const ApodEdgeInsets.only({
    this.left = ApodSpacing.none,
    this.top = ApodSpacing.none,
    this.right = ApodSpacing.none,
    this.bottom = ApodSpacing.none,
  });

  const ApodEdgeInsets.extraSmall()
      : left = ApodSpacing.extraSmall,
        top = ApodSpacing.extraSmall,
        right = ApodSpacing.extraSmall,
        bottom = ApodSpacing.extraSmall;

  const ApodEdgeInsets.small()
      : left = ApodSpacing.small,
        top = ApodSpacing.small,
        right = ApodSpacing.small,
        bottom = ApodSpacing.small;

  const ApodEdgeInsets.semiSmall()
      : left = ApodSpacing.semiSmall,
        top = ApodSpacing.semiSmall,
        right = ApodSpacing.semiSmall,
        bottom = ApodSpacing.semiSmall;

  const ApodEdgeInsets.large()
      : left = ApodSpacing.large,
        top = ApodSpacing.large,
        right = ApodSpacing.large,
        bottom = ApodSpacing.large;

  const ApodEdgeInsets.extraLarge()
      : left = ApodSpacing.extraLarge,
        top = ApodSpacing.extraLarge,
        right = ApodSpacing.extraLarge,
        bottom = ApodSpacing.extraLarge;

  final ApodSpacing left;
  final ApodSpacing top;
  final ApodSpacing right;
  final ApodSpacing bottom;

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
    this.padding = const ApodEdgeInsets.all(ApodSpacing.none),
    this.child,
  });

  const ApodPadding.extraSmall({
    super.key,
    this.child,
  }) : padding = const ApodEdgeInsets.all(ApodSpacing.extraSmall);

  const ApodPadding.small({
    super.key,
    this.child,
  }) : padding = const ApodEdgeInsets.all(ApodSpacing.small);

  const ApodPadding.semiSmall({
    super.key,
    this.child,
  }) : padding = const ApodEdgeInsets.all(ApodSpacing.semiSmall);

  const ApodPadding.large({
    super.key,
    this.child,
  }) : padding = const ApodEdgeInsets.all(ApodSpacing.large);

  const ApodPadding.extraLarge({
    super.key,
    this.child,
  }) : padding = const ApodEdgeInsets.all(ApodSpacing.extraLarge);

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
