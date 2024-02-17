import 'package:nasa_apod_core/nasa_apod_core.dart';

abstract class NotificationsOverviewState {}

class NotificationsOverviewStateLoadedData extends NotificationsOverviewState {
  final NotificationModel? lastNotification;

  NotificationsOverviewStateLoadedData({required this.lastNotification});

  factory NotificationsOverviewStateLoadedData.demo() =>
      NotificationsOverviewStateLoadedData(
        lastNotification: NotificationModel(
          title: 'See the news',
          description:
              'NASA launches satellite that will study Earth’s “vital signs”',
          type: NotificationType.offer,
        ),
      );
}
