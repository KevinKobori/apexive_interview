import 'package:flutter/material.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ApodFailureReloadView extends StatelessWidget {
  final String failureMessage;
  final void Function() onReload;

  const ApodFailureReloadView({
    required this.failureMessage,
    required this.onReload,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ApodPadding(
      padding: const ApodEdgeInsets.all(ApodSpacing.extraLarge),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ApodText.titleMedium(failureMessage),
          const ApodGap.small(),
          ApodElevatedButton(
            onPressed: onReload,
            title: I18n.strings.reload,
          )
        ],
      ),
    );
  }
}
