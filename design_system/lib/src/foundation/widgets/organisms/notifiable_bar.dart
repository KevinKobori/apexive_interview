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
    final theme = Theme.of(context).extension<ApodThemeData>()!;
    final notification = this.notification;
    final isOpened =
        notification != null || _state == ApodNotifiableBarState.opened;

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
    final theme = Theme.of(context).extension<ApodThemeData>()!;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            children: [
              ApodContainer(
                height: theme.icons.sizes.big,
                width: theme.icons.sizes.big,
                margin: const ApodEdgeInsets.semiSmall(),
                child: SvgPicture.asset(
                  'assets/images/nasa_logo.svg',
                ),
              ),
              Expanded(
                child: ApodPadding(
                  padding: const ApodEdgeInsets.symmetric(
                    vertical: ApodSpacing.semiSmall,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ApodText.title3(
                        notification.title,
                        color: theme.colors.accentOpposite,
                        maxLines: 1,
                      ),
                      ApodText.paragraph1(
                        notification.description,
                        color: theme.colors.accentOpposite,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        ApodPadding(
          padding: const ApodEdgeInsets.small(),
          child: ApodActionButton(
            icon: theme.icons.characters.dismiss,
            onTap: onClose,
          ),
        ),
      ],
    );
  }
}
