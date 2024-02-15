import 'package:flutter/widgets.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

export 'data/colors.dart';
export 'data/data.dart';
export 'data/durations.dart';
export 'data/form_factor.dart';
export 'data/icons.dart';
export 'data/images.dart';
export 'data/radius.dart';
export 'data/shadows.dart';
export 'data/spacing.dart';
export 'data/typography.dart';
export 'responsive_theme.dart';
export 'theme.dart';

class ApodTheme extends InheritedWidget {
  const ApodTheme({
    required this.data,
    required Widget child,
    super.key,
  }) : super(child: child);

  final ApodThemeData data;

  static ApodThemeData of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<ApodTheme>();
    return widget!.data;
  }

  @override
  bool updateShouldNotify(covariant ApodTheme oldWidget) {
    return data != oldWidget.data;
  }
}
