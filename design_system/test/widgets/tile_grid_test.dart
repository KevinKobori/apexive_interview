import 'package:flutter/widgets.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';
import 'package:test_utils/test_utils.dart';

import '../base/widget.dart';

void main() async {
  testAppWidgets(
    'tile_grid',
    {
      'products': const CustomScrollView(
        slivers: [
          ApodSliverGridTile(
            children: [
              ProductTileLayout.idle(
                title: 'Dog 1',
                date: '2024-01-01',
                image: kDogImage,
                aspectRatio: 1 / 1.5,
              ),
              ProductTileLayout.idle(
                title: 'Dog 2',
                date: '2024-01-01',
                image: kDogImage,
                aspectRatio: 1 / 1,
              ),
              ProductTileLayout.idle(
                title: 'Dog 3',
                date: '2024-01-01',
                image: kDogImage,
                aspectRatio: 1 / 2,
              ),
              ProductTileLayout.idle(
                title: 'Dog 4',
                date: '2024-01-01',
                image: kDogImage,
                aspectRatio: 1 / 1.8,
              ),
            ],
          ),
        ],
      ),
    },
    baseSize: const Size(1024, 1600),
  );
}
