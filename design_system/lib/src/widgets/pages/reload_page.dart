// TODO: NOW - PUT IT IN DESIGN SYSTEM PACKAGE
import 'package:flutter/widgets.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ApodReloadPage extends StatelessWidget {
  final String failureMessage;
  final void Function() reload;

  const ApodReloadPage({
    required this.failureMessage,
    required this.reload,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ApodPadding(
      padding: const ApodEdgeInsets.all(ApodSpacings.extraLarge),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(failureMessage,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center),
          const ApodGap.small(),
          ApodTextButton(
            onTap: reload,
            title: I18n.strings.reload,
          )
        ],
      ),
    );
  }
}
