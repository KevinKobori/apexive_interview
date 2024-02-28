import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class CatalogPageLoadingView extends StatelessWidget {
  const CatalogPageLoadingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final metrics = Theme.of(context).extension<ApodMetricsData>()!;
    
    return LayoutBuilder(builder: (context, constraints) {
      return ApodScaffold(
        body: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: CatalogPageHeader.shimmer(),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: const ApodEdgeInsets.only(
                  left: ApodSpacing.large,
                  top: ApodSpacing.large,
                  right: ApodSpacing.large,
                  bottom: ApodSpacing.large,
                ).toEdgeInsets(metrics),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ApodPictureTile.shimmer(),
                  ],
                ),
              ),
            ),
            SliverSafeArea(
              top: false,
              sliver: ApodSliverGridTile(
                padding: EdgeInsets.only(
                  left: metrics.spacings.large,
                  top: metrics.spacings.extraSmall,
                  right: metrics.spacings.large,
                  bottom: math.max(
                        mediaQuery.padding.bottom,
                        metrics.spacings.large,
                      ) +
                      metrics.spacings.superLarge,
                ),
                crossAxisCount: (constraints.maxWidth / 300).ceil(),
                children: List.generate(10, (_) => ApodPictureTile.shimmer())
                    .toList(),
              ),
            ),
          ],
        ),
      );
    });
  }
}
