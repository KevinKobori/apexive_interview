import 'package:flutter/widgets.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class PicturesPageStateLoadingView extends StatelessWidget {
  final PicturesPagePresenter picturesPagePresenter;

  const PicturesPageStateLoadingView({
    required this.picturesPagePresenter,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ApodScaffold(
      body: const Center(
        child: Text('PUT LOADING HERE 3'),
      ),
    );
  }
}
