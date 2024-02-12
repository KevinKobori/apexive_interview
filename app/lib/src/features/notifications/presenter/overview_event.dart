import 'package:nasa_apod_core/nasa_apod_core.dart';

abstract class NotificationsOverviewEvent {}

class NotificationsOverviewEventClose extends NotificationsOverviewEvent {
  final NotificationModel? lastNotification;
  NotificationsOverviewEventClose(this.lastNotification);
}
