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
    final metrics = Theme.of(context).extension<XMetricsData>()!;
    final textTheme = Theme.of(context).textTheme;

    return metrics.spacings.edgeInsets.paddings.allExtraLarge(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            failureMessage,
            style: textTheme.titleMedium!,
          ),
          metrics.spacings.gaps.small,
          ApodElevatedButton(
            onPressed: onReload,
            child: Text(I18n.strings.reload),
          )
        ],
      ),
    );
  }
}
