import 'package:flutter/material.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

import '../base/widget.dart';

void main() {
  Widget bar(BuildContext context) {
    final metrics = Theme.of(context).extension<XMetricsData>()!;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: metrics.radius.border.small,
        color: colorScheme.onSurface,
      ),
    );
  }

  NotificationViewModel notification(BuildContext context) {
    final assets = Theme.of(context).extension<XAssetsData>()!;

    return NotificationViewModel(
      title: 'Save 50% on shields this week',
      description: 'See the offer',
      icon: assets.images.path(ApodImageKey.appLogo),
    );
  }

  testAppWidgets(
    'notifiable_bar',
    {
      'opened': Builder(
        builder: (context) {
          return ApodNotifiableBarLayout.opened(
            notification: notification(context),
            child: bar(context),
          );
        },
      ),
      'closed': Builder(
        builder: (context) {
          return ApodNotifiableBarLayout.closed(
            child: bar(context),
          );
        },
      ),
    },
  );
}
