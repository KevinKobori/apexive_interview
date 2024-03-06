import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

// NotificationsNotifier
class NotificationsOverviewBloc
    extends Bloc<NotificationsOverviewEvent, NotificationsOverviewState> {
  NotificationsOverviewBloc()
      : super(NotificationsOverviewStateLoadedData.demo()) {
    on<CloseEvent>((event, emit) {
      onClose(event, emit);
    });
  }

  void onClose(CloseEvent event, Emitter<NotificationsOverviewState> emit) {
    emit(NotificationsOverviewStateLoadedData(
        lastNotification: event.lastNotification));
  }
}
