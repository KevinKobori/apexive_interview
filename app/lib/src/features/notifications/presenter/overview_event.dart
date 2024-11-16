import 'package:nasa_apod_core/nasa_apod_core.dart';

abstract class NotificationsOverviewEvent {}

class CloseEvent extends NotificationsOverviewEvent {
  final NotificationModel? lastNotification;
  CloseEvent(this.lastNotification);
}
