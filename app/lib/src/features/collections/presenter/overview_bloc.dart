import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

// CollectionsNotifier
class CollectionsOverviewBloc
    extends Bloc<CollectionsOverviewEvent, CollectionsOverviewState> {
  CollectionsOverviewBloc() : super(CollectionsOverviewStateLoadedData.demo()) {
    on<LoadCollections>((event, emit) {
      onLoadCollections(event, emit);
    });
  }

  void onLoadCollections(
      LoadCollections event, Emitter<CollectionsOverviewState> emit) {
    emit(CollectionsOverviewStateLoadedData(
        collectionsList: event.collectionList));
  }
}
