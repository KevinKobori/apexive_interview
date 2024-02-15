import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';
import 'package:test_utils/test_utils.dart';

import '../base/widget.dart';

void main() async {
  const title = 'Dog';
  const date = '2024-01-01';

  testAppWidgets(
    'product_tile_test',
    {
      'idle': const ProductTileLayout.idle(
        title: title,
        date: date,
        image: kDogImage,
        aspectRatio: 1,
      ),
      'hovered': const ProductTileLayout.hovered(
        title: title,
        date: date,
        image: kDogImage,
        aspectRatio: 1,
      ),
    },
  );
}
