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
    final theme = ApodTheme.of(context);
    return LayoutBuilder(builder: (context, constraints) {
      return CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: ApodPageHeader.shimmer(),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const ApodEdgeInsets.only(
                left: ApodSpacing.large,
                top: ApodSpacing.large,
                right: ApodSpacing.large,
                bottom: ApodSpacing.large,
              ).toEdgeInsets(theme),
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
                left: theme.spacings.large,
                top: theme.spacings.extraSmall,
                right: theme.spacings.large,
                bottom: math.max(
                      mediaQuery.padding.bottom,
                      theme.spacings.large,
                    ) +
                    theme.spacings.superLarge,
              ),
              crossAxisCount: (constraints.maxWidth / 300).ceil(),
              children:
                  List.generate(10, (_) => ApodPictureTile.shimmer()).toList(),
            ),
          ),
        ],
      );
    });
  }
}
