import 'package:flutter/widgets.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

import '../base/widget.dart';

void main() {
  Widget bar(BuildContext context) {
    final theme = ApodTheme.of(context);
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: theme.radius.asBorderRadius().small,
        color: theme.colors.actionBarBackground,
      ),
    );
  }

  NotificationViewModel notification(BuildContext context) {
    final theme = ApodTheme.of(context);
    return NotificationViewModel(
      title: 'Save 50% on shields this week',
      description: 'See the offer',
      icon: theme.icons.characters.tag,
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
