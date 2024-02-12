import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';
import 'package:tap_builder/tap_builder.dart';

class PictureTile extends StatefulWidget {
  const PictureTile({
    required this.title,
    // required this.image,
    required this.imageUrl,
    required this.date,
    required this.onTap,
    super.key,
    // this.aspectRatio = 1.0,
  });

  final String title;
  // final double aspectRatio;
  final String imageUrl;
  // final ImageProvider image;
  final String date;
  final VoidCallback onTap;

  @override
  State<PictureTile> createState() => _PictureTileState();
}

class _PictureTileState extends State<PictureTile> {
  double _aspectRatio = 1;
  bool _isLoading = true; // Initial state is loading

  @override
  void initState() {
    super.initState();
    _loadAspectRatio();
  }

  Future<void> _loadAspectRatio() async {
    try {
      final double aspectRatio = await getImageAspectRatio(widget.imageUrl);
      if (mounted) {
        setState(() {
          _aspectRatio = aspectRatio;
          _isLoading = false; // Loading is complete
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false; // Ensure loading state is disabled even on error
        });
      }
      // Handle any errors here
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: Text('PUT LOADING HERE'));
    } else {
      return TapBuilder(
        onTap: widget.onTap,
        builder: (context, state, hasFocus) {
          switch (state) {
            case TapState.pressed:
            case TapState.hover:
              return ProductTileLayout.hovered(
                // image: widget.image,
                image: CachedNetworkImageProvider(widget.imageUrl),
                title: widget.title,
                date: widget.date,
                aspectRatio: _aspectRatio,
              );
            default:
              return ProductTileLayout.idle(
                // image: widget.image,
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
}

class ProductTileLayout extends StatelessWidget {
  const ProductTileLayout.idle({
    required this.title,
    required this.image,
    required this.date,
    super.key,
    this.aspectRatio = 1.0,
  }) : _state = ProductTileState.idle;

  const ProductTileLayout.hovered({
    required this.title,
    required this.image,
    required this.date,
    super.key,
    this.aspectRatio = 1.0,
  }) : _state = ProductTileState.hovered;

  final String title;
  final double aspectRatio;
  final ImageProvider image;
  final String date;
  final ProductTileState _state;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return AspectRatio(
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
                              _state == ProductTileState.hovered ? 0.9 : 0.8),
                        ],
                      ),
                    ),
                    child: AppPadding.small(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AppText.title3(
                            title,
                            color: theme.colors.accentOpposite,
                          ),
                          // DateLabel(date),
                          AppText.paragraph1(
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

Future<double> getImageAspectRatio(String imageUrl) async {
  final ImageStream imageStream =
      CachedNetworkImageProvider(imageUrl).resolve(ImageConfiguration.empty);
  final Completer<double> completer = Completer();

  void imageListener(ImageInfo info, bool _) {
    final double aspectRatio = info.image.width / info.image.height;
    completer.complete(aspectRatio);
  }

  imageStream.addListener(
    ImageStreamListener(imageListener),
  );

  return await completer.future;
}
