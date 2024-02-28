import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';
import 'package:shimmer/shimmer.dart';

class CatalogPageHeader extends StatelessWidget {
  final ScrollController? controller;
  final String url;
  final MediaType mediaType;
  final bool isShimmer;

  const CatalogPageHeader.shimmer({
    super.key,
  })  : url = '',
        mediaType = MediaType.image,
        controller = null,
        isShimmer = true;

  const CatalogPageHeader({
    required this.controller,
    required this.url,
    required this.mediaType,
    super.key,
  }) : isShimmer = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    // final textTheme = Theme.of(context).textTheme;

    return isShimmer
        ? Shimmer.fromColors(
            baseColor: colorScheme.surface,
            highlightColor: colorScheme.surface.withOpacity(0.6),
            child: _buildBody(context),
          )
        : mediaType == MediaType.video
            ? _buildBody(context)
            : AnimatedBuilder(
                animation: controller!,
                child: _buildBody(context),
                builder: (context, child) {
                  // final scrollAmount = (1 -
                  //         (controller!.offset.abs() /
                  //             textTheme.titleLarge!.fontSize! *
                  //             0.5))
                  //     .clamp(0, 1);
                  return DecoratedBox(
                    decoration: const BoxDecoration(
                      // image: DecorationImage(
                      //   image: CachedNetworkImageProvider(url),
                      //   fit: BoxFit.cover,
                      //   opacity: 0.475 * scrollAmount,
                      // ),
                      color: Colors.transparent,
                    ),
                    child: child,
                  );
                },
              );
  }

  Widget _buildBody(BuildContext context) {
    final assets = Theme.of(context).extension<ApodAssetsData>()!;
    final metrics = Theme.of(context).extension<XMetricsData>()!;
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      bottom: false,
      child: metrics.spacings.edgeInsets.paddings.allExtraLarge(
        child: Stack(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SvgPicture.asset(
                    assets.images.appWormLogo,
                    width: textTheme.titleLarge!.fontSize! * 4,
                  ),
                  metrics.spacings.gaps.small,
                  Text(
                    'Astronomy Picture of the Day',
                    style: textTheme.bodyLarge!,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: ThemeSwitch(),
            ),
          ],
        ),
      ),
    );
  }
}
