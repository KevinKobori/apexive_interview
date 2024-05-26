import 'package:equatable/equatable.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

abstract class CollectionsOverviewEvent extends Equatable {}

class LoadCollections extends CollectionsOverviewEvent {
  final List<CollectionModel> collectionList;

  LoadCollections(this.collectionList);

  @override
  List<Object?> get props => [
        collectionList,
      ];
}
