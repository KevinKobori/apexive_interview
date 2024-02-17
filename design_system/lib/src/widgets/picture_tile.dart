import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tap_builder/tap_builder.dart';

class ApodPictureTile extends StatefulWidget {
  const ApodPictureTile.shimmer({
    super.key,
  })  : isShimmer = true,
        title = '',
        imageUrl = '',
        date = '',
        onTap = null;

  const ApodPictureTile({
    required this.title,
    required this.imageUrl,
    required this.date,
    required this.onTap,
    super.key,
  }) : isShimmer = false;

  final bool isShimmer;
  final String title;
  final String imageUrl;
  final String date;
  final VoidCallback? onTap;

  @override
  State<ApodPictureTile> createState() => _ApodPictureTileState();
}

class _ApodPictureTileState extends State<ApodPictureTile> {
  double _aspectRatio = 1;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadAspectRatio();
  }

  Future<void> _loadAspectRatio() async {
    try {
      final double aspectRatio =
          await ImageHelper.getImageAspectRatio(widget.imageUrl);
      if (mounted) {
        setState(() {
          _aspectRatio = aspectRatio;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isShimmer || _isLoading) {
      return const ProductTileLayout.shimmer();
    } else {
      return TapBuilder(
        onTap: widget.onTap,
        builder: (context, state, hasFocus) {
          switch (state) {
            case TapState.pressed:
            case TapState.hover:
              return ProductTileLayout.hovered(
                image: CachedNetworkImageProvider(widget.imageUrl),
                title: widget.title,
                date: widget.date,
                aspectRatio: _aspectRatio,
              );
            default:
              return ProductTileLayout.idle(
                image: CachedNetworkImageProvider(widget.imageUrl),
                title: widget.title,
                date: widget.date,
                aspectRatio: _aspectRatio,
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
    super.key,
  })  : _state = ProductTileState.shimmer,
        title = '',
        image = const CachedNetworkImageProvider(''),
        date = '',
        aspectRatio = 1.2;

  const ProductTileLayout.idle({
    required this.title,
    required this.image,
    required this.date,
    required this.aspectRatio,
    super.key,
  }) : _state = ProductTileState.idle;

  const ProductTileLayout.hovered({
    required this.title,
    required this.image,
    required this.date,
    required this.aspectRatio,
    super.key,
  }) : _state = ProductTileState.hovered;

  final String title;
  final double aspectRatio;
  final ImageProvider image;
  final String date;
  final ProductTileState _state;

  @override
  Widget build(BuildContext context) {
    final theme = ApodTheme.of(context);
    return _state == ProductTileState.shimmer
        ? Shimmer.fromColors(
            baseColor: theme.colors.background,
            highlightColor: theme.colors.background.withOpacity(0.6),
            child: AspectRatio(
              aspectRatio: aspectRatio,
              child: ClipRRect(
                borderRadius: theme.radius.asBorderRadius().extraSmall,
                child: Container(
                  color: Colors.grey,
                ),
              ),
            ),
          )
        : AspectRatio(
            aspectRatio: aspectRatio,
            child: ClipRRect(
              borderRadius: theme.radius.asBorderRadius().extraSmall,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: AnimatedContainer(
                      duration: theme.durations.regular,
                      curve: Curves.easeIn,
                      transform: Matrix4.identity()
                        ..scale(
                          _state == ProductTileState.hovered ? 1.05 : 1.0,
                        ),
                      transformAlignment: Alignment.center,
                      child: Image(
                        image: image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: AnimatedContainer(
                      duration: theme.durations.quick,
                      color: theme.colors.accent.withOpacity(
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
                                theme.colors.background.withOpacity(0),
                                theme.colors.background.withOpacity(0),
                                theme.colors.background.withOpacity(
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
                                ApodText.title3(
                                  title,
                                  color: theme.colors.accentOpposite,
                                ),
                                ApodText.paragraph1(
                                  date,
                                  color: theme.colors.accentOpposite,
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
