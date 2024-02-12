import 'package:nasa_apod_core/nasa_apod_core.dart';

abstract class CollectionsOverviewState {}

class CollectionsOverviewStateLoadedData extends CollectionsOverviewState {
  final List<CollectionModel> collectionList;

  CollectionsOverviewStateLoadedData({required this.collectionList});

  factory CollectionsOverviewStateLoadedData.demo() =>
      CollectionsOverviewStateLoadedData(
        collectionList: [
          CollectionModel(
            name: 'Moon',
            pictureList: [
              PictureModel(
                copyright: 'copyright',
                date: DateTime.parse('2024-01-01'),
                explanation: 'explanation',
                hdurl: 'hdurl',
                mediaType: 'mediaType',
                serviceVersion: 'serviceVersion',
                title: 'title',
                url:
                    'https://apod.nasa.gov/apod/image/2402/Tadpoles2048original.png',
              ),
            ],
          ),
          CollectionModel(
            name: 'Galaxies',
            pictureList: [
              PictureModel(
                copyright: 'copyright',
                date: DateTime.parse('2024-01-01'),
                explanation: 'explanation',
                hdurl: 'hdurl',
                mediaType: 'mediaType',
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
