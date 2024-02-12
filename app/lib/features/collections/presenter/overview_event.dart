import 'package:nasa_apod_core/nasa_apod_core.dart';

abstract class CollectionsOverviewEvent {}

class CollectionsOverviewEventUpdateData extends CollectionsOverviewEvent {
  final List<CollectionModel> collectionList;
  CollectionsOverviewEventUpdateData(this.collectionList);
}
