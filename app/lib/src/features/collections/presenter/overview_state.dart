import 'package:nasa_apod_core/nasa_apod_core.dart';

abstract class CollectionsOverviewState {}

class CollectionsOverviewStateLoadedData extends CollectionsOverviewState {
  final List<CollectionModel> collectionsList;

  CollectionsOverviewStateLoadedData({required this.collectionsList});

  factory CollectionsOverviewStateLoadedData.demo() =>
      CollectionsOverviewStateLoadedData(
        collectionsList: [
          CollectionModel(
            name: 'Moon',
            catalog: [
              PictureModel(
                copyright: 'copyright',
                date: DateTime.parse('2024-01-01'),
                explanation: 'explanation',
                hdurl: 'hdurl',
                mediaType: MediaType.image,
                serviceVersion: 'serviceVersion',
                title: 'title',
                url:
                    'https://apod.nasa.gov/apod/image/2402/Tadpoles2048original.png',
              ),
            ],
          ),
          CollectionModel(
            name: 'Galaxies',
            catalog: [
              PictureModel(
                copyright: 'copyright',
                date: DateTime.parse('2024-01-01'),
                explanation: 'explanation',
                hdurl: 'hdurl',
                mediaType: MediaType.image,
                serviceVersion: 'serviceVersion',
                title: 'title',
                url:
                    'https://apod.nasa.gov/apod/image/2401/EarthMoon_Artemis1Saunders_1600.jpg',
              ),
            ],
          ),
        ],
      );
}
