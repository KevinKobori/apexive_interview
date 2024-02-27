import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tap_builder/tap_builder.dart';

class ApodPictureTile extends StatefulWidget {
  const ApodPictureTile._shimmer({
    required this.aspectRatio,
  })  : isLoading = true,
        title = '',
        url = '',
        mediaType = MediaType.image,
        date = '',
        onTap = null;

  final bool isLoading;
  final String title;
  final String url;
  final MediaType mediaType;
  final String date;
  final double aspectRatio;
  final VoidCallback? onTap;

  const ApodPictureTile({
    required this.title,
    required this.url,
    required this.mediaType,
    required this.date,
    required this.aspectRatio,
    required this.onTap,
    super.key,
  }) : isLoading = false;

  factory ApodPictureTile.shimmer({Key? key}) {
    const double min = 0.5;
    const double max = 2;
    final double aspectRatio = 0.5 + Random().nextDouble() * (max - min);

    return ApodPictureTile._shimmer(
      aspectRatio: aspectRatio,
    );
  }

  @override
  State<ApodPictureTile> createState() => _ApodPictureTileState();
}

class _ApodPictureTileState extends State<ApodPictureTile> {
  @override
  Widget build(BuildContext context) {
    if (widget.isLoading) {
      return ProductTileLayout.shimmer(
        aspectRatio: widget.aspectRatio,
      );
    } else {
      return TapBuilder(
        onTap: widget.onTap,
        builder: (context, state, hasFocus) {
          switch (state) {
            case TapState.pressed:
            case TapState.hover:
              return ProductTileLayout.hovered(
                url: widget.url,
                mediaType: widget.mediaType,
                title: widget.title,
                date: widget.date,
                aspectRatio: widget.aspectRatio,
              );
            default:
              return ProductTileLayout.idle(
                url: widget.url,
                mediaType: widget.mediaType,
                title: widget.title,
                date: widget.date,
                aspectRatio: widget.aspectRatio,
              );
          }
        },
      );
    }
  }
}

enum ProductTileState {
  idle,
  hovered,
  shimmer,
}

class ProductTileLayout extends StatelessWidget {
  const ProductTileLayout.shimmer({
    required this.aspectRatio,
    super.key,
  })  : _state = ProductTileState.shimmer,
        title = '',
        url = '',
        mediaType = MediaType.image,
        date = '';

  const ProductTileLayout.idle({
    required this.title,
    required this.url,
    required this.mediaType,
    required this.date,
    required this.aspectRatio,
    super.key,
  }) : _state = ProductTileState.idle;

  const ProductTileLayout.hovered({
    required this.title,
    required this.url,
    required this.mediaType,
    required this.date,
    required this.aspectRatio,
    super.key,
  }) : _state = ProductTileState.hovered;

  final String title;
  final double aspectRatio;
  final String url;
  final MediaType mediaType;
  final String date;
  final ProductTileState _state;

  @override
  Widget build(BuildContext context) {
    final metrics = Theme.of(context).extension<ApodThemeData>()!;
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return _state == ProductTileState.shimmer
        ? Shimmer.fromColors(
            baseColor: colorScheme.surface,
            highlightColor: colorScheme.surface.withOpacity(0.6),
            child: AspectRatio(
              aspectRatio: aspectRatio,
              child: ClipRRect(
                borderRadius: metrics.radius.xBorder.semiSmall,
                child: Container(
                  color: Colors.grey,
                ),
              ),
            ),
          )
        : AspectRatio(
            aspectRatio: aspectRatio,
            child: ClipRRect(
              borderRadius: metrics.radius.xBorder.semiSmall,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: AnimatedContainer(
                      duration: metrics.durations.regular,
                      curve: Curves.easeIn,
                      transform: Matrix4.identity()
                        ..scale(
                          _state == ProductTileState.hovered ? 1.05 : 1.0,
                        ),
                      transformAlignment: Alignment.center,
                      child: mediaType == MediaType.image
                          ? Image(
                              image: CachedNetworkImageProvider(url),
                              fit: BoxFit.cover,
                            )
                          : const Text('VIDEO PLAYER'),
                    ),
                  ),
                  Positioned.fill(
                    child: AnimatedContainer(
                      duration: metrics.durations.quick,
                      color: colorScheme.primary.withOpacity(
                        _state == ProductTileState.hovered ? 0.2 : 0.0,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                colorScheme.shadow.withOpacity(0),
                                colorScheme.shadow.withOpacity(0),
                                colorScheme.shadow.withOpacity(
                                    _state == ProductTileState.hovered
                                        ? 0.9
                                        : 0.8),
                              ],
                            ),
                          ),
                          child: ApodPadding.small(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ApodText.custom(
                                  title,
                                  style: textTheme.titleSmall!.copyWith(
                                    color: colorScheme.onPrimary,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                ApodText.custom(
                                  date,
                                  style: textTheme.bodyLarge!.copyWith(
                                    color: colorScheme.onPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
