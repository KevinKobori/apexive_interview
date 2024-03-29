import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';

abstract final class ImageHelper {
  static Future<void> precache(
    BuildContext context, {
    required List<String> imagesPathList,
  }) async {
    for (final assetPath in imagesPathList) {
      await precacheImage(AssetImage(assetPath), context);
    }
  }

  static Future<double> getImageAspectRatio(String imageUrl) async {
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
}
