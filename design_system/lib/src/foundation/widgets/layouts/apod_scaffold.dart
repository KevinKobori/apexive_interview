import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ApodScaffold extends StatelessWidget {
  const ApodScaffold({
    required this.body,
    super.key,
    this.backgroundColor,
    this.backgroundImage,
    this.floatingBar,
  });

  final Widget body;
  final Color? backgroundColor;
  final ImageProvider? backgroundImage;
  final Widget? floatingBar;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final metrics = Theme.of(context).extension<XMetricsData>()!;
    final colorScheme = Theme.of(context).colorScheme;
    final floatingBar = this.floatingBar;

    // Inside your AppScaffold build method
    return Scaffold(
      backgroundColor: backgroundColor ?? colorScheme.surface,
      body: Stack(
        children: [
          backgroundImage != null
              ? Positioned.fill(
                  child: Image(
                    image: backgroundImage!,
                    fit: BoxFit.cover,
                  ),
                )
              : const SizedBox(),
          backgroundImage != null
              ? Positioned.fill(
                  child: BackdropFilter(
                    filter: ui.ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                    child: Container(
                      color: colorScheme.surface.withOpacity(0.7),
                    ),
                  ),
                )
              : const SizedBox(),
          body,
          if (floatingBar != null)
            AnimatedPositioned(
              duration: metrics.durations.regular,
              left: math.max(
                mediaQuery.padding.left,
                metrics.spacings.semiSmall,
              ),
              right: math.max(
                mediaQuery.padding.right,
                metrics.spacings.semiSmall,
              ),
              bottom: math.max(
                mediaQuery.padding.bottom,
                metrics.spacings.semiSmall,
              ),
              child: floatingBar,
            ),
        ],
      ),
    );
  }
}
