import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ApodDurationsData extends XDurationsData {
  const ApodDurationsData()
      : super(
          areAnimationEnabled: true,
          regular: const Duration(milliseconds: 250),
          quick: const Duration(milliseconds: 100),
        );
}
