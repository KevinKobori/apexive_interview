import 'package:flutter/material.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class XPadding extends StatelessWidget {
  const XPadding({
    super.key,
    this.padding = const XEdgeInsets.all(XSpacings.none),
    this.child,
  });

  const XPadding.extraSmall({
    super.key,
    this.child,
  }) : padding = const XEdgeInsets.all(XSpacings.extraSmall);

  const XPadding.small({
    super.key,
    this.child,
  }) : padding = const XEdgeInsets.all(XSpacings.small);

  const XPadding.semiSmall({
    super.key,
    this.child,
  }) : padding = const XEdgeInsets.all(XSpacings.semiSmall);

  const XPadding.large({
    super.key,
    this.child,
  }) : padding = const XEdgeInsets.all(XSpacings.large);

  const XPadding.extraLarge({
    super.key,
    this.child,
  }) : padding = const XEdgeInsets.all(XSpacings.extraLarge);

  final XEdgeInsets padding;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final metrics = Theme.of(context).extension<XMetricsData>()!;

    return Padding(
      padding: padding.toEdgeInsets(metrics.spacings),
      child: child,
    );
  }
}
