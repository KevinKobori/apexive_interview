import 'package:flutter/material.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ApodNavigationBar extends StatelessWidget {
  const ApodNavigationBar({
    required this.leading,
    required this.body,
    required this.summary,
    super.key,
    this.canNavigateBack = false,
    this.animation,
    this.action,
  });

  final Animation<double>? animation;
  final bool canNavigateBack;
  final Widget leading;
  final Widget body;
  final Widget summary;
  final Widget? action;

  Widget _animatedBody(BuildContext context, Animation<double> animation) {
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
        const ApodGap.semiSmall(),
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
        const ApodGap.semiSmall(),
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
        const ApodGap.semiSmall(),
        if (canNavigateBack) Expanded(child: summary),
        if (!canNavigateBack)
          Expanded(
            child: body,
          ),
        const ApodGap.semiSmall(),
        if (!canNavigateBack) summary,
        if (canNavigateBack && action != null) action,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final animation = this.animation;
    return NavigationBarContainer(
      child: animation != null
          ? _animatedBody(context, animation)
          : _staticBody(context),
    );
  }
}

class NavigationBarContainer extends StatelessWidget {
  const NavigationBarContainer({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ApodThemeData>()!;
    final colors = Theme.of(context).colorScheme;
    return ApodContainer(
      padding: const ApodEdgeInsets.semiSmall(),
      decoration: BoxDecoration(
        borderRadius: theme.radius.xBorder.semiSmall,
        color: colors.background,
      ),
      child: child,
    );
  }
}
