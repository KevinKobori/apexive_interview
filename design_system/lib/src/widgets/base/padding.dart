import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:nasa_apod_design_system/src/theme/theme.dart';
import 'package:nasa_apod_design_system/src/widgets/base/gap.dart';

class AppEdgeInsets extends Equatable {
  const AppEdgeInsets.all(AppGapSize value)
      : left = value,
        top = value,
        right = value,
        bottom = value;

  const AppEdgeInsets.symmetric({
    AppGapSize vertical = AppGapSize.none,
    AppGapSize horizontal = AppGapSize.none,
  })  : left = horizontal,
        top = vertical,
        right = horizontal,
        bottom = vertical;

  const AppEdgeInsets.only({
    this.left = AppGapSize.none,
    this.top = AppGapSize.none,
    this.right = AppGapSize.none,
    this.bottom = AppGapSize.none,
  });

  const AppEdgeInsets.extraSmall()
      : left = AppGapSize.extraSmall,
        top = AppGapSize.extraSmall,
        right = AppGapSize.extraSmall,
        bottom = AppGapSize.extraSmall;

  const AppEdgeInsets.small()
      : left = AppGapSize.small,
        top = AppGapSize.small,
        right = AppGapSize.small,
        bottom = AppGapSize.small;

  const AppEdgeInsets.semiSmall()
      : left = AppGapSize.semiSmall,
        top = AppGapSize.semiSmall,
        right = AppGapSize.semiSmall,
        bottom = AppGapSize.semiSmall;

  const AppEdgeInsets.large()
      : left = AppGapSize.large,
        top = AppGapSize.large,
        right = AppGapSize.large,
        bottom = AppGapSize.large;

  const AppEdgeInsets.extraLarge()
      : left = AppGapSize.extraLarge,
        top = AppGapSize.extraLarge,
        right = AppGapSize.extraLarge,
        bottom = AppGapSize.extraLarge;

  final AppGapSize left;
  final AppGapSize top;
  final AppGapSize right;
  final AppGapSize bottom;

  @override
  List<Object?> get props => [
        left,
        top,
        right,
        bottom,
      ];

  EdgeInsets toEdgeInsets(AppThemeData theme) {
    return EdgeInsets.only(
      left: left.getSpacing(theme),
      top: top.getSpacing(theme),
      right: right.getSpacing(theme),
      bottom: bottom.getSpacing(theme),
    );
  }
}

class AppPadding extends StatelessWidget {
  const AppPadding({
    super.key,
    this.padding = const AppEdgeInsets.all(AppGapSize.none),
    this.child,
  });

  const AppPadding.extraSmall({
    super.key,
    this.child,
  }) : padding = const AppEdgeInsets.all(AppGapSize.extraSmall);

  const AppPadding.small({
    super.key,
    this.child,
  }) : padding = const AppEdgeInsets.all(AppGapSize.small);

  const AppPadding.semiSmall({
    super.key,
    this.child,
  }) : padding = const AppEdgeInsets.all(AppGapSize.semiSmall);

  const AppPadding.large({
    super.key,
    this.child,
  }) : padding = const AppEdgeInsets.all(AppGapSize.large);

  const AppPadding.extraLarge({
    super.key,
    this.child,
  }) : padding = const AppEdgeInsets.all(AppGapSize.extraLarge);

  final AppEdgeInsets padding;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Padding(
      padding: padding.toEdgeInsets(theme),
      child: child,
    );
  }
}
