import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';
import 'package:shimmer/shimmer.dart';

class PicturesPageHeader extends StatelessWidget {
  final ScrollController? controller;
  final ImageProvider? image;
  final bool isShimmer;

  const PicturesPageHeader.shimmer({
    super.key,
  })  : image = null,
        controller = null,
        isShimmer = true;

  const PicturesPageHeader({
    required this.controller,
    required this.image,
    super.key,
  }) : isShimmer = false;

  @override
  Widget build(BuildContext context) {
    final theme = ApodTheme.of(context);
    return isShimmer
        ? Shimmer.fromColors(
            baseColor: theme.colors.background,
            highlightColor: theme.colors.background.withOpacity(0.6),
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: EdgeInsets.all(
                  theme.spacings.large,
                ),
                child: Center(
                  child: Column(
                    children: [
                      SvgPicture(
                        theme.images.appWormLogo,
                        width: theme.typography.title1.fontSize! * 4,
                      ),
                      const ApodGap.small(),
                      const ApodText.paragraph1(
                          'Astronomy Picture of the Day'),
                    ],
                  ),
                ),
              ),
            ),
          )
        : AnimatedBuilder(
            animation: controller!,
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: EdgeInsets.all(
                  theme.spacings.large,
                ),
                child: Center(
                  child: Column(
                    children: [
                      SvgPicture(
                        theme.images.appWormLogo,
                        width: theme.typography.title1.fontSize! * 4,
                      ),
                      const ApodGap.small(),
                      const ApodText.paragraph1('Astronomy Picture of the Day'),
                    ],
                  ),
                ),
              ),
            ),
            builder: (context, child) {
              final scrollAmount = (1 -
                      (controller!.offset.abs() /
                          theme.typography.title1.fontSize! *
                          0.5))
                  .clamp(0, 1);
              return DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: image!,
                    fit: BoxFit.cover,
                    opacity: 0.025 + 0.475 * scrollAmount,
                  ),
                ),
                child: child,
              );
            },
          );
  }
}
