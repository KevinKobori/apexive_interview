import 'package:flutter/material.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ApodNavigationBar extends StatelessWidget {
  final Animation<double>? animation;
  final bool canNavigateBack;
  final Widget leading;
  final Widget body;
  final Widget summary;
  final Widget? action;

  const ApodNavigationBar({
    required this.leading,
    required this.body,
    required this.summary,
    super.key,
    this.canNavigateBack = false,
    this.animation,
    this.action,
  });

  Widget _animatedBody(BuildContext context, Animation<double> animation) {
    final metrics = Theme.of(context).extension<XMetricsData>()!;
    final leading = this.leading;
    final summary = this.summary;
    final action = this.action;

    return Row(
      children: [
        if (!canNavigateBack) leading,
        if (canNavigateBack)
          Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(
                child: FadeTransition(
                  opacity: ReverseAnimation(animation),
                  child: leading,
                ),
              ),
              FadeTransition(
                opacity: animation,
                child: const ApodBackButton(),
              ),
            ],
          ),
        metrics.spacings.gaps.semiSmall,
        if (action == null) body,
        if (action != null)
          Expanded(
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                FadeTransition(
                  opacity: ReverseAnimation(animation),
                  child: body,
                ),
                SlideTransition(
                  position: Tween(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: FadeTransition(
                    opacity: animation,
                    child: summary,
                  ),
                ),
              ],
            ),
          ),
        metrics.spacings.gaps.semiSmall,
        if (action == null) summary,
        if (action != null)
          Stack(
            alignment: Alignment.centerRight,
            children: [
              SlideTransition(
                position: Tween(
                  begin: Offset.zero,
                  end: const Offset(-1, 0),
                ).animate(animation),
                child: FadeTransition(
                  opacity: ReverseAnimation(animation),
                  child: summary,
                ),
              ),
              FadeTransition(
                opacity: animation,
                child: action,
              ),
            ],
          ),
      ],
    );
  }

  Widget _staticBody(BuildContext context) {
    final metrics = Theme.of(context).extension<XMetricsData>()!;
    final leading = this.leading;
    final summary = this.summary;
    final action = this.action;

    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: leading,
            ),
            Opacity(
              opacity: !canNavigateBack ? 0.0 : 1.0,
              child: IgnorePointer(
                ignoring: !canNavigateBack,
                child: const ApodBackButton(),
              ),
            ),
          ],
        ),
        metrics.spacings.gaps.semiSmall,
        if (canNavigateBack) Expanded(child: summary),
        if (!canNavigateBack)
          Expanded(
            child: body,
          ),
        metrics.spacings.gaps.semiSmall,
        if (!canNavigateBack) summary,
        if (canNavigateBack && action != null) action,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final animation = this.animation;
    return _NavigationBarContainer(
      child: animation != null
          ? _animatedBody(context, animation)
          : _staticBody(context),
    );
  }
}

class _NavigationBarContainer extends StatelessWidget {
  final Widget child;

  const _NavigationBarContainer({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final metrics = Theme.of(context).extension<XMetricsData>()!;
    final colorScheme = Theme.of(context).colorScheme;

    return ApodContainer(
      padding: metrics.spacings.edgeInsets.allSemiSmall,
      decoration: BoxDecoration(
        borderRadius: metrics.radius.border.semiSmall,
        color: colorScheme.background,
      ),
      child: child,
    );
  }
}
