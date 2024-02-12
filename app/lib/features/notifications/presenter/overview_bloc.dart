import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

// NotificationsNotifier
class NotificationsOverviewBloc
    extends Bloc<NotificationsOverviewEvent, NotificationsOverviewState> {
  NotificationsOverviewBloc()
      : super(NotificationsOverviewStateLoadedData.demo()) {
    on<NotificationsOverviewEventClose>((event, emit) {
      emit(NotificationsOverviewStateLoadedData(
          lastNotification: event.lastNotification));
    });
  }
}
