import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';
import 'package:shimmer/shimmer.dart';

class ApodPageHeader extends StatelessWidget {
  final ScrollController? controller;
  final String url;
  final MediaType mediaType;
  final bool isShimmer;

  const ApodPageHeader.shimmer({
    super.key,
  })  : url = '',
        mediaType = MediaType.image,
        controller = null,
        isShimmer = true;

  const ApodPageHeader({
    required this.controller,
    required this.url,
    required this.mediaType,
    super.key,
  }) : isShimmer = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return isShimmer
        ? Shimmer.fromColors(
            baseColor: colors.background,
            highlightColor: colors.background.withOpacity(0.6),
            child: _buildBody(context),
          )
        : mediaType == MediaType.video
            ? _buildBody(context)
            : AnimatedBuilder(
                animation: controller!,
                child: _buildBody(context),
                builder: (context, child) {
                  final scrollAmount = (1 -
                          (controller!.offset.abs() /
                              textTheme.titleLarge!.fontSize! *
                              0.5))
                      .clamp(0, 1);
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(url),
                        fit: BoxFit.cover,
                        opacity: 0.475 * scrollAmount,
                      ),
                    ),
                    child: child,
                  );
                },
              );
  }

  Widget _buildBody(BuildContext context) {
    final theme = Theme.of(context).extension<ApodThemeData>()!;
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      bottom: false,
      child: ApodPadding(
        padding: const ApodEdgeInsets.large(),
        child: Stack(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SvgPicture.asset(
                    theme.images.appWormLogo,
                    width: textTheme.titleLarge!.fontSize! * 4,
                  ),
                  const ApodGap.small(),
                  const ApodText.bodyLarge(
                    'Astronomy Picture of the Day',
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
