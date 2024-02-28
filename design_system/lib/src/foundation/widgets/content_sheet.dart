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
    final metrics = Theme.of(context).extension<ApodMetricsData>()!;
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
            ),
            sliver: SliverStack(
              children: <Widget>[
                SliverPositioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: metrics.radius.xBorder.large,
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(
                    left: metrics.spacings.large,
                    right: metrics.spacings.large,
                    top: metrics.spacings.large,
                    bottom: mediaQuery.padding.bottom + metrics.spacings.large,
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
