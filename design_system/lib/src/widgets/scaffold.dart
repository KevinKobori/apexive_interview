import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
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
    final theme = AppTheme.of(context);
    final floatingBar = this.floatingBar;

// Inside your AppScaffold build method
    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor ?? theme.colors.background,
      ),
      child: Stack(
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
                      color: theme.colors.background.withOpacity(0.8),
                    ),
                  ),
                )
              : const SizedBox(),
          body,
          if (floatingBar != null)
            AnimatedPositioned(
              duration: theme.durations.regular,
              left: math.max(
                mediaQuery.padding.left,
                theme.spacing.semiSmall,
              ),
              right: math.max(
                mediaQuery.padding.right,
                theme.spacing.semiSmall,
              ),
              bottom: math.max(
                mediaQuery.padding.bottom,
                theme.spacing.semiSmall,
              ),
              child: floatingBar,
            ),
        ],
      ),
    );
  }
}
