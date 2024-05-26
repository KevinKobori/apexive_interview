import 'package:equatable/equatable.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

abstract class NotificationsOverviewEvent extends Equatable {}

class CloseNotification extends NotificationsOverviewEvent {
  final NotificationModel? lastNotification;

  CloseNotification(this.lastNotification);

  @override
  List<Object?> get props => [
        lastNotification,
      ];
}
