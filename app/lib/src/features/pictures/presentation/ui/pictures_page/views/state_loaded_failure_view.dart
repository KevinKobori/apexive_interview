import 'package:flutter/widgets.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class PicturesPageStateLoadedFailureView extends StatelessWidget {
  final String failureMessage;
  final void Function() onReload;

  const PicturesPageStateLoadedFailureView({
    required this.failureMessage,
    required this.onReload,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ApodScaffold(
      body: ApodFailureReloadView(
        failureMessage: failureMessage,
        onReload: onReload,
      ),
    );
  }
}
