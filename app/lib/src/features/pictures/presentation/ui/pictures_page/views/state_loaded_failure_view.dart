import 'package:flutter/widgets.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class PicturesPageStateLoadedFailureView extends StatelessWidget {
  final String failureMessage;
  final void Function() reload;

  const PicturesPageStateLoadedFailureView({
    required this.failureMessage,
    required this.reload,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: NOW
    return ApodScaffold(
      body:
          // TODO: NOW PUT IT BACK
          ApodReloadPage(
        failureMessage: failureMessage,
        reload: reload,
      ),
    );
  }
}
