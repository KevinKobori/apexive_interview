import 'package:nasa_apod_core/nasa_apod_core.dart';

abstract class CollectionsOverviewEvent {}

class LoadCollectionsEvent extends CollectionsOverviewEvent {
  final List<CollectionModel> collectionList;
  LoadCollectionsEvent(this.collectionList);
}
