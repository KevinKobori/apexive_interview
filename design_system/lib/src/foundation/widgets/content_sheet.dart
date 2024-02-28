import 'package:flutter/material.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';
import 'package:sliver_tools/sliver_tools.dart';

class ApodContentSheet extends StatelessWidget {
  const ApodContentSheet({
    required this.children,
    super.key,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final metrics = Theme.of(context).extension<XMetricsData>()!;
    final mediaQuery = MediaQuery.of(context);
    final route = ModalRoute.of(context);

    return SlideTransition(
      position: Tween(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: route!.animation!,
          curve: Curves.easeOutQuad,
        ),
      ),
      child: CustomScrollView(
        reverse: true,
        slivers: [
          SliverPadding(
            padding: EdgeInsets.only(
              top: mediaQuery.padding.top + metrics.spacings.semiSmall,
              bottom: mediaQuery.padding.bottom,
            ),
            sliver: SliverStack(
              children: <Widget>[
                SliverPositioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: metrics.radius.border.large,
                    ),
                  ),
                ),
                SliverPadding(
                  padding: metrics.spacings.edgeInsets.only(
                    left: XSpacing.large,
                    right: XSpacing.large,
                    top: XSpacing.large,
                    bottom: XSpacing.large,
                  ),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        ...children.reversed,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
