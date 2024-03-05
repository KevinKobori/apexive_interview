import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ApodNotifiableBar extends StatefulWidget {
  const ApodNotifiableBar({
    required this.child,
    super.key,
    this.notification,
    this.onClosed,
  });

  final NotificationViewModel? notification;
  final VoidCallback? onClosed;
  final Widget child;

  @override
  State<ApodNotifiableBar> createState() => _ApodNotifiableBarState();
}

class _ApodNotifiableBarState extends State<ApodNotifiableBar> {
  late bool _isOpened = widget.notification != null;

  @override
  void didUpdateWidget(covariant ApodNotifiableBar oldWidget) {
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
        ? ApodNotifiableBarLayout.opened(
            notification: widget.notification,
            onClosed: () {
              setState(() {
                _isOpened = false;
              });
              widget.onClosed?.call();
            },
            child: widget.child,
          )
        : ApodNotifiableBarLayout.closed(
            child: widget.child,
          );
  }
}

enum ApodNotifiableBarState {
  opened,
  closed,
}

class ApodNotifiableBarLayout extends StatelessWidget {
  const ApodNotifiableBarLayout.opened({
    required this.notification,
    required this.child,
    super.key,
    this.onClosed,
  }) : _state = ApodNotifiableBarState.opened;

  const ApodNotifiableBarLayout.closed({
    required this.child,
    super.key,
    this.onClosed,
  })  : _state = ApodNotifiableBarState.closed,
        notification = null;

  final ApodNotifiableBarState _state;
  final NotificationViewModel? notification;
  final VoidCallback? onClosed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final metrics = Theme.of(context).extension<XMetricsData>()!;
    final colorScheme = Theme.of(context).colorScheme;
    final notification = this.notification;
    final isOpened =
        notification != null || _state == ApodNotifiableBarState.opened;

    return AnimatedContainer(
      duration: metrics.durations.regular,
      decoration: BoxDecoration(
        borderRadius: metrics.radius.border.semiSmall,
        color: colorScheme.primary,
        boxShadow: [
          BoxShadow(
            blurRadius: isOpened ? 32 : 16,
            color: colorScheme.primary.withOpacity(0.5),
          )
        ],
      ),
      child: AnimatedSize(
        duration: metrics.durations.regular,
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
    final assets = Theme.of(context).extension<ApodAssetsData>()!;
    final colorScheme = Theme.of(context).colorScheme;
    final metrics = Theme.of(context).extension<XMetricsData>()!;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            children: [
              ApodContainer(
                height: (assets.icons.sizes as ApodIconSizesData).semiLarge,
                width: (assets.icons.sizes as ApodIconSizesData).semiLarge,
                margin: metrics.spacings.edgeInsets.allSemiSmall,
                child: SvgPicture.asset(
                  'assets/images/nasa_logo.svg',
                ),
              ),
              Expanded(
                child: metrics.spacings.edgeInsets.paddings.verticalSemiSmall(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        notification.title,
                        style: textTheme.titleSmall!.copyWith(
                          color: colorScheme.onPrimary,
                        ),
                      ),
                      Text(
                        notification.description,
                        style: textTheme.bodyLarge!.copyWith(
                          color: colorScheme.onPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        metrics.spacings.edgeInsets.paddings.allSmall(
          child: ApodDismissButton(onClose: onClose),
        ),
      ],
    );
  }
}
