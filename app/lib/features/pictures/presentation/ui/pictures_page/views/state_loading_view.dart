import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class PicturesPageStateLoadingView extends StatelessWidget {
  final PicturesPagePresenter picturesPagePresenter;

  const PicturesPageStateLoadingView({
    required this.picturesPagePresenter,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
