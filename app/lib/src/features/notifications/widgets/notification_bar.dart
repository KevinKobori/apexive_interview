import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class NotificationBar extends StatelessWidget {
  final NotificationsOverviewBloc notificationsOverviewPresenter;
  final Widget child;

  const NotificationBar({
    required this.notificationsOverviewPresenter,
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ApodTheme.of(context);
    return BlocBuilder<NotificationsOverviewBloc, NotificationsOverviewState>(
      bloc: notificationsOverviewPresenter,
      builder: (context, state) {
        if (state is NotificationsOverviewStateLoadedData) {
          return ApodNotifiableBar(
            onClosed: () => BlocProvider.of<NotificationsOverviewBloc>(context)
                .add(NotificationsOverviewEventClose(null)),
            notification: state.lastNotification != null
                ? NotificationViewModel(
                    title: state.lastNotification!.title,
                    description: state.lastNotification!.description,
                    icon: () {
                      return switch (state.lastNotification!.type) {
                        NotificationType.offer => theme.images.appLogo,
                      };
                    }(),
                  )
                : null,
            child: child,
          );
        } else {
          return Text('PUT LOADING HERE 4');
        }
      },
    );
  }
}
