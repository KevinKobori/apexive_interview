import 'package:flutter/widgets.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class AppNotifiableBar extends StatefulWidget {
  const AppNotifiableBar({
    required this.child,
    super.key,
    this.notification,
    this.onClosed,
  });

  final NotificationViewModel? notification;
  final VoidCallback? onClosed;
  final Widget child;

  @override
  State<AppNotifiableBar> createState() => _AppNotifiableBarState();
}

class _AppNotifiableBarState extends State<AppNotifiableBar> {
  late bool _isOpened = widget.notification != null;

  @override
  void didUpdateWidget(covariant AppNotifiableBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.notification != widget.notification) {
      setState(() {
        _isOpened = widget.notification != null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isOpened
        ? AppNotifiableBarLayout.opened(
            notification: widget.notification,
            onClosed: () {
              setState(() {
                _isOpened = false;
              });
              widget.onClosed?.call();
            },
            child: widget.child,
          )
        : AppNotifiableBarLayout.closed(
            child: widget.child,
          );
  }
}

enum AppNotifiableBarState {
  opened,
  closed,
}

class AppNotifiableBarLayout extends StatelessWidget {
  const AppNotifiableBarLayout.opened({
    required this.notification,
    required this.child,
    super.key,
    this.onClosed,
  }) : _state = AppNotifiableBarState.opened;

  const AppNotifiableBarLayout.closed({
    required this.child,
    super.key,
    this.onClosed,
  })  : _state = AppNotifiableBarState.closed,
        notification = null;

  final AppNotifiableBarState _state;
  final NotificationViewModel? notification;
  final VoidCallback? onClosed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final notification = this.notification;
    final isOpened =
        notification != null || _state == AppNotifiableBarState.opened;

    return AnimatedContainer(
      duration: theme.durations.regular,
      decoration: BoxDecoration(
        borderRadius: theme.radius.asBorderRadius().regular,
        color: theme.colors.accent,
        boxShadow: [
          BoxShadow(
            blurRadius: isOpened ? 32 : 16,
            color: theme.colors.accent.withOpacity(0.5),
          )
        ],
      ),
      child: AnimatedSize(
        duration: theme.durations.regular,
        alignment: Alignment.bottomCenter,
        curve: Curves.easeInOut,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isOpened)
              _NotificationBody(
                notification: notification!,
                onClose: onClosed,
              ),
            child,
          ],
        ),
      ),
    );
  }
}

class _NotificationBody extends StatelessWidget {
  const _NotificationBody({
    required this.notification,
    this.onClose,
  });

  final NotificationViewModel notification;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Row(
      children: [
        AppPadding(
          padding: const AppEdgeInsets.semiSmall(),
          child: AppIcon.regular(
            notification.icon,
            color: theme.colors.accentOpposite,
          ),
        ),
        Expanded(
          child: AppPadding(
            padding: const AppEdgeInsets.symmetric(
              vertical: AppGapSize.semiSmall,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppText.title3(
                  notification.title,
                  color: theme.colors.accentOpposite,
                  maxLines: 1,
                ),
                AppText.paragraph1(
                  notification.description,
                  color: theme.colors.accentOpposite,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ),
        AppActionButton(
          icon: theme.icons.characters.dismiss,
          onTap: onClose,
        ),
        const AppGap.small(),
      ],
    );
  }
}
