import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class PicturesPageStateLoadingView extends StatefulWidget {
  final PicturesPagePresenter picturesPagePresenter;

  const PicturesPageStateLoadingView({
    required this.picturesPagePresenter,
    super.key,
  });

  @override
  State<PicturesPageStateLoadingView> createState() =>
      _PicturesPageStateLoadingViewState();
}

class _PicturesPageStateLoadingViewState
    extends State<PicturesPageStateLoadingView> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = ApodTheme.of(context);
    return LayoutBuilder(builder: (context, constraints) {
      return CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ApodPageHeader.shimmer(),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: ApodEdgeInsets.only(
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
                ),
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
